import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../../core/cqrs/mediator.dart';
import '../../../core/localization/localization.dart';
import '../../../core/widgets/care_page.dart';
import '../archive_device/archive_device.dart';
import '../device.dart';
import '../device_localization.dart';
import '../watch_devices/watch_devices.dart';
import 'save_device.dart';

class DeviceEditorScreen extends StatefulWidget {
  const DeviceEditorScreen({required this.mediator, this.deviceId, super.key});

  final Mediator mediator;
  final String? deviceId;

  @override
  State<DeviceEditorScreen> createState() => _DeviceEditorScreenState();
}

class _DeviceEditorScreenState extends State<DeviceEditorScreen> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _manufacturer = TextEditingController();
  final _model = TextEditingController();
  final _serial = TextEditingController();
  final _supplier = TextEditingController();
  final _manualUrl = TextEditingController();
  final _storage = TextEditingController();
  final _mode = TextEditingController();
  final _pressureMin = TextEditingController();
  final _pressureMax = TextEditingController();
  final _pressureUnit = TextEditingController(text: 'cmH₂O');
  final _humidifier = TextEditingController();
  final _ramp = TextEditingController();
  final _prescribedBy = TextEditingController();
  final _prescriptionNotes = TextEditingController();
  final _notes = TextEditingController();

  DeviceCategory _category = DeviceCategory.cpap;
  DateTime? _installedAt;
  DateTime? _warrantyExpiresAt;
  DateTime? _prescribedAt;
  bool _loading = false;
  bool _saving = false;
  bool _missing = false;

  bool get _editing => widget.deviceId != null;

  @override
  void initState() {
    super.initState();
    if (_editing) {
      _loading = true;
      unawaited(_load());
    }
  }

  Future<void> _load() async {
    final device = await widget.mediator
        .query<Stream<MedicalDevice?>>(WatchDeviceQuery(widget.deviceId!))
        .first;
    if (!mounted) {
      return;
    }
    if (device == null) {
      setState(() {
        _loading = false;
        _missing = true;
      });
      return;
    }
    _name.text = device.name;
    _manufacturer.text = device.manufacturer ?? '';
    _model.text = device.modelNumber ?? '';
    _serial.text = device.serialNumber ?? '';
    _supplier.text = device.supplier ?? '';
    _manualUrl.text = device.manualUrl ?? '';
    _storage.text = device.storageLocation ?? '';
    _mode.text = device.prescriptionMode ?? '';
    _pressureMin.text = device.pressureMin?.toString() ?? '';
    _pressureMax.text = device.pressureMax?.toString() ?? '';
    _pressureUnit.text = device.pressureUnit ?? 'cmH₂O';
    _humidifier.text = device.humidifierSetting ?? '';
    _ramp.text = device.rampMinutes?.toString() ?? '';
    _prescribedBy.text = device.prescribedBy ?? '';
    _prescriptionNotes.text = device.prescriptionNotes ?? '';
    _notes.text = device.notes ?? '';
    setState(() {
      _category = device.category;
      _installedAt = device.installedAt;
      _warrantyExpiresAt = device.warrantyExpiresAt;
      _prescribedAt = device.prescribedAt;
      _loading = false;
    });
  }

  @override
  void dispose() {
    for (final controller in <TextEditingController>[
      _name,
      _manufacturer,
      _model,
      _serial,
      _supplier,
      _manualUrl,
      _storage,
      _mode,
      _pressureMin,
      _pressureMax,
      _pressureUnit,
      _humidifier,
      _ramp,
      _prescribedBy,
      _prescriptionNotes,
      _notes,
    ]) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_editing ? context.l10n.editDeviceTitle : context.l10n.newDeviceTitle),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _missing
          ? Center(child: Text(context.l10n.unexpectedError))
          : Form(
              key: _formKey,
              child: CarePageBody(
                maxWidth: 760,
                children: <Widget>[
                  _Heading(context.l10n.deviceInformation),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _name,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(labelText: context.l10n.deviceName),
                    validator: (value) =>
                        value == null || value.trim().isEmpty ? context.l10n.requiredField : null,
                  ),
                  const SizedBox(height: 14),
                  DropdownButtonFormField<DeviceCategory>(
                    initialValue: _category,
                    decoration: InputDecoration(labelText: context.l10n.deviceCategory),
                    items: DeviceCategory.values
                        .map(
                          (category) => DropdownMenuItem<DeviceCategory>(
                            value: category,
                            child: Text(category.label(context.l10n)),
                          ),
                        )
                        .toList(growable: false),
                    onChanged: (value) => setState(() => _category = value ?? _category),
                  ),
                  const SizedBox(height: 14),
                  _TwoFields(
                    first: TextFormField(
                      controller: _manufacturer,
                      decoration: InputDecoration(labelText: context.l10n.manufacturer),
                    ),
                    second: TextFormField(
                      controller: _model,
                      decoration: InputDecoration(labelText: context.l10n.modelNumber),
                    ),
                  ),
                  const SizedBox(height: 14),
                  TextFormField(
                    controller: _serial,
                    decoration: InputDecoration(labelText: context.l10n.serialNumber),
                  ),
                  const SizedBox(height: 14),
                  _TwoFields(
                    first: _DateButton(
                      label: context.l10n.installedAt,
                      value: _installedAt,
                      onChanged: (value) => setState(() => _installedAt = value),
                    ),
                    second: _DateButton(
                      label: context.l10n.warrantyExpiresAt,
                      value: _warrantyExpiresAt,
                      onChanged: (value) => setState(() => _warrantyExpiresAt = value),
                    ),
                  ),
                  const SizedBox(height: 14),
                  TextFormField(
                    controller: _supplier,
                    decoration: InputDecoration(labelText: context.l10n.supplier),
                  ),
                  const SizedBox(height: 14),
                  TextFormField(
                    controller: _manualUrl,
                    keyboardType: TextInputType.url,
                    decoration: InputDecoration(labelText: context.l10n.manualUrl),
                  ),
                  const SizedBox(height: 14),
                  TextFormField(
                    controller: _storage,
                    decoration: InputDecoration(labelText: context.l10n.storageLocation),
                  ),
                  const SizedBox(height: 28),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          _Heading(context.l10n.prescriptionReference),
                          const SizedBox(height: 8),
                          Text(
                            context.l10n.prescriptionSafety,
                            style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant),
                          ),
                          const SizedBox(height: 18),
                          TextFormField(
                            controller: _mode,
                            decoration: InputDecoration(labelText: context.l10n.therapyMode),
                          ),
                          const SizedBox(height: 14),
                          _TwoFields(
                            first: TextFormField(
                              controller: _pressureMin,
                              keyboardType: const TextInputType.numberWithOptions(decimal: true),
                              decoration: InputDecoration(labelText: context.l10n.minimumPressure),
                            ),
                            second: TextFormField(
                              controller: _pressureMax,
                              keyboardType: const TextInputType.numberWithOptions(decimal: true),
                              decoration: InputDecoration(labelText: context.l10n.maximumPressure),
                            ),
                          ),
                          const SizedBox(height: 14),
                          TextFormField(
                            controller: _pressureUnit,
                            decoration: InputDecoration(labelText: context.l10n.pressureUnit),
                          ),
                          const SizedBox(height: 14),
                          _TwoFields(
                            first: TextFormField(
                              controller: _humidifier,
                              decoration: InputDecoration(
                                labelText: context.l10n.humidifierSetting,
                              ),
                            ),
                            second: TextFormField(
                              controller: _ramp,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              decoration: InputDecoration(labelText: context.l10n.rampMinutes),
                            ),
                          ),
                          const SizedBox(height: 14),
                          TextFormField(
                            controller: _prescribedBy,
                            decoration: InputDecoration(labelText: context.l10n.prescribedBy),
                          ),
                          const SizedBox(height: 14),
                          _DateButton(
                            label: context.l10n.prescribedAt,
                            value: _prescribedAt,
                            onChanged: (value) => setState(() => _prescribedAt = value),
                          ),
                          const SizedBox(height: 14),
                          TextFormField(
                            controller: _prescriptionNotes,
                            minLines: 3,
                            maxLines: 6,
                            decoration: InputDecoration(labelText: context.l10n.prescriptionNotes),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  TextFormField(
                    controller: _notes,
                    minLines: 3,
                    maxLines: 6,
                    decoration: InputDecoration(labelText: context.l10n.notes),
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

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    setState(() => _saving = true);
    try {
      final draft = DeviceDraft(
        name: _name.text,
        category: _category,
        manufacturer: _manufacturer.text,
        modelNumber: _model.text,
        serialNumber: _serial.text,
        installedAt: _installedAt,
        warrantyExpiresAt: _warrantyExpiresAt,
        supplier: _supplier.text,
        manualUrl: _manualUrl.text,
        storageLocation: _storage.text,
        prescriptionMode: _mode.text,
        pressureMin: double.tryParse(_pressureMin.text),
        pressureMax: double.tryParse(_pressureMax.text),
        pressureUnit: _pressureUnit.text,
        humidifierSetting: _humidifier.text,
        rampMinutes: int.tryParse(_ramp.text),
        prescribedBy: _prescribedBy.text,
        prescribedAt: _prescribedAt,
        prescriptionNotes: _prescriptionNotes.text,
        notes: _notes.text,
      );
      await widget.mediator.send<String>(SaveDeviceCommand(draft, deviceId: widget.deviceId));
      if (mounted) {
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
        content: Text(context.l10n.archivingConfirmation),
        actions: <Widget>[
          TextButton(onPressed: () => context.pop(false), child: Text(context.l10n.cancel)),
          FilledButton(onPressed: () => context.pop(true), child: Text(context.l10n.delete)),
        ],
      ),
    );
    if (confirmed == true && mounted) {
      await widget.mediator.send<void>(ArchiveDeviceCommand(widget.deviceId!));
      if (mounted) {
        context.go('/devices');
      }
    }
  }
}

class _Heading extends StatelessWidget {
  const _Heading(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
    );
  }
}

class _TwoFields extends StatelessWidget {
  const _TwoFields({required this.first, required this.second});

  final Widget first;
  final Widget second;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 520) {
          return Column(children: <Widget>[first, const SizedBox(height: 14), second]);
        }
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(child: first),
            const SizedBox(width: 12),
            Expanded(child: second),
          ],
        );
      },
    );
  }
}

class _DateButton extends StatelessWidget {
  const _DateButton({required this.label, required this.value, required this.onChanged});

  final String label;
  final DateTime? value;
  final ValueChanged<DateTime?> onChanged;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () async {
        final date = await showDatePicker(
          context: context,
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
          initialDate: value?.toLocal() ?? DateTime.now(),
        );
        if (date != null) {
          onChanged(date);
        }
      },
      icon: const Icon(Icons.calendar_today_outlined),
      label: Align(
        alignment: Alignment.centerLeft,
        child: Text(value == null ? label : '$label · ${context.careDate(value!)}'),
      ),
    );
  }
}
