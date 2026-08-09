import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../core/localization/localization.dart';
import '../../core/theme/care_theme.dart';
import '../inventory/supply.dart';
import '../schedule/care_task.dart';
import '../schedule/schedule_localization.dart';
import 'overview_view_model.dart';

class OverviewDashboard extends StatelessWidget {
  const OverviewDashboard({required this.viewModel, super.key});

  final OverviewViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        _StatusHero(viewModel: viewModel),
        if (!viewModel.nothingNeedsAttention) ...<Widget>[
          const SizedBox(height: 28),
          _SectionHeader(title: context.l10n.needsAttention),
          const SizedBox(height: 12),
          _AttentionList(viewModel: viewModel),
        ],
        const SizedBox(height: 28),
        _UpcomingSection(tasks: viewModel.upcoming),
        const SizedBox(height: 28),
        _SnapshotSection(viewModel: viewModel),
        const SizedBox(height: 28),
        const _QuickActionsSection(),
      ],
    );
  }
}

class _StatusHero extends StatelessWidget {
  const _StatusHero({required this.viewModel});

  final OverviewViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final isEmpty = viewModel.isEmpty;
    final hasAttention = viewModel.attentionCount > 0;
    final statusIcon = switch ((isEmpty, hasAttention)) {
      (true, _) => Icons.add_circle_outline_rounded,
      (false, true) => Icons.priority_high_rounded,
      (false, false) => Icons.check_circle_outline_rounded,
    };
    final status = switch ((isEmpty, hasAttention)) {
      (true, _) => context.l10n.getStarted,
      (false, true) => context.l10n.needsAttention,
      (false, false) => context.l10n.nothingNeedsAttention,
    };
    final title = switch ((isEmpty, hasAttention)) {
      (true, _) => context.l10n.trackFirstSupply,
      (false, true) => context.l10n.attentionCount(viewModel.attentionCount),
      (false, false) => context.l10n.everythingOnTrack,
    };
    final description = switch ((isEmpty, hasAttention)) {
      (true, _) => context.l10n.trackFirstSupplyDescription,
      (false, true) => context.l10n.attentionDescription,
      (false, false) => context.l10n.nothingNeedsAttentionDescription,
    };

    return Container(
      key: const Key('overview-status-hero'),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[CareColors.primaryStrong, CareColors.primary],
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: CareColors.primary.withValues(alpha: 0.24),
            blurRadius: 28,
            offset: const Offset(0, 14),
          ),
        ],
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final showArtwork = constraints.maxWidth >= 560;
          return Stack(
            children: <Widget>[
              const Positioned.fill(child: ExcludeSemantics(child: _HeroPattern())),
              if (showArtwork)
                Positioned(
                  right: 30,
                  bottom: 28,
                  child: const ExcludeSemantics(child: _HeroArtwork()),
                ),
              Padding(
                padding: const EdgeInsets.all(24),
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: showArtwork ? 520 : double.infinity),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.14),
                          borderRadius: BorderRadius.circular(999),
                          border: Border.all(color: Colors.white.withValues(alpha: 0.16)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Icon(statusIcon, color: Colors.white, size: 17),
                              const SizedBox(width: 7),
                              Flexible(
                                child: Text(
                                  status,
                                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),
                      Text(
                        title,
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          height: 1.08,
                          letterSpacing: -1,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        description,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.white.withValues(alpha: 0.84),
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 22),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: <Widget>[
                          FilledButton.icon(
                            style: FilledButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: CareColors.primaryStrong,
                              shadowColor: Colors.black.withValues(alpha: 0.18),
                            ),
                            onPressed: () => context.push('/scan'),
                            icon: const Icon(Icons.qr_code_scanner_rounded),
                            label: Text(context.l10n.scanSupply),
                          ),
                          TextButton.icon(
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              minimumSize: const Size(48, 52),
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              textStyle: const TextStyle(fontWeight: FontWeight.w800),
                            ),
                            onPressed: () => context.push('/inventory/new'),
                            icon: const Icon(Icons.add_rounded),
                            label: Text(context.l10n.addSupply),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _HeroPattern extends StatelessWidget {
  const _HeroPattern();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: _HeroPatternPainter());
  }
}

class _HeroPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final linePaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.10)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;
    final fillPaint = Paint()..color = Colors.white.withValues(alpha: 0.045);
    canvas.drawCircle(Offset(size.width * 0.92, size.height * 0.18), 92, linePaint);
    canvas.drawCircle(Offset(size.width * 0.92, size.height * 0.18), 54, fillPaint);
    canvas.drawCircle(Offset(size.width * 0.74, size.height * 1.02), 104, linePaint);
    canvas.drawCircle(Offset(size.width * 0.07, size.height * 0.03), 42, linePaint);
  }

  @override
  bool shouldRepaint(_HeroPatternPainter oldDelegate) => false;
}

