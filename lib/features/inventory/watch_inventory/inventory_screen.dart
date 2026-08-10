import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/cqrs/mediator.dart';
import '../../../core/localization/localization.dart';
import '../../../core/widgets/care_page.dart';
import '../../../core/widgets/empty_state.dart';
import '../../../core/widgets/status_pill.dart';
import '../inventory_localization.dart';
import '../inventory_store.dart';
import '../supply.dart';
import 'inventory_view_model.dart';

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({required this.mediator, super.key});

  final Mediator mediator;

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  late final InventoryViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = InventoryViewModel(widget.mediator);
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
            navigationIndex: 1,
            children: <Widget>[
              CarePageHeader(
                title: context.l10n.inventoryTitle,
                subtitle: context.l10n.inventorySubtitle,
                trailing: IconButton.filled(
                  onPressed: () => context.push('/inventory/new'),
                  tooltip: context.l10n.addSupply,
                  icon: const Icon(Icons.add_rounded),
                ),
              ),
              const SizedBox(height: 24),
              TextField(
                onChanged: _viewModel.setSearch,
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  hintText: context.l10n.searchInventory,
                  prefixIcon: const Icon(Icons.search_rounded),
                ),
              ),
              const SizedBox(height: 14),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SegmentedButton<InventoryFilter>(
                  showSelectedIcon: false,
                  segments: <ButtonSegment<InventoryFilter>>[
                    ButtonSegment<InventoryFilter>(
                      value: InventoryFilter.all,
                      label: Text(context.l10n.allSupplies),
                    ),
                    ButtonSegment<InventoryFilter>(
                      value: InventoryFilter.low,
                      label: Text(context.l10n.lowOnly),
                    ),
                    ButtonSegment<InventoryFilter>(
                      value: InventoryFilter.due,
                      label: Text(context.l10n.dueOnly),
                    ),
                  ],
                  selected: <InventoryFilter>{_viewModel.filter},
                  onSelectionChanged: (selection) => _viewModel.setFilter(selection.single),
                ),
              ),
              const SizedBox(height: 20),
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
              else if (_viewModel.supplies.isEmpty)
                EmptyState(
                  icon: Icons.inventory_2_outlined,
                  title: _viewModel.totalCount == 0
                      ? context.l10n.inventoryEmpty
                      : context.l10n.noResults,
                  description: context.l10n.inventoryEmptyDescription,
                  action: FilledButton.icon(
                    onPressed: () => context.push('/scan'),
                    icon: const Icon(Icons.qr_code_scanner_rounded),
                    label: Text(context.l10n.scanSupply),
                  ),
                )
              else
                LayoutBuilder(
                  builder: (context, constraints) {
                    final columns = constraints.maxWidth >= 760 ? 2 : 1;
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: columns,
                        crossAxisSpacing: 14,
                        mainAxisSpacing: 14,
                        mainAxisExtent: 214,
                      ),
                      itemCount: _viewModel.supplies.length,
                      itemBuilder: (context, index) => _SupplyCard(
                        supply: _viewModel.supplies[index],
                        onOpen: () => context.push('/inventory/${_viewModel.supplies[index].id}'),
                        onUse: () =>
                            _runAction(() => _viewModel.useOne(_viewModel.supplies[index])),
                        onStockIn: () => _runAction(
                          () => _viewModel.stockIn(_viewModel.supplies[index]),
                        ),
                        onReplaced: () => _replaceSupply(_viewModel.supplies[index]),
                      ),
                    );
                  },
                ),
            ],
          );
        },
      ),
    );
  }

  Future<void> _runAction(Future<void> Function() action, {String? successMessage}) async {
    try {
      await action();
      if (mounted && successMessage != null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(successMessage)));
      }
    } on Object {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.l10n.unexpectedError)),
        );
      }
    }
  }

  Future<void> _replaceSupply(SupplyItem supply) async {
    final choice = await showModalBottomSheet<_ReplacementChoice>(
      context: context,
      showDragHandle: true,
      useSafeArea: true,
      useRootNavigator: true,
      builder: (context) => _ReplacementSheet(supply: supply),
    );
    if (!mounted || choice == null) {
      return;
    }
    switch (choice) {
      case _ReplacementChoice.scan:
        final barcode = await context.push<String>('/scan?returnBarcode=true');
        if (barcode != null && barcode.isNotEmpty && mounted) {
          await _recordReplacement(supply, scannedBarcode: barcode);
        }
        return;
      case _ReplacementChoice.record:
        await _recordReplacement(supply);
        return;
      case _ReplacementChoice.edit:
        await context.push<void>('/inventory/${supply.id}');
        return;
    }
  }

  Future<void> _recordReplacement(SupplyItem supply, {String? scannedBarcode}) async {
    try {
      await _viewModel.markReplaced(supply, scannedBarcode: scannedBarcode);
      if (mounted) {
        final message = scannedBarcode == null
            ? context.l10n.replacementRecorded
            : context.l10n.replacementScanned;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
      }
    } on SupplyBarcodeMismatchException {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.l10n.replacementBarcodeMismatch(supply.name))),
        );
      }
    } on ReplacementInventoryEmptyException {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.l10n.replacementInventoryEmpty)),
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

