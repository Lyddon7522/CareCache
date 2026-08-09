import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../../core/cqrs/mediator.dart';
import '../../../core/localization/localization.dart';
import '../../../core/widgets/care_page.dart';
import '../../devices/device.dart';
import '../../devices/watch_devices/watch_devices.dart';
import '../../inventory/supply.dart';
import '../../inventory/watch_inventory/watch_inventory.dart';
import '../archive_task/archive_task.dart';
import '../care_task.dart';
import '../request_reminder_permission/request_reminder_permission.dart';
import '../schedule_localization.dart';
import '../watch_schedule/watch_schedule.dart';
import 'save_task.dart';

class TaskEditorScreen extends StatefulWidget {
  const TaskEditorScreen({required this.mediator, this.taskId, super.key});

  final Mediator mediator;
  final String? taskId;

  @override
  State<TaskEditorScreen> createState() => _TaskEditorScreenState();
}

class _TaskEditorScreenState extends State<TaskEditorScreen> {
  final _formKey = GlobalKey<FormState>();
  final _title = TextEditingController();
  final _cadence = TextEditingController(text: '7');
  final _notes = TextEditingController();

  CareTaskKind _kind = CareTaskKind.clean;
  DateTime _nextDueAt = DateTime.now().add(const Duration(days: 1));
  TimeOfDay _reminderTime = const TimeOfDay(hour: 9, minute: 0);
  bool _remindersEnabled = true;
  String? _deviceId;
  String? _supplyId;
  bool _loading = false;
  bool _saving = false;
  bool _missing = false;

  bool get _editing => widget.taskId != null;

  @override
  void initState() {
    super.initState();
    if (_editing) {
      _loading = true;
      unawaited(_load());
    }
  }

  Future<void> _load() async {
    final task = await widget.mediator
        .query<Stream<CareTask?>>(WatchTaskQuery(widget.taskId!))
        .first;
    if (!mounted) {
      return;
    }
    if (task == null) {
      setState(() {
        _loading = false;
        _missing = true;
      });
      return;
    }
    _title.text = task.title;
    _cadence.text = task.cadenceDays.toString();
    _notes.text = task.notes ?? '';
    setState(() {
      _kind = task.kind;
      _nextDueAt = task.nextDueAt.toLocal();
      _remindersEnabled = task.remindersEnabled;
      _reminderTime = TimeOfDay(
        hour: task.reminderMinutesAfterMidnight ~/ 60,
        minute: task.reminderMinutesAfterMidnight % 60,
      );
      _deviceId = task.deviceId;
      _supplyId = task.supplyId;
      _loading = false;
    });
  }