class _HeroArtwork extends StatelessWidget {
  const _HeroArtwork();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SizedBox(
      width: 174,
      height: 122,
      child: Stack(
        children: <Widget>[
          const Positioned(
            left: 8,
            bottom: 8,
            child: _ArtworkDisc(icon: Icons.inventory_2_rounded, size: 76),
          ),
          const Positioned(
            right: 8,
            bottom: 0,
            child: _ArtworkDisc(icon: Icons.event_repeat_rounded, size: 88),
          ),
          Positioned(
            top: 0,
            left: 66,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: colors.secondaryContainer,
                borderRadius: BorderRadius.circular(999),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.12),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: SizedBox(
                width: 52,
                height: 52,
                child: Icon(
                  Icons.qr_code_scanner_rounded,
                  color: colors.onSecondaryContainer,
                  size: 26,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ArtworkDisc extends StatelessWidget {
  const _ArtworkDisc({required this.icon, required this.size});

  final IconData icon;
  final double size;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.94),
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.14),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: SizedBox(
        width: size,
        height: size,
        child: Icon(icon, color: CareColors.primaryStrong, size: size * 0.42),
      ),
    );
  }
}

class _AttentionList extends StatelessWidget {
  const _AttentionList({required this.viewModel});

  final OverviewViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final rows = <Widget>[
      ...viewModel.lowStock.take(3).map((supply) => _SupplyAttentionRow(supply: supply)),
      ...viewModel.overdue.take(3).map((task) => _TaskAttentionRow(task: task)),
    ];
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: <Widget>[
          for (var index = 0; index < rows.length; index++) ...<Widget>[
            rows[index],
            if (index < rows.length - 1) const Divider(height: 1, indent: 72),
          ],
        ],
      ),
    );
  }
}

class _SupplyAttentionRow extends StatelessWidget {
  const _SupplyAttentionRow({required this.supply});

  final SupplyItem supply;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
      leading: _IconBadge(
        icon: Icons.inventory_2_outlined,
        background: Theme.of(context).colorScheme.secondaryContainer,
        foreground: Theme.of(context).colorScheme.onSecondaryContainer,
      ),
      title: Text(supply.name, style: const TextStyle(fontWeight: FontWeight.w800)),
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
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
      leading: _IconBadge(
        icon: _taskIcon(task.kind),
        background: Theme.of(context).colorScheme.errorContainer,
        foreground: Theme.of(context).colorScheme.onErrorContainer,
      ),
      title: Text(task.title, style: const TextStyle(fontWeight: FontWeight.w800)),
      subtitle: Text(context.l10n.dueDateValue(context.careDate(task.nextDueAt))),
      trailing: const Icon(Icons.chevron_right_rounded),
      onTap: () => context.push('/schedule/${task.id}'),
    );
  }
}

class _UpcomingSection extends StatelessWidget {
  const _UpcomingSection({required this.tasks});

