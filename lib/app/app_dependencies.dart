import 'dart:io';

import '../core/cqrs/mediator.dart';
import '../core/database/app_database.dart';
import '../features/devices/archive_device/archive_device.dart';
import '../features/devices/device.dart';
import '../features/devices/device_store.dart';
import '../features/devices/drift_device_store.dart';
import '../features/devices/save_device/save_device.dart';
import '../features/devices/watch_devices/watch_devices.dart';
import '../features/inventory/adjust_inventory/adjust_inventory.dart';
import '../features/inventory/archive_supply/archive_supply.dart';
import '../features/inventory/drift_inventory_store.dart';
import '../features/inventory/find_supply_by_barcode/find_supply_by_barcode.dart';
import '../features/inventory/inventory_store.dart';
import '../features/inventory/mark_supply_replaced/mark_supply_replaced.dart';
import '../features/inventory/save_supply/save_supply.dart';
import '../features/inventory/supply.dart';
import '../features/inventory/watch_inventory/watch_inventory.dart';
import '../features/schedule/archive_task/archive_task.dart';
import '../features/schedule/care_task.dart';
import '../features/schedule/complete_task/complete_task.dart';
import '../features/schedule/drift_schedule_store.dart';
import '../features/schedule/local_notification_scheduler.dart';
import '../features/schedule/reminder_scheduler.dart';
import '../features/schedule/request_reminder_permission/request_reminder_permission.dart';
import '../features/schedule/save_task/save_task.dart';
import '../features/schedule/schedule_store.dart';
import '../features/schedule/watch_schedule/watch_schedule.dart';
import '../features/settings/appearance.dart';
import '../features/settings/backup_service.dart';
import '../features/settings/change_appearance/change_appearance.dart';
import '../features/settings/drift_appearance_store.dart';
import '../features/settings/export_backup/export_backup.dart';
import '../features/settings/restore_backup/restore_backup.dart';

final class AppDependencies {
  AppDependencies._({
    required this.database,
    required this.mediator,
    required this.reminders,
  });

  final AppDatabase database;
  final Mediator mediator;
  final ReminderScheduler reminders;

  static Future<AppDependencies> create({
    AppDatabase? database,
    ReminderScheduler? reminders,
  }) async {
    final appDatabase = database ?? AppDatabase();
    final reminderScheduler = reminders ?? LocalNotificationScheduler();
    await reminderScheduler.initialize();

    final inventoryStore = DriftInventoryStore(appDatabase);
    final deviceStore = DriftDeviceStore(appDatabase);
    final scheduleStore = DriftScheduleStore(appDatabase);
    final backupService = CareCacheBackupService(appDatabase);
    final appearanceStore = DriftAppearanceStore(appDatabase);
    final mediator = _createMediator(
      inventoryStore: inventoryStore,
      deviceStore: deviceStore,
      scheduleStore: scheduleStore,
      reminders: reminderScheduler,
      backupService: backupService,
      appearanceStore: appearanceStore,
    );
    return AppDependencies._(
      database: appDatabase,
      mediator: mediator,
      reminders: reminderScheduler,
    );
  }

  Future<void> dispose() => database.close();
}

Mediator _createMediator({
  required InventoryStore inventoryStore,
  required DeviceStore deviceStore,
  required ScheduleStore scheduleStore,
  required ReminderScheduler reminders,
  required CareCacheBackupService backupService,
  required AppearanceStore appearanceStore,
}) {
  final mediator = Mediator()
    ..registerCommand<SaveSupplyCommand, String>(SaveSupplyHandler(inventoryStore))
    ..registerCommand<AdjustInventoryCommand, void>(AdjustInventoryHandler(inventoryStore))
    ..registerCommand<MarkSupplyReplacedCommand, void>(
      MarkSupplyReplacedHandler(inventoryStore),
    )
    ..registerCommand<ArchiveSupplyCommand, void>(ArchiveSupplyHandler(inventoryStore))
    ..registerQuery<WatchInventoryQuery, Stream<List<SupplyItem>>>(
      WatchInventoryHandler(inventoryStore),
    )
    ..registerQuery<WatchSupplyQuery, Stream<SupplyItem?>>(WatchSupplyHandler(inventoryStore))
    ..registerQuery<FindSupplyByBarcodeQuery, Future<SupplyItem?>>(
      FindSupplyByBarcodeHandler(inventoryStore),
    )
    ..registerCommand<SaveDeviceCommand, String>(SaveDeviceHandler(deviceStore))
    ..registerCommand<ArchiveDeviceCommand, void>(ArchiveDeviceHandler(deviceStore))
    ..registerQuery<WatchDevicesQuery, Stream<List<MedicalDevice>>>(
      WatchDevicesHandler(deviceStore),
    )
    ..registerQuery<WatchDeviceQuery, Stream<MedicalDevice?>>(WatchDeviceHandler(deviceStore))
    ..registerCommand<SaveTaskCommand, String>(SaveTaskHandler(scheduleStore, reminders))
    ..registerCommand<CompleteTaskCommand, CareTask>(
      CompleteTaskHandler(scheduleStore, reminders),
    )
    ..registerCommand<ArchiveTaskCommand, void>(ArchiveTaskHandler(scheduleStore, reminders))
    ..registerCommand<RequestReminderPermissionCommand, bool>(
      RequestReminderPermissionHandler(reminders),
    )
    ..registerQuery<WatchScheduleQuery, Stream<List<CareTask>>>(
      WatchScheduleHandler(scheduleStore),
    )
    ..registerQuery<WatchTaskQuery, Stream<CareTask?>>(WatchTaskHandler(scheduleStore));
  mediator
    ..registerCommand<ExportBackupCommand, File>(ExportBackupHandler(backupService))
    ..registerCommand<RestoreBackupCommand, void>(
      RestoreBackupHandler(backupService, scheduleStore, reminders),
    )
    ..registerCommand<SetAppearanceCommand, void>(SetAppearanceHandler(appearanceStore))
    ..registerQuery<WatchAppearanceQuery, Stream<CareAppearance>>(
      WatchAppearanceHandler(appearanceStore),
    );
  return mediator;
}
