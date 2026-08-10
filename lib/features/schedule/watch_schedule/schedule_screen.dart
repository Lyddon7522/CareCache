import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/cqrs/mediator.dart';
import '../../../core/localization/localization.dart';
import '../../../core/widgets/care_page.dart';
import '../../../core/widgets/empty_state.dart';
import '../../../core/widgets/status_pill.dart';
import '../care_task.dart';
import '../schedule_localization.dart';
import 'schedule_view_model.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({required this.mediator, super.key});

  final Mediator mediator;

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  late final ScheduleViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = ScheduleViewModel(widget.mediator);
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () => context.push('/settings'),
            tooltip: context.l10n.settings,
            icon: const Icon(Icons.settings_outlined),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: AnimatedBuilder(
        animation: _viewModel,
        builder: (context, _) {
          return CarePageBody(
            navigationIndex: 2,
            children: <Widget>[
              CarePageHeader(
                title: context.l10n.scheduleTitle,
                subtitle: context.l10n.scheduleSubtitle,
                trailing: IconButton.filled(
                  onPressed: () => context.push('/schedule/new'),
                  tooltip: context.l10n.addTask,
                  icon: const Icon(Icons.add_rounded),
                ),
              ),
              const SizedBox(height: 24),
              if (_viewModel.loading)
                const Center(
                  child: Padding(padding: EdgeInsets.all(32), child: CircularProgressIndicator()),
                )
              else if (_viewModel.error != null)
                EmptyState(
                  icon: Icons.error_outline_rounded,
                  title: context.l10n.unexpectedError,
                  description: context.l10n.tryAgain,
                )
              else if (_viewModel.tasks.isEmpty)
                EmptyState(
                  icon: Icons.event_repeat_rounded,
                  title: context.l10n.scheduleEmpty,
                  description: context.l10n.scheduleEmptyDescription,
                  action: FilledButton.icon(
                    onPressed: () => context.push('/schedule/new'),
                    icon: const Icon(Icons.add_rounded),
                    label: Text(context.l10n.addTask),
                  ),
                )
              else
                ..._buildGroups(context, _viewModel.tasks),
            ],
          );
        },
      ),
    );
  }

  List<Widget> _buildGroups(BuildContext context, List<CareTask> tasks) {
    final now = DateTime.now();
    final startToday = DateTime(now.year, now.month, now.day);
    final endToday = startToday.add(const Duration(days: 1));
    final endWeek = startToday.add(const Duration(days: 8));
    final groups = <(String, List<CareTask>)>[
      (
        context.l10n.overdue,
        tasks.where((task) => task.nextDueAt.toLocal().isBefore(startToday)).toList(),
      ),
      (
        context.l10n.today,
        tasks
            .where(
              (task) =>
                  !task.nextDueAt.toLocal().isBefore(startToday) &&
                  task.nextDueAt.toLocal().isBefore(endToday),
            )
            .toList(),
      ),
      (
        context.l10n.nextSevenDays,
        tasks
            .where(
              (task) =>
                  !task.nextDueAt.toLocal().isBefore(endToday) &&
                  task.nextDueAt.toLocal().isBefore(endWeek),
            )
            .toList(),
      ),
      (
        context.l10n.later,
        tasks.where((task) => !task.nextDueAt.toLocal().isBefore(endWeek)).toList(),
      ),
    ];
    return groups
        .where((group) => group.$2.isNotEmpty)
        .expand((group) {
          return <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 10),
              child: Text(
                group.$1,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
              ),
            ),
            ...group.$2.map(
              (task) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _TaskCard(
                  task: task,
                  onOpen: () => context.push('/schedule/${task.id}'),
                  onComplete: () => _complete(task),
                ),
              ),
            ),
            const SizedBox(height: 8),
          ];
        })
        .toList(growable: false);
  }

  Future<void> _complete(CareTask task) async {
    try {
      await _viewModel.complete(task);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.l10n.taskCompleted)),
        );
      }
    } on Object {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.l10n.unexpectedError)),
        );
      }
    }
  }
}

class _TaskCard extends StatelessWidget {
  const _TaskCard({required this.task, required this.onOpen, required this.onComplete});

  final CareTask task;
  final VoidCallback onOpen;
  final VoidCallback onComplete;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final overdue = task.isOverdueAt(DateTime.now());
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onOpen,
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Row(
            children: <Widget>[
              DecoratedBox(
                decoration: BoxDecoration(
                  color: overdue ? colors.errorContainer : colors.primaryContainer,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Icon(
                    _iconFor(task.kind),
                    color: overdue ? colors.onErrorContainer : colors.onPrimaryContainer,
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      task.title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Wrap(
                      spacing: 8,
                      runSpacing: 6,
                      children: <Widget>[
                        StatusPill(
                          label: task.kind.label(context.l10n),
                          icon: _iconFor(task.kind),
                        ),
                        StatusPill(
                          label: context.l10n.dueDateValue(context.careDate(task.nextDueAt)),
                          icon: Icons.calendar_today_outlined,
                          tone: overdue ? StatusTone.danger : StatusTone.neutral,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              FilledButton.tonalIcon(
                onPressed: onComplete,
                icon: const Icon(Icons.check_rounded),
                label: Text(context.l10n.completeTask),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

IconData _iconFor(CareTaskKind kind) => switch (kind) {
  CareTaskKind.clean => Icons.cleaning_services_outlined,
  CareTaskKind.inspect => Icons.search_rounded,
  CareTaskKind.replace => Icons.autorenew_rounded,
  CareTaskKind.reorder => Icons.shopping_bag_outlined,
  CareTaskKind.charge => Icons.battery_charging_full_rounded,
  CareTaskKind.custom => Icons.event_repeat_rounded,
};
