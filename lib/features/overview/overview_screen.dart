import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/cqrs/mediator.dart';
import '../../core/localization/localization.dart';
import '../../core/widgets/care_cache_mark.dart';
import '../../core/widgets/care_page.dart';
import '../../core/widgets/empty_state.dart';
import '../inventory/supply.dart';
import '../schedule/care_task.dart';
import 'overview_view_model.dart';

class OverviewScreen extends StatefulWidget {
  const OverviewScreen({required this.mediator, super.key});

  final Mediator mediator;

  @override
  State<OverviewScreen> createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  late final OverviewViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = OverviewViewModel(widget.mediator);
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
        titleSpacing: 20,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const CareCacheMark(size: 30),
            const SizedBox(width: 10),
            Text(context.l10n.appName),
          ],
        ),
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
            children: <Widget>[
              Text(
                context.l10n.overviewTitle,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w900,
                  letterSpacing: -0.8,
                ),
              ),
              const SizedBox(height: 20),
              if (_viewModel.loading)
                const Center(
                  child: Padding(padding: EdgeInsets.all(40), child: CircularProgressIndicator()),
                )
              else if (_viewModel.error != null)
                EmptyState(
                  icon: Icons.error_outline_rounded,
                  title: context.l10n.unexpectedError,
                  description: context.l10n.tryAgain,
                )
              else if (_viewModel.isEmpty)
                const _EmptyOverview()
              else
                _PopulatedOverview(viewModel: _viewModel),
            ],
          );
        },
      ),
    );
  }
}

class _EmptyOverview extends StatelessWidget {
  const _EmptyOverview();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
          context.l10n.getStarted,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 12),
        _AdaptiveGrid(
          minTileWidth: 160,
          mainAxisExtent: 116,
          maxColumns: 4,
          children: <Widget>[
            _ActionTile(
              icon: Icons.qr_code_scanner_rounded,
              label: context.l10n.scanSupply,
              emphasized: true,
              onTap: () => context.push('/scan'),
            ),
            _ActionTile(
              icon: Icons.inventory_2_outlined,
              label: context.l10n.addSupply,
              onTap: () => context.push('/inventory/new'),
            ),
            _ActionTile(
              icon: Icons.devices_other_outlined,
              label: context.l10n.addDevice,
              onTap: () => context.push('/devices/new'),
            ),
            _ActionTile(
              icon: Icons.event_repeat_rounded,
              label: context.l10n.addTask,
              onTap: () => context.push('/schedule/new'),
            ),
          ],
        ),
      ],
    );
  }
}

class _PopulatedOverview extends StatelessWidget {
  const _PopulatedOverview({required this.viewModel});

  final OverviewViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        _AttentionSection(viewModel: viewModel),
        const SizedBox(height: 26),
        Text(
          context.l10n.statusSummary,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 12),
        _AdaptiveGrid(
          minTileWidth: 160,
          mainAxisExtent: 116,
          maxColumns: 4,
          children: <Widget>[
            _MetricTile(
              icon: Icons.inventory_2_outlined,
              value: viewModel.supplyCount,
              label: context.l10n.navigationInventory,
              onTap: () => context.go('/inventory'),
            ),
            _MetricTile(
              icon: Icons.shopping_bag_outlined,
              value: viewModel.lowStock.length,
              label: context.l10n.lowStock,
              warning: viewModel.lowStock.isNotEmpty,
              onTap: () => context.go('/inventory'),
            ),
            _MetricTile(
              icon: Icons.event_repeat_outlined,
              value: viewModel.scheduledTaskCount,
              label: context.l10n.scheduled,
              onTap: () => context.go('/schedule'),
            ),
            _MetricTile(
              icon: Icons.notification_important_outlined,
              value: viewModel.overdue.length,
              label: context.l10n.overdue,
              warning: viewModel.overdue.isNotEmpty,
              onTap: () => context.go('/schedule'),
            ),
          ],
        ),
        const SizedBox(height: 26),
        Text(
          context.l10n.quickActions,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: <Widget>[
            FilledButton.icon(
              onPressed: () => context.push('/scan'),
              icon: const Icon(Icons.qr_code_scanner_rounded),
              label: Text(context.l10n.scanSupply),
            ),
            OutlinedButton.icon(
              onPressed: () => context.push('/inventory/new'),
              icon: const Icon(Icons.add_rounded),
              label: Text(context.l10n.addSupply),
            ),
            OutlinedButton.icon(
              onPressed: () => context.push('/schedule/new'),
              icon: const Icon(Icons.event_repeat_rounded),
              label: Text(context.l10n.addTask),
            ),
          ],
        ),
        if (viewModel.upcoming.isNotEmpty) ...<Widget>[
          const SizedBox(height: 28),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  context.l10n.nextUp,
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
                ),
              ),
              TextButton(
                onPressed: () => context.go('/schedule'),
                child: Text(context.l10n.viewAll),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ...viewModel.upcoming.map(
            (task) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: _NextTask(task: task),
            ),
          ),
        ],
      ],
    );
  }
}

