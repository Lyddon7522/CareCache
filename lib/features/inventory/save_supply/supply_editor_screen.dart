import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../../core/cqrs/mediator.dart';
import '../../../core/localization/localization.dart';
import '../../../core/widgets/care_page.dart';
import '../../devices/device.dart';
import '../../devices/watch_devices/watch_devices.dart';
import '../../scanner/extracted_label.dart';
import '../../scanner/label_text_recognizer.dart';
import '../archive_supply/archive_supply.dart';
import '../inventory_localization.dart';
import '../supply.dart';
import '../watch_inventory/watch_inventory.dart';
import 'save_supply.dart';

class SupplyEditorScreen extends StatefulWidget {
  const SupplyEditorScreen({
    required this.mediator,
    this.supplyId,
    this.initialBarcode,
    super.key,
  });

  final Mediator mediator;
  final String? supplyId;
  final String? initialBarcode;

  @override
  State<SupplyEditorScreen> createState() => _SupplyEditorScreenState();
}

class _SupplyEditorScreenState extends State<SupplyEditorScreen> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _brand = TextEditingController();
  final _model = TextEditingController();
  final _barcode = TextEditingController();
  final _lot = TextEditingController();
  final _unit = TextEditingController(text: 'item');
  final _quantity = TextEditingController(text: '0');
  final _reorderPoint = TextEditingController(text: '1');
  final _cadence = TextEditingController();
  final _storage = TextEditingController();
  final _notes = TextEditingController();
  final _labelRecognizer = LabelTextRecognizer();

  SupplyCategory _category = SupplyCategory.cpap;
  String? _deviceId;
  DateTime? _expirationDate;
  DateTime? _nextReplacementAt;
  DateTime? _lastReplacedAt;
  String? _imagePath;
  ExtractedLabel? _extractedLabel;
  bool _loading = false;
  bool _saving = false;
  bool _capturingLabel = false;
  bool _missing = false;

  bool get _editing => widget.supplyId != null;

  @override
  void initState() {
    super.initState();
    _barcode.text = widget.initialBarcode ?? '';
    if (_editing) {
      _loading = true;
      unawaited(_load());
    }
  }

  Future<void> _load() async {
    final supply = await widget.mediator
        .query<Stream<SupplyItem?>>(WatchSupplyQuery(widget.supplyId!))
        .first;
    if (!mounted) {
      return;
    }
    if (supply == null) {
      setState(() {
        _loading = false;
        _missing = true;
      });
      return;
    }
    _name.text = supply.name;
    _brand.text = supply.brand ?? '';
    _model.text = supply.modelNumber ?? '';
    _barcode.text = supply.barcode ?? '';
    _lot.text = supply.lotNumber ?? '';
    _unit.text = supply.unitLabel;
    _quantity.text = supply.quantityOnHand.toString();
    _reorderPoint.text = supply.reorderPoint.toString();
    _cadence.text = supply.replacementCadenceDays?.toString() ?? '';
    _storage.text = supply.storageLocation ?? '';
    _notes.text = supply.notes ?? '';
    setState(() {
      _category = supply.category;
      _deviceId = supply.deviceId;
      _expirationDate = supply.expirationDate;
      _nextReplacementAt = supply.nextReplacementAt;
      _lastReplacedAt = supply.lastReplacedAt;
      _imagePath = supply.imagePath;
      _loading = false;
    });
  }

  @override
  void dispose() {
    _name.dispose();
    _brand.dispose();
    _model.dispose();
    _barcode.dispose();
    _lot.dispose();
    _unit.dispose();
    _quantity.dispose();
    _reorderPoint.dispose();
    _cadence.dispose();
    _storage.dispose();
    _notes.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final title = _editing ? context.l10n.editSupplyTitle : context.l10n.newSupplyTitle;
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _missing
          ? Center(child: Text(context.l10n.unexpectedError))
          : Form(
              key: _formKey,
              child: CarePageBody(
                maxWidth: 760,
                children: <Widget>[
                  Text(
                    context.l10n.supplyDetails,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 18),
                  TextFormField(
                    controller: _name,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(labelText: context.l10n.supplyName),
                    validator: (value) => _required(value, context.l10n.requiredField),
                  ),
                  const SizedBox(height: 14),
                  DropdownButtonFormField<SupplyCategory>(
                    initialValue: _category,
                    decoration: InputDecoration(labelText: context.l10n.category),
                    items: SupplyCategory.values
                        .map(
                          (category) => DropdownMenuItem<SupplyCategory>(
                            value: category,
                            child: Text(category.label(context.l10n)),
                          ),
                        )
                        .toList(growable: false),
                    onChanged: (value) => setState(() => _category = value ?? _category),
                  ),
                  const SizedBox(height: 14),
                  StreamBuilder<List<MedicalDevice>>(
                    stream: widget.mediator.query(const WatchDevicesQuery()),
                    builder: (context, snapshot) {
                      final devices = snapshot.data ?? const <MedicalDevice>[];
                      final knownSelection = devices.any((device) => device.id == _deviceId);
                      return DropdownButtonFormField<String?>(
                        initialValue: knownSelection ? _deviceId : null,
                        decoration: InputDecoration(labelText: context.l10n.linkedDevice),
                        items: <DropdownMenuItem<String?>>[
                          DropdownMenuItem<String?>(
                            value: null,
                            child: Text(context.l10n.noLink),
                          ),
                          ...devices.map(
                            (device) => DropdownMenuItem<String?>(
                              value: device.id,
                              child: Text(device.name),
                            ),
                          ),
                        ],
                        onChanged: (value) => setState(() => _deviceId = value),
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                  _SectionTitle(context.l10n.deviceInformation),
                  const SizedBox(height: 12),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: TextFormField(
                          controller: _brand,
                          textCapitalization: TextCapitalization.words,
                          decoration: InputDecoration(labelText: context.l10n.brand),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: TextFormField(
                          controller: _model,
                          decoration: InputDecoration(labelText: context.l10n.modelNumber),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  TextFormField(
                    controller: _barcode,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: context.l10n.barcode,
                      suffixIcon: IconButton(
                        onPressed: () async {
                          final code = await context.push<String>('/scan?returnBarcode=true');
                          if (code != null) {
                            _barcode.text = code;
                          }
                        },
                        tooltip: context.l10n.scan,
                        icon: const Icon(Icons.qr_code_scanner_rounded),
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  TextFormField(
                    controller: _lot,
                    decoration: InputDecoration(labelText: context.l10n.lotNumber),
                  ),
                  const SizedBox(height: 24),
                  _SectionTitle(context.l10n.quantityLabel),
                  const SizedBox(height: 12),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: TextFormField(
                          controller: _quantity,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          decoration: InputDecoration(labelText: context.l10n.quantityLabel),
                          validator: (value) =>
                              _wholeNumber(value, context.l10n.positiveWholeNumber),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: TextFormField(
                          controller: _reorderPoint,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          decoration: InputDecoration(labelText: context.l10n.reorderAtLabel),
                          validator: (value) =>
                              _wholeNumber(value, context.l10n.positiveWholeNumber),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  TextFormField(
                    controller: _unit,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                      labelText: context.l10n.unitLabel,
                      hintText: context.l10n.itemUnitHint,
                    ),
                    validator: (value) => _required(value, context.l10n.requiredField),
                  ),
                  const SizedBox(height: 24),
                  _SectionTitle(context.l10n.replacementCadenceLabel),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _cadence,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(labelText: context.l10n.replacementCadenceDays),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return null;
                      }
                      return int.tryParse(value) == null || int.parse(value) < 1
                          ? context.l10n.positiveCadence
                          : null;
                    },
                  ),
                  const SizedBox(height: 14),
                  _DateField(
                    label: context.l10n.nextReplacement,
                    value: _nextReplacementAt,
                    onChanged: (value) => setState(() => _nextReplacementAt = value),
                  ),
                  const SizedBox(height: 14),
                  _DateField(
                    label: context.l10n.expirationDate,
                    value: _expirationDate,
                    onChanged: (value) => setState(() => _expirationDate = value),
                  ),
                  const SizedBox(height: 24),
                  _SectionTitle(context.l10n.storageLocation),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _storage,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: InputDecoration(labelText: context.l10n.storageLocation),
                  ),
                  const SizedBox(height: 14),
                  TextFormField(
                    controller: _notes,
                    textCapitalization: TextCapitalization.sentences,
                    minLines: 3,
                    maxLines: 6,
                    decoration: InputDecoration(labelText: context.l10n.notes),
                  ),
                  const SizedBox(height: 24),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            context.l10n.scanLabel,
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(context.l10n.scanLabelDescription),
                          const SizedBox(height: 14),
                          OutlinedButton.icon(
                            onPressed: _capturingLabel ? null : _captureLabel,
                            icon: _capturingLabel
                                ? const SizedBox.square(
                                    dimension: 18,
                                    child: CircularProgressIndicator(strokeWidth: 2),
                                  )
                                : const Icon(Icons.document_scanner_outlined),
                            label: Text(context.l10n.scanLabel),
                          ),
                          if (_extractedLabel != null) ...<Widget>[
                            const SizedBox(height: 12),
                            Text(
                              _extractedLabel!.fullText,
                              maxLines: 5,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),
                  FilledButton.icon(
                    onPressed: _saving ? null : _save,
                    icon: _saving
                        ? const SizedBox.square(
                            dimension: 18,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Icon(Icons.check_rounded),
                    label: Text(context.l10n.save),
                  ),
                  if (_editing) ...<Widget>[
                    const SizedBox(height: 12),
                    TextButton.icon(
                      onPressed: _saving ? null : _archive,
                      icon: const Icon(Icons.archive_outlined),
                      label: Text(context.l10n.delete),
                    ),
                  ],
                ],
              ),
            ),
    );
  }

  Future<void> _captureLabel() async {
    setState(() => _capturingLabel = true);
    try {
      final label = await _labelRecognizer.capture();
      if (!mounted || label == null) {
        return;
      }
      if (_name.text.trim().isEmpty && label.suggestedName != null) {
        _name.text = label.suggestedName!;
      }
      if (_brand.text.trim().isEmpty && label.suggestedBrand != null) {
        _brand.text = label.suggestedBrand!;
      }
      if (_model.text.trim().isEmpty && label.suggestedModel != null) {
        _model.text = label.suggestedModel!;
      }
      if (_lot.text.trim().isEmpty && label.suggestedLot != null) {
        _lot.text = label.suggestedLot!;
      }
      setState(() {
        _extractedLabel = label;
        _expirationDate ??= label.suggestedExpiration;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.labelSuggestionsApplied)),
      );
    } on Object {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.l10n.labelCaptureFailed)),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _capturingLabel = false);
      }
    }
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    setState(() => _saving = true);
    try {
      final cadence = int.tryParse(_cadence.text);
      final nextReplacement =
          _nextReplacementAt ??
          (cadence == null ? null : DateTime.now().add(Duration(days: cadence)));
      final draft = SupplyDraft(
        name: _name.text,
        category: _category,
        unitLabel: _unit.text,
        quantityOnHand: int.parse(_quantity.text),
        reorderPoint: int.parse(_reorderPoint.text),
        deviceId: _deviceId,
        brand: _brand.text,
        modelNumber: _model.text,
        barcode: _barcode.text,
        lotNumber: _lot.text,
        expirationDate: _expirationDate,
        replacementCadenceDays: cadence,
        lastReplacedAt: _lastReplacedAt,
        nextReplacementAt: nextReplacement,
        storageLocation: _storage.text,
        notes: _notes.text,
        imagePath: _imagePath,
      );
      await widget.mediator.send<String>(SaveSupplyCommand(draft, supplyId: widget.supplyId));
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.l10n.supplySaved)),
        );
        context.pop();
      }
    } on Object {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.l10n.unexpectedError)),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _saving = false);
      }
    }
  }

  Future<void> _archive() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(context.l10n.delete),
        content: Text(context.l10n.archivingConfirmation),
        actions: <Widget>[
          TextButton(onPressed: () => context.pop(false), child: Text(context.l10n.cancel)),
          FilledButton(onPressed: () => context.pop(true), child: Text(context.l10n.delete)),
        ],
      ),
    );
    if (confirmed != true || !mounted) {
      return;
    }
    await widget.mediator.send<void>(ArchiveSupplyCommand(widget.supplyId!));
    if (mounted) {
      context.go('/inventory');
    }
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
    );
  }
}

class _DateField extends StatelessWidget {
  const _DateField({required this.label, required this.value, required this.onChanged});

  final String label;
  final DateTime? value;
  final ValueChanged<DateTime?> onChanged;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () async {
        final selected = await showDatePicker(
          context: context,
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
          initialDate: value?.toLocal() ?? DateTime.now(),
        );
        if (selected != null) {
          onChanged(selected);
        }
      },
      child: Row(
        children: <Widget>[
          const Icon(Icons.calendar_today_outlined),
          const SizedBox(width: 10),
          Expanded(child: Text(value == null ? label : '$label · ${context.careDate(value!)}')),
          if (value != null)
            IconButton(
              onPressed: () => onChanged(null),
              tooltip: context.l10n.close,
              icon: const Icon(Icons.close_rounded),
            ),
        ],
      ),
    );
  }
}

String? _required(String? value, String message) {
  return value == null || value.trim().isEmpty ? message : null;
}

String? _wholeNumber(String? value, String message) {
  final parsed = int.tryParse(value ?? '');
  return parsed == null || parsed < 0 ? message : null;
}