  final List<CareTask> tasks;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        _SectionHeader(
          title: context.l10n.upcomingReminders,
          actionLabel: context.l10n.viewAll,
          onAction: () => context.go('/schedule'),
        ),
        const SizedBox(height: 12),
        if (tasks.isEmpty)
          const _EmptyUpcomingCard()
        else ...<Widget>[
          _FeaturedTaskCard(task: tasks.first),
          for (final task in tasks.skip(1)) ...<Widget>[
            const SizedBox(height: 10),
            _CompactTaskCard(task: task),
          ],
        ],
      ],
    );
  }
}

class _EmptyUpcomingCard extends StatelessWidget {
  const _EmptyUpcomingCard();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Card(
      key: const Key('upcoming-empty-card'),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => context.push('/schedule/new'),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Row(
            children: <Widget>[
              _IconBadge(
                icon: Icons.event_repeat_outlined,
                background: colors.secondaryContainer,
                foreground: colors.onSecondaryContainer,
                size: 52,
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      context.l10n.noUpcomingReminders,
                      style: Theme.of(
                        context,
                      ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      context.l10n.noUpcomingRemindersDescription,
                      style: TextStyle(color: colors.onSurfaceVariant),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Icon(Icons.add_circle_rounded, color: colors.secondary, size: 30),
            ],
          ),
        ),
      ),
    );
  }
}

class _FeaturedTaskCard extends StatelessWidget {
  const _FeaturedTaskCard({required this.task});

  final CareTask task;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final localDueAt = task.nextDueAt.toLocal();
    final locale = Localizations.localeOf(context).toString();
    return Card(
      key: const Key('next-reminder-card'),
      color: colors.secondaryContainer,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
      child: InkWell(
        onTap: () => context.push('/schedule/${task.id}'),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(
                          task.remindersEnabled
                              ? Icons.notifications_active_outlined
                              : _taskIcon(task.kind),
                          color: colors.onSecondaryContainer,
                          size: 18,
                        ),
                        const SizedBox(width: 7),
                        Flexible(
                          child: Text(
                            task.kind.label(context.l10n).toUpperCase(),
                            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                              color: colors.onSecondaryContainer,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 0.7,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 13),
                    Text(
                      task.title,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: colors.onSecondaryContainer,
                        fontWeight: FontWeight.w900,
                        letterSpacing: -0.4,
                      ),
                    ),
                    const SizedBox(height: 7),
                    Text(
                      context.l10n.dueDateValue(context.careDate(task.nextDueAt)),
                      style: TextStyle(
                        color: colors.onSecondaryContainer.withValues(alpha: 0.82),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 13),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.repeat_rounded,
                          size: 17,
                          color: colors.onSecondaryContainer,
                        ),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            context.l10n.repeatsEvery(
                              context.l10n.daysValue(task.cadenceDays),
                            ),
                            style: TextStyle(
                              color: colors.onSecondaryContainer,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              _CalendarBadge(
                month: DateFormat.MMM(locale).format(localDueAt),
                day: DateFormat.d(locale).format(localDueAt),
                foreground: colors.onSecondaryContainer,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CalendarBadge extends StatelessWidget {
  const _CalendarBadge({required this.month, required this.day, required this.foreground});

  final String month;
  final String day;
  final Color foreground;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.72),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: foreground.withValues(alpha: 0.12)),
      ),
      child: SizedBox(
        width: 72,
        height: 82,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FittedBox(
                child: Text(
                  month.toUpperCase(),
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: foreground,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0.8,
                  ),
                ),
              ),
              const SizedBox(height: 1),
              FittedBox(
                child: Text(
                  day,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: foreground,
                    fontWeight: FontWeight.w900,
                    height: 1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CompactTaskCard extends StatelessWidget {
  const _CompactTaskCard({required this.task});

  final CareTask task;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Card(
      clipBehavior: Clip.antiAlias,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
        leading: _IconBadge(
          icon: _taskIcon(task.kind),
          background: colors.primaryContainer,
          foreground: colors.onPrimaryContainer,
        ),
        title: Text(task.title, style: const TextStyle(fontWeight: FontWeight.w800)),
        subtitle: Text(context.l10n.dueDateValue(context.careDate(task.nextDueAt))),
        trailing: const Icon(Icons.chevron_right_rounded),
        onTap: () => context.push('/schedule/${task.id}'),
      ),
    );
  }
}

class _SnapshotSection extends StatelessWidget {
  const _SnapshotSection({required this.viewModel});

  final OverviewViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        _SectionHeader(title: context.l10n.inventorySnapshot),
        const SizedBox(height: 12),
        _ResponsivePair(
          first: _SnapshotCard(
            icon: Icons.inventory_2_rounded,
            value: viewModel.supplyCount,
            label: context.l10n.navigationInventory,
            detail: context.l10n.lowStockCount(viewModel.lowStock.length),
            background: colors.primaryContainer,
            foreground: colors.onPrimaryContainer,
            onTap: () => context.go('/inventory'),
          ),
          second: _SnapshotCard(
            icon: Icons.event_repeat_rounded,
            value: viewModel.scheduledTaskCount,
            label: context.l10n.navigationSchedule,
            detail: context.l10n.overdueCount(viewModel.overdue.length),
            background: colors.secondaryContainer,
            foreground: colors.onSecondaryContainer,
            onTap: () => context.go('/schedule'),
          ),
        ),
      ],
    );
  }
}

