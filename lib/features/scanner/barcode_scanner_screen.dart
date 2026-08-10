import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_zxing/flutter_zxing.dart';
import 'package:go_router/go_router.dart';

import '../../core/cqrs/mediator.dart';
import '../../core/localization/localization.dart';
import '../inventory/adjust_inventory/adjust_inventory.dart';
import '../inventory/find_supply_by_barcode/find_supply_by_barcode.dart';
import '../inventory/inventory_store.dart';
import '../inventory/mark_supply_replaced/mark_supply_replaced.dart';
import '../inventory/supply.dart';

class BarcodeScannerScreen extends StatefulWidget {
  const BarcodeScannerScreen({
    required this.mediator,
    this.returnBarcodeOnly = false,
    this.replacementMode = false,
    super.key,
  }) : assert(!returnBarcodeOnly || !replacementMode);

  final Mediator mediator;
  final bool returnBarcodeOnly;
  final bool replacementMode;

  @override
  State<BarcodeScannerScreen> createState() => _BarcodeScannerScreenState();
}

class _BarcodeScannerScreenState extends State<BarcodeScannerScreen> {
  bool _started = false;
  bool _handlingCode = false;
  bool _scannerActive = true;
  bool _scannerFailed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _started ? Colors.black : null,
      appBar: AppBar(
        title: Text(widget.replacementMode ? context.l10n.scanReplacement : context.l10n.scanTitle),
        backgroundColor: _started ? Colors.black : null,
        foregroundColor: _started ? Colors.white : null,
      ),
      body: _started ? _scanner(context) : _permissionExplanation(context),
    );
  }

  Widget _permissionExplanation(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(28),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      Icons.qr_code_scanner_rounded,
                      size: 56,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      context.l10n.cameraPermissionTitle,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.replacementMode
                          ? context.l10n.replacementCameraPermissionDescription
                          : context.l10n.cameraPermissionDescription,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant),
                    ),
                    const SizedBox(height: 24),
                    FilledButton.icon(
                      onPressed: () => setState(() => _started = true),
                      icon: const Icon(Icons.camera_alt_outlined),
                      label: Text(context.l10n.openScanner),
                    ),
                    const SizedBox(height: 10),
                    TextButton(
                      onPressed: _enterManually,
                      child: Text(context.l10n.enterManually),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _scanner(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        if (_scannerFailed)
          _scannerError(context)
        else if (_scannerActive)
          ReaderWidget(
            onScan: (code) {
              final value = code.text?.trim();
              if (code.isValid && value != null && value.isNotEmpty) {
                unawaited(_handleBarcode(value));
              }
            },
            onControllerCreated: (_, error) {
              if (error != null && mounted) {
                setState(() => _scannerFailed = true);
              }
            },
            tryHarder: true,
            tryInverted: true,
            cropPercent: 0.82,
            showScannerOverlay: false,
            showGallery: false,
            showToggleCamera: false,
            actionButtonsAlignment: Alignment.topRight,
            actionButtonsPadding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
            actionButtonsBackgroundBorderRadius: BorderRadius.circular(14),
            flashOnIcon: const Icon(Icons.flashlight_on_rounded),
            flashOffIcon: const Icon(Icons.flashlight_off_rounded),
            loading: const ColoredBox(color: Colors.black),
          )
        else
          const ColoredBox(color: Colors.black),
        if (!_scannerFailed) ...<Widget>[
          IgnorePointer(
            child: Center(
              child: Container(
                width: 290,
                height: 190,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: Colors.white, width: 3),
                ),
              ),
            ),
          ),
          Positioned(
            left: 24,
            right: 24,
            bottom: 40,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.72),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  widget.replacementMode
                      ? context.l10n.replacementScanInstruction
                      : context.l10n.scanInstruction,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }

  Widget _scannerError(BuildContext context) {
    return ColoredBox(
      color: Colors.black,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Icon(Icons.camera_alt_outlined, color: Colors.white, size: 48),
              const SizedBox(height: 16),
              Text(
                context.l10n.scannerError,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 16),
              OutlinedButton(
                onPressed: _enterManually,
                child: Text(context.l10n.enterManually),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _handleBarcode(String value) async {
    if (_handlingCode) {
      return;
    }
    setState(() {
      _handlingCode = true;
      _scannerActive = false;
    });
    if (widget.returnBarcodeOnly) {
      context.pop(value);
      return;
    }
    var shouldRestart = true;
    try {
      if (widget.replacementMode) {
        shouldRestart = await _confirmScannedReplacement(value);
        return;
      }
      final supply = await widget.mediator.query<Future<SupplyItem?>>(
        FindSupplyByBarcodeQuery(value),
      );
      if (!mounted) {
        return;
      }
      if (supply == null) {
        shouldRestart = false;
        context.pushReplacement('/inventory/new?barcode=${Uri.encodeQueryComponent(value)}');
        return;
      }
      final editRequested = await showModalBottomSheet<bool>(
        context: context,
        showDragHandle: true,
        builder: (context) => SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 4, 20, 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  supply.name,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 6),
                Text(context.l10n.quantityValue(supply.quantityOnHand, supply.unitLabel)),
                const SizedBox(height: 18),
                FilledButton.icon(
                  onPressed: () async {
                    await widget.mediator.send<void>(
                      AdjustInventoryCommand(
                        supplyId: supply.id,
                        delta: -1,
                        kind: InventoryEventKind.used,
                      ),
                    );
                    if (context.mounted) {
                      context.pop(false);
                    }
                  },
                  icon: const Icon(Icons.remove_rounded),
                  label: Text(context.l10n.useOne),
                ),
                const SizedBox(height: 10),
                OutlinedButton.icon(
                  onPressed: () async {
                    await widget.mediator.send<void>(
                      AdjustInventoryCommand(
                        supplyId: supply.id,
                        delta: 1,
                        kind: InventoryEventKind.stockIn,
                      ),
                    );
                    if (context.mounted) {
                      context.pop(false);
                    }
                  },
                  icon: const Icon(Icons.add_rounded),
                  label: Text(context.l10n.stockIn),
                ),
                TextButton(
                  onPressed: () => context.pop(true),
                  child: Text(context.l10n.edit),
                ),
              ],
            ),
          ),
        ),
      );
      if (editRequested == true && mounted) {
        shouldRestart = false;
        context.pushReplacement('/inventory/${supply.id}');
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
    } finally {
      if (mounted) {
        setState(() {
          _handlingCode = false;
          _scannerActive = shouldRestart;
        });
      }
    }
  }

  Future<bool> _confirmScannedReplacement(String barcode) async {
    final supply = await widget.mediator.query<Future<SupplyItem?>>(
      FindSupplyByBarcodeQuery(barcode),
    );
    if (!mounted) {
      return false;
    }
    if (supply == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.replacementBarcodeNotFound)),
      );
      return true;
    }
    final confirmed = await showModalBottomSheet<bool>(
      context: context,
      showDragHandle: true,
      useSafeArea: true,
      builder: (context) => _ReplacementConfirmationSheet(supply: supply),
    );
    if (confirmed != true || !mounted) {
      return true;
    }
    await widget.mediator.send<void>(
      MarkSupplyReplacedCommand(supply.id, scannedBarcode: barcode),
    );
    if (mounted) {
      context.pop(true);
    }
    return false;
  }

  Future<void> _enterManually() async {
    final shouldResumeScanner = _started && !_scannerFailed;
    if (shouldResumeScanner) {
      setState(() => _scannerActive = false);
    }
    final value = await showDialog<String>(
      context: context,
      builder: (context) => const _ManualBarcodeDialog(),
    );
    if (value != null && value.isNotEmpty && mounted) {
      await _handleBarcode(value);
    } else if (shouldResumeScanner && mounted) {
      setState(() => _scannerActive = true);
    }
  }
}

