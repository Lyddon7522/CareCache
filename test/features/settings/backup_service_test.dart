import 'dart:io';

import 'package:carecache/core/database/app_database.dart';
import 'package:carecache/features/inventory/drift_inventory_store.dart';
import 'package:carecache/features/inventory/supply.dart';
import 'package:carecache/features/settings/backup_service.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AppDatabase database;
  late Directory temporaryDirectory;
  late CareCacheBackupService backups;

  setUp(() async {
    database = AppDatabase(NativeDatabase.memory());
    temporaryDirectory = await Directory.systemTemp.createTemp('carecache-backup-test-');
    backups = CareCacheBackupService(
      database,
      supportDirectory: () async => temporaryDirectory,
    );
  });

  tearDown(() async {
    await database.close();
    await temporaryDirectory.delete(recursive: true);
  });

  test('creates and validates the versioned portable archive', () async {
    await _saveSyntheticSupply(database, name: 'Synthetic filter');

    final bytes = await backups.createBytes();
    final validated = backups.validate(bytes);

    expect(validated.manifest.schemaVersion, CareCacheBackupService.schemaVersion);
    expect(validated.snapshot.supplies.single.name, 'Synthetic filter');
    expect(validated.snapshot.inventoryEvents, hasLength(1));
  });

  test('restore replaces live data and writes a safety snapshot', () async {
    await _saveSyntheticSupply(database, name: 'Original synthetic filter');
    final bytes = await backups.createBytes();
    final file = File('${temporaryDirectory.path}/portable.carecache');
    await file.writeAsBytes(bytes);
    await _saveSyntheticSupply(database, name: 'Temporary synthetic hose');

    await backups.restoreFile(file.path);

    final supplies = await database.select(database.supplyRecords).get();
    final safetyFiles = Directory('${temporaryDirectory.path}/safety-backups').listSync();
    expect(supplies.map((supply) => supply.name), <String>['Original synthetic filter']);
    expect(safetyFiles, hasLength(1));
  });

  test('rejects a corrupted archive before changing the database', () async {
    await _saveSyntheticSupply(database, name: 'Synthetic mask');
    final bytes = await backups.createBytes();
    bytes[bytes.length ~/ 2] ^= 0xFF;

    expect(() => backups.validate(bytes), throwsA(isA<CorruptBackupException>()));
    expect(await database.select(database.supplyRecords).get(), hasLength(1));
  });
}

Future<void> _saveSyntheticSupply(AppDatabase database, {required String name}) async {
  await DriftInventoryStore(database).save(
    SupplyDraft(
      name: name,
      category: SupplyCategory.cpap,
      unitLabel: 'item',
      quantityOnHand: 2,
      reorderPoint: 1,
    ),
  );
}