class _ResponsivePair extends StatelessWidget {
  const _ResponsivePair({required this.first, required this.second});

  final Widget first;
  final Widget second;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 320) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[first, const SizedBox(height: 12), second],
          );
        }
        return IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(child: first),
              const SizedBox(width: 12),
              Expanded(child: second),
            ],
          ),
        );
      },
    );
  }
}

class _SnapshotCard extends StatelessWidget {
  const _SnapshotCard({
    required this.icon,
    required this.value,
    required this.label,
    required this.detail,
    required this.background,
    required this.foreground,
    required this.onTap,
  });

  final IconData icon;
  final int value;
  final String label;
  final String detail;
  final Color background;
  final Color foreground;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return _TactileSurface(
      semanticsLabel: '$label, $value, $detail',
      onTap: onTap,
      decoration: BoxDecoration(color: background, borderRadius: BorderRadius.circular(24)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 158),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(icon, color: foreground, size: 23),
                  const Spacer(),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: foreground.withValues(alpha: 0.10),
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Icon(Icons.arrow_outward_rounded, color: foreground, size: 17),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Text(
                value.toString(),
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: foreground,
                  fontWeight: FontWeight.w900,
                  height: 1,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                label,
                style: Theme.of(
                  context,
                ).textTheme.titleSmall?.copyWith(color: foreground, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 3),
              Text(
                detail,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: foreground.withValues(alpha: 0.76),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _QuickActionsSection extends StatelessWidget {
  const _QuickActionsSection();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final actions = <Widget>[
      _QuickActionCard(
        icon: Icons.qr_code_scanner_rounded,
        label: context.l10n.scanSupply,
        foreground: Colors.white,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[CareColors.primaryStrong, CareColors.primary],
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: CareColors.primary.withValues(alpha: 0.20),
              blurRadius: 18,
              offset: const Offset(0, 9),
            ),
          ],
        ),
        onTap: () => context.push('/scan'),
      ),
      _QuickActionCard(
        icon: Icons.add_shopping_cart_rounded,
        label: context.l10n.addSupply,
        foreground: colors.onPrimaryContainer,
        decoration: BoxDecoration(
          color: colors.primaryContainer,
          borderRadius: BorderRadius.circular(24),
        ),
        onTap: () => context.push('/inventory/new'),
      ),
      _QuickActionCard(
        icon: Icons.event_repeat_rounded,
        label: context.l10n.addTask,
        foreground: colors.onSecondaryContainer,
        decoration: BoxDecoration(
          color: colors.secondaryContainer,
          borderRadius: BorderRadius.circular(24),
        ),
        onTap: () => context.push('/schedule/new'),
      ),
      _QuickActionCard(
        icon: Icons.devices_other_rounded,
        label: context.l10n.addDevice,
        foreground: colors.onSurface,
        decoration: BoxDecoration(
          color: colors.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(24),
        ),
        onTap: () => context.push('/devices/new'),
      ),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        _SectionHeader(title: context.l10n.quickActions),
        const SizedBox(height: 12),
        LayoutBuilder(
          builder: (context, constraints) {
            final columns = constraints.maxWidth < 300 ? 1 : 2;
            final width = columns == 1 ? constraints.maxWidth : (constraints.maxWidth - 12) / 2;
            return Wrap(
              spacing: 12,
              runSpacing: 12,
              children: actions.map((action) => SizedBox(width: width, child: action)).toList(),
            );
          },
        ),
      ],
    );
  }
}