enum _ReplacementChoice { scan, record, edit }

class _ReplacementSheet extends StatelessWidget {
  const _ReplacementSheet({required this.supply});

  final SupplyItem supply;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final hasBarcode = supply.barcode?.trim().isNotEmpty ?? false;
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 4, 20, 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            children: <Widget>[
              DecoratedBox(
                decoration: BoxDecoration(
                  color: colors.primaryContainer,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Icon(Icons.autorenew_rounded, color: colors.onPrimaryContainer),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  context.l10n.replaceSupplyTitle(supply.name),
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            hasBarcode
                ? context.l10n.replacementScanDescription
                : context.l10n.replacementBarcodeMissing,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: colors.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            context.l10n.quantityValue(supply.quantityOnHand, supply.unitLabel),
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: colors.onSurface,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 22),
          if (hasBarcode)
            FilledButton.icon(
              onPressed: () => context.pop(_ReplacementChoice.scan),
              icon: const Icon(Icons.qr_code_scanner_rounded),
              label: Text(context.l10n.scanReplacement),
            )
          else
            FilledButton.icon(
              onPressed: () => context.pop(_ReplacementChoice.edit),
              icon: const Icon(Icons.edit_outlined),
              label: Text(context.l10n.editSupplyTitle),
            ),
          const SizedBox(height: 8),
          TextButton(
            onPressed: () => context.pop(_ReplacementChoice.record),
            child: Text(context.l10n.recordWithoutScanning),
          ),
        ],
      ),
    );
  }
}

class _SupplyCard extends StatelessWidget {
  const _SupplyCard({
    required this.supply,
    required this.onOpen,
    required this.onUse,
    required this.onStockIn,
    required this.onReplaced,
  });

  final SupplyItem supply;
  final VoidCallback onOpen;
  final VoidCallback onUse;
  final VoidCallback onStockIn;
  final VoidCallback onReplaced;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final isDue = supply.isReplacementDueBy(DateTime.now());
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onOpen,
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: colors.primaryContainer,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(11),
                      child: Icon(
                        Icons.medical_information_outlined,
                        color: colors.onPrimaryContainer,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          supply.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          supply.category.label(context.l10n),
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: colors.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    context.l10n.quantityValue(supply.quantityOnHand, supply.unitLabel),
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
                  ),
                ],
              ),
              const Spacer(),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: <Widget>[
                  if (supply.isLowStock)
                    StatusPill(
                      label: context.l10n.lowStock,
                      icon: Icons.shopping_bag_outlined,
                      tone: StatusTone.warning,
                    )
                  else
                    StatusPill(
                      label: context.l10n.inStock,
                      icon: Icons.check_rounded,
                      tone: StatusTone.good,
                    ),
                  if (isDue)
                    StatusPill(
                      label: context.l10n.replacementDue,
                      icon: Icons.sync_rounded,
                      tone: StatusTone.danger,
                    ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: <Widget>[
                  IconButton.outlined(
                    onPressed: supply.quantityOnHand > 0 ? onUse : null,
                    tooltip: context.l10n.useOne,
                    icon: const Icon(Icons.remove_rounded),
                  ),
                  const SizedBox(width: 8),
                  IconButton.outlined(
                    onPressed: onStockIn,
                    tooltip: context.l10n.stockIn,
                    icon: const Icon(Icons.add_rounded),
                  ),
                  const Spacer(),
                  if (supply.replacementCadenceDays != null)
                    TextButton.icon(
                      onPressed: onReplaced,
                      icon: const Icon(Icons.autorenew_rounded),
                      label: Text(context.l10n.markReplaced),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