  @override
  void dispose() {
    _title.dispose();
    _cadence.dispose();
    _notes.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_editing ? context.l10n.editTaskTitle : context.l10n.newTaskTitle),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _missing
          ? Center(child: Text(context.l10n.unexpectedError))
          : Form(
              key: _formKey,
              child: CarePageBody(
                maxWidth: 720,
                children: <Widget>[
                  TextFormField(
                    controller: _title,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: InputDecoration(labelText: context.l10n.taskTitle),
                    validator: (value) =>
                        value == null || value.trim().isEmpty ? context.l10n.requiredField : null,
                  ),
                  const SizedBox(height: 14),
                  DropdownButtonFormField<CareTaskKind>(
                    initialValue: _kind,
                    decoration: InputDecoration(labelText: context.l10n.taskType),
                    items: CareTaskKind.values
                        .map(
                          (kind) => DropdownMenuItem<CareTaskKind>(
                            value: kind,
                            child: Text(kind.label(context.l10n)),
                          ),
                        )
                        .toList(growable: false),
                    onChanged: (value) => setState(() => _kind = value ?? _kind),
                  ),
                  const SizedBox(height: 14),
                  TextFormField(
                    controller: _cadence,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(labelText: context.l10n.cadenceDays),
                    validator: (value) {
                      final parsed = int.tryParse(value ?? '');
                      return parsed == null || parsed < 1 ? context.l10n.positiveCadence : null;
                    },
                  ),
                  const SizedBox(height: 14),
                  OutlinedButton.icon(
                    onPressed: _chooseDueDate,
                    icon: const Icon(Icons.calendar_today_outlined),
                    label: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('${context.l10n.nextDueDate} · ${context.careDate(_nextDueAt)}'),
                    ),
                  ),
                  const SizedBox(height: 22),
                  StreamBuilder<List<MedicalDevice>>(
                    stream: widget.mediator.query(const WatchDevicesQuery()),
                    builder: (context, snapshot) {
                      final devices = snapshot.data ?? const <MedicalDevice>[];
                      return DropdownButtonFormField<String?>(
                        initialValue: devices.any((device) => device.id == _deviceId)
                            ? _deviceId
                            : null,
                        decoration: InputDecoration(labelText: context.l10n.linkedDevice),
                        items: <DropdownMenuItem<String?>>[
                          DropdownMenuItem<String?>(value: null, child: Text(context.l10n.noLink)),
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
                  const SizedBox(height: 14),
                  StreamBuilder<List<SupplyItem>>(
                    stream: widget.mediator.query(const WatchInventoryQuery()),
                    builder: (context, snapshot) {
                      final supplies = snapshot.data ?? const <SupplyItem>[];
                      return DropdownButtonFormField<String?>(
                        initialValue: supplies.any((supply) => supply.id == _supplyId)
                            ? _supplyId
                            : null,
                        decoration: InputDecoration(labelText: context.l10n.linkedSupply),
                        items: <DropdownMenuItem<String?>>[
                          DropdownMenuItem<String?>(value: null, child: Text(context.l10n.noLink)),
                          ...supplies.map(
                            (supply) => DropdownMenuItem<String?>(
                              value: supply.id,
                              child: Text(supply.name),
                            ),
                          ),
                        ],
                        onChanged: (value) => setState(() => _supplyId = value),
                      );
                    },
                  ),
                  const SizedBox(height: 22),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          SwitchListTile.adaptive(
                            contentPadding: EdgeInsets.zero,
                            title: Text(context.l10n.reminders),
                            subtitle: Text(context.l10n.remindersDescription),
                            value: _remindersEnabled,
                            onChanged: (value) => setState(() => _remindersEnabled = value),
                          ),
                          if (_remindersEnabled)
                            OutlinedButton.icon(
                              onPressed: _chooseReminderTime,
                              icon: const Icon(Icons.notifications_outlined),
                              label: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '${context.l10n.reminderTime} · ${_reminderTime.format(context)}',
                                ),
                              ),
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

  Future<void> _chooseDueDate() async {
    final selected = await showDatePicker(
      context: context,
      firstDate: DateTime.now().subtract(const Duration(days: 3650)),
      lastDate: DateTime(2100),
      initialDate: _nextDueAt,
    );
    if (selected != null) {
      setState(() => _nextDueAt = selected);
    }
  }

  Future<void> _chooseReminderTime() async {
    final selected = await showTimePicker(context: context, initialTime: _reminderTime);
    if (selected != null) {
      setState(() => _reminderTime = selected);
    }
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    setState(() => _saving = true);
    try {
      var remindersEnabled = _remindersEnabled;
      if (remindersEnabled) {
        remindersEnabled = await widget.mediator.send<bool>(
          const RequestReminderPermissionCommand(),
        );
        if (!remindersEnabled && mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(context.l10n.notificationPermissionDenied)),
          );
        }
      }
      final draft = CareTaskDraft(
        title: _title.text,
        kind: _kind,
        cadenceDays: int.parse(_cadence.text),
        nextDueAt: _nextDueAt,
        remindersEnabled: remindersEnabled,
        reminderMinutesAfterMidnight: _reminderTime.hour * 60 + _reminderTime.minute,
        deviceId: _deviceId,
        supplyId: _supplyId,
        notes: _notes.text,
      );
      await widget.mediator.send<String>(SaveTaskCommand(draft, taskId: widget.taskId));
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
      await widget.mediator.send<void>(ArchiveTaskCommand(widget.taskId!));
      if (mounted) {
        context.go('/schedule');
      }
    }
  }
}
