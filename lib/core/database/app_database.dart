import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

import '../../features/devices/device_tables.dart';
import '../../features/inventory/inventory_tables.dart';
import '../../features/schedule/schedule_tables.dart';
import '../../features/settings/preference_tables.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: <Type>[
    DeviceRecords,
    SupplyRecords,
    InventoryEventRecords,
    CareTaskRecords,
    TaskCompletionRecords,
    PreferenceRecords,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator migrator) async {
      await migrator.createAll();
    },
    beforeOpen: (OpeningDetails details) async {
      await customStatement('PRAGMA foreign_keys = ON');
    },
  );

  static QueryExecutor _openConnection() {
    return LazyDatabase(() async {
      final directory = await getApplicationSupportDirectory();
      final file = File(path.join(directory.path, 'carecache.sqlite'));
      return NativeDatabase.createInBackground(file);
    });
  }
}
