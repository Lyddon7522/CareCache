import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../core/cqrs/mediator.dart';
import '../../core/localization/localization.dart';
import '../../core/widgets/care_cache_mark.dart';
import '../../core/widgets/care_page.dart';
import '../../core/widgets/empty_state.dart';
import 'overview_dashboard.dart';
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
          IconButton.filledTonal(
            onPressed: () => context.push('/settings'),
            tooltip: context.l10n.settings,
            icon: const Icon(Icons.settings_outlined),
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: AnimatedBuilder(
        animation: _viewModel,
        builder: (context, _) {
          return CarePageBody(
            navigationIndex: 0,
            padding: const EdgeInsets.fromLTRB(20, 4, 20, 112),
            children: <Widget>[
              Semantics(
                header: true,
                child: Text(
                  context.l10n.overviewTitle,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                    letterSpacing: -0.8,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                _formattedToday(context),
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),
              if (_viewModel.loading)
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(48),
                    child: CircularProgressIndicator(),
                  ),
                )
              else if (_viewModel.error != null)
                EmptyState(
                  icon: Icons.error_outline_rounded,
                  title: context.l10n.unexpectedError,
                  description: context.l10n.tryAgain,
                )
              else
                OverviewDashboard(viewModel: _viewModel),
            ],
          );
        },
      ),
    );
  }
}

String _formattedToday(BuildContext context) {
  final locale = Localizations.localeOf(context).toString();
  return DateFormat.MMMMEEEEd(locale).format(DateTime.now());
}