class _ReplacementConfirmationSheet extends StatelessWidget {
  const _ReplacementConfirmationSheet({required this.supply});

  final SupplyItem supply;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
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
                  color: colors.secondaryContainer,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Icon(Icons.autorenew_rounded, color: colors.onSecondaryContainer),
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
            context.l10n.replacementConfirmDescription(supply.unitLabel),
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
          FilledButton.icon(
            onPressed: () => context.pop(true),
            icon: const Icon(Icons.autorenew_rounded),
            label: Text(context.l10n.markReplaced),
          ),
          const SizedBox(height: 8),
          TextButton(
            onPressed: () => context.pop(false),
            child: Text(context.l10n.cancel),
          ),
        ],
      ),
    );
  }
}

class _ManualBarcodeDialog extends StatefulWidget {
  const _ManualBarcodeDialog();

  @override
  State<_ManualBarcodeDialog> createState() => _ManualBarcodeDialogState();
}

class _ManualBarcodeDialogState extends State<_ManualBarcodeDialog> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(context.l10n.barcode),
      content: TextField(
        controller: _controller,
        autofocus: true,
        decoration: InputDecoration(labelText: context.l10n.barcode),
        onSubmitted: _submit,
      ),
      actions: <Widget>[
        TextButton(onPressed: () => context.pop(), child: Text(context.l10n.cancel)),
        FilledButton(
          onPressed: () => _submit(_controller.text),
          child: Text(context.l10n.done),
        ),
      ],
    );
  }

  void _submit(String value) => context.pop(value.trim());
}
