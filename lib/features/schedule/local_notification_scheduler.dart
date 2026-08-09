import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as time_zone_data;
import 'package:timezone/timezone.dart' as time_zone;

import '../../l10n/app_localizations.dart';
import '../../l10n/app_localizations_en.dart';
import 'care_task.dart';
import 'device_time_zone.dart';
import 'reminder_scheduler.dart';

final class LocalNotificationScheduler implements ReminderScheduler {
  LocalNotificationScheduler({
    FlutterLocalNotificationsPlugin? plugin,
    AppLocalizations? messages,
  }) : _plugin = plugin ?? FlutterLocalNotificationsPlugin(),
       _messages = messages ?? AppLocalizationsEn();

  static const _channelId = 'maintenance_schedules';

  final FlutterLocalNotificationsPlugin _plugin;
  final AppLocalizations _messages;

  @override
  Future<void> initialize() async {
    time_zone_data.initializeTimeZones();
    try {
      final identifier = await DeviceTimeZone.identifier();
      time_zone.setLocalLocation(time_zone.getLocation(identifier));
    } on Object {
      time_zone.setLocalLocation(time_zone.UTC);
    }

    await _plugin.initialize(
      settings: const InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
        iOS: DarwinInitializationSettings(
          requestAlertPermission: false,
          requestBadgePermission: false,
          requestSoundPermission: false,
        ),
      ),
    );
  }

  @override
  Future<bool> requestPermission() async {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return await _plugin
              .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
              ?.requestNotificationsPermission() ??
          true;
    }
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return await _plugin
              .resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()
              ?.requestPermissions(alert: true, badge: true, sound: true) ??
          false;
    }
    return false;
  }

  @override
  Future<void> schedule(CareTask task) async {
    await cancel(task.id);
    if (!task.remindersEnabled) {
      return;
    }
    final localDue = task.nextDueAt.toLocal();
    final hour = task.reminderMinutesAfterMidnight ~/ 60;
    final minute = task.reminderMinutesAfterMidnight % 60;
    var scheduled = time_zone.TZDateTime(
      time_zone.local,
      localDue.year,
      localDue.month,
      localDue.day,
      hour,
      minute,
    );
    final now = time_zone.TZDateTime.now(time_zone.local);
    if (!scheduled.isAfter(now)) {
      scheduled = now.add(const Duration(minutes: 1));
    }
    await _plugin.zonedSchedule(
      id: _notificationId(task.id),
      title: task.title,
      body: _messages.careTaskNotificationBody,
      scheduledDate: scheduled,
      notificationDetails: NotificationDetails(
        android: AndroidNotificationDetails(
          _channelId,
          _messages.notificationChannelName,
          channelDescription: _messages.notificationChannelDescription,
          importance: Importance.high,
          priority: Priority.high,
        ),
        iOS: const DarwinNotificationDetails(),
      ),
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      payload: 'task:${task.id}',
    );
  }

  @override
  Future<void> cancel(String taskId) => _plugin.cancel(id: _notificationId(taskId));

  @override
  Future<void> synchronize(Iterable<CareTask> tasks) async {
    for (final task in tasks) {
      if (task.remindersEnabled) {
        await schedule(task);
      } else {
        await cancel(task.id);
      }
    }
  }
}

int _notificationId(String value) {
  var hash = 0x811C9DC5;
  for (final unit in value.codeUnits) {
    hash ^= unit;
    hash = (hash * 0x01000193) & 0x7FFFFFFF;
  }
  return hash;
}