class _QuickActionCard extends StatelessWidget {
  const _QuickActionCard({
    required this.icon,
    required this.label,
    required this.foreground,
    required this.decoration,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final Color foreground;
  final Decoration decoration;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return _TactileSurface(
      semanticsLabel: label,
      onTap: onTap,
      decoration: decoration,
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 112),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              DecoratedBox(
                decoration: BoxDecoration(
                  color: foreground.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(9),
                  child: Icon(icon, color: foreground, size: 23),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                label,
                style: Theme.of(
                  context,
                ).textTheme.titleSmall?.copyWith(color: foreground, fontWeight: FontWeight.w900),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TactileSurface extends StatefulWidget {
  const _TactileSurface({
    required this.semanticsLabel,
    required this.onTap,
    required this.decoration,
    required this.child,
  });

  final String semanticsLabel;
  final VoidCallback onTap;
  final Decoration decoration;
  final Widget child;

  @override
  State<_TactileSurface> createState() => _TactileSurfaceState();
}

class _TactileSurfaceState extends State<_TactileSurface> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final reduceMotion = MediaQuery.of(context).disableAnimations;
    const radius = BorderRadius.all(Radius.circular(24));
    return Semantics(
      button: true,
      label: widget.semanticsLabel,
      child: AnimatedScale(
        scale: _pressed ? 0.985 : 1,
        duration: reduceMotion ? Duration.zero : const Duration(milliseconds: 120),
        curve: Curves.easeOutCubic,
        child: Material(
          color: Colors.transparent,
          borderRadius: radius,
          clipBehavior: Clip.antiAlias,
          child: Ink(
            decoration: widget.decoration,
            child: InkWell(
              borderRadius: radius,
              onTap: widget.onTap,
              onHighlightChanged: (value) {
                if (_pressed == value) {
                  return;
                }
                setState(() => _pressed = value);
              },
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title, this.actionLabel, this.onAction});

  final String title;
  final String? actionLabel;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w900,
              letterSpacing: -0.4,
            ),
          ),
        ),
        if (actionLabel != null && onAction != null)
          TextButton(onPressed: onAction, child: Text(actionLabel!)),
      ],
    );
  }
}

class _IconBadge extends StatelessWidget {
  const _IconBadge({
    required this.icon,
    required this.background,
    required this.foreground,
    this.size = 44,
  });

  final IconData icon;
  final Color background;
  final Color foreground;
  final double size;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: background, borderRadius: BorderRadius.circular(15)),
      child: SizedBox(
        width: size,
        height: size,
        child: Icon(icon, color: foreground, size: size * 0.48),
      ),
    );
  }
}

IconData _taskIcon(CareTaskKind kind) => switch (kind) {
  CareTaskKind.clean => Icons.cleaning_services_outlined,
  CareTaskKind.inspect => Icons.search_rounded,
  CareTaskKind.replace => Icons.autorenew_rounded,
  CareTaskKind.reorder => Icons.shopping_bag_outlined,
  CareTaskKind.charge => Icons.battery_charging_full_rounded,
  CareTaskKind.custom => Icons.event_note_outlined,
};