class _AttentionSection extends StatelessWidget {
  const _AttentionSection({required this.viewModel});

  final OverviewViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    if (viewModel.nothingNeedsAttention) {
      return Card(
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          leading: DecoratedBox(
            decoration: BoxDecoration(
              color: colors.primaryContainer,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Padding(
              padding: const EdgeInsets.all(11),
              child: Icon(Icons.check_rounded, color: colors.onPrimaryContainer),
            ),
          ),
          title: Text(
            context.l10n.nothingNeedsAttention,
            style: const TextStyle(fontWeight: FontWeight.w800),
          ),
          subtitle: Text(context.l10n.nothingNeedsAttentionDescription),
        ),
      );
    }

    final rows = <Widget>[
      ...viewModel.lowStock.take(3).map((supply) => _SupplyAttentionRow(supply: supply)),
      ...viewModel.overdue.take(3).map((task) => _TaskAttentionRow(task: task)),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
          context.l10n.needsAttention,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 12),
        Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: <Widget>[
              for (var index = 0; index < rows.length; index++) ...<Widget>[
                rows[index],
                if (index < rows.length - 1) const Divider(height: 1),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class _SupplyAttentionRow extends StatelessWidget {
  const _SupplyAttentionRow({required this.supply});

  final SupplyItem supply;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
      leading: const Icon(Icons.shopping_bag_outlined),
      title: Text(supply.name, style: const TextStyle(fontWeight: FontWeight.w700)),
      subtitle: Text(
        '${context.l10n.lowStock} · '
        '${context.l10n.quantityValue(supply.quantityOnHand, supply.unitLabel)}',
      ),
      trailing: const Icon(Icons.chevron_right_rounded),
      onTap: () => context.push('/inventory/${supply.id}'),
    );
  }
}

class _TaskAttentionRow extends StatelessWidget {
  const _TaskAttentionRow({required this.task});

  final CareTask task;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
      leading: const Icon(Icons.notification_important_outlined),
      title: Text(task.title, style: const TextStyle(fontWeight: FontWeight.w700)),
      subtitle: Text(context.l10n.dueDateValue(context.careDate(task.nextDueAt))),
      trailing: const Icon(Icons.chevron_right_rounded),
      onTap: () => context.push('/schedule/${task.id}'),
    );
  }
}

class _ActionTile extends StatelessWidget {
  const _ActionTile({
    required this.icon,
    required this.label,
    required this.onTap,
    this.emphasized = false,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool emphasized;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final background = emphasized ? colors.primaryContainer : colors.surface;
    final foreground = emphasized ? colors.onPrimaryContainer : colors.onSurface;
    return Card(
      color: background,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Icon(icon, color: foreground),
              const Spacer(),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      label,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: foreground, fontWeight: FontWeight.w800),
                    ),
                  ),
                  Icon(Icons.arrow_forward_rounded, size: 18, color: foreground),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MetricTile extends StatelessWidget {
  const _MetricTile({
    required this.icon,
    required this.value,
    required this.label,
    required this.onTap,
    this.warning = false,
  });

  final IconData icon;
  final int value;
  final String label;
  final VoidCallback onTap;
  final bool warning;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final accent = warning ? colors.secondary : colors.primary;
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(icon, color: accent, size: 22),
                  const Spacer(),
                  const Icon(Icons.chevron_right_rounded, size: 20),
                ],
              ),
              const Spacer(),
              Text(
                value.toString(),
                style: Theme.of(
                  context,
                ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w900),
              ),
              Text(label, style: TextStyle(color: colors.onSurfaceVariant)),
            ],
          ),
        ),
      ),
    );
  }
}

class _AdaptiveGrid extends StatelessWidget {
  const _AdaptiveGrid({
    required this.children,
    required this.minTileWidth,
    required this.mainAxisExtent,
    required this.maxColumns,
  });

  final List<Widget> children;
  final double minTileWidth;
  final double mainAxisExtent;
  final int maxColumns;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final columns = (constraints.maxWidth / minTileWidth).floor().clamp(1, maxColumns);
        return GridView.count(
          crossAxisCount: columns,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          mainAxisExtent: mainAxisExtent,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: children,
        );
      },
    );
  }
}

class _NextTask extends StatelessWidget {
  const _NextTask({required this.task});

  final CareTask task;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.event_repeat_rounded),
        title: Text(task.title, style: const TextStyle(fontWeight: FontWeight.w700)),
        subtitle: Text(context.l10n.dueDateValue(context.careDate(task.nextDueAt))),
        trailing: const Icon(Icons.chevron_right_rounded),
        onTap: () => context.push('/schedule/${task.id}'),
      ),
    );
  }
}
