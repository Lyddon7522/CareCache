import 'dart:convert';
import 'dart:io';

import 'package:archive/archive.dart';
import 'package:crypto/crypto.dart';
import 'package:drift/drift.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

import '../../core/database/app_database.dart';
import '../devices/device_tables.dart';
import '../inventory/inventory_tables.dart';
import '../inventory/supply.dart';
import '../schedule/care_task.dart';
import '../schedule/schedule_tables.dart';
import 'preference_tables.dart';

final class UnsupportedBackupException implements Exception {
  const UnsupportedBackupException(this.message);

  final String message;
}

final class CorruptBackupException implements Exception {
  const CorruptBackupException(this.message);

  final String message;
}

final class BackupManifest {
  const BackupManifest({
    required this.createdAt,
    required this.schemaVersion,
    required this.dataChecksumSha256,
  });

  factory BackupManifest.fromJson(Map<String, Object?> json) {
    if (json['format'] != formatName) {
      throw const UnsupportedBackupException('This is not a CareCache backup.');
    }
    if (json['formatVersion'] != currentFormatVersion) {
      throw UnsupportedBackupException(
        'Backup format version ${json['formatVersion']} is not supported.',
      );
    }
    final schemaVersion = json['schemaVersion'];
    final createdAt = json['createdAt'];
    final checksum = json['dataChecksumSha256'];
    if (json['dataFile'] != 'data.json' ||
        schemaVersion is! int ||
        createdAt is! String ||
        checksum is! String ||
        !_sha256Pattern.hasMatch(checksum)) {
      throw const CorruptBackupException('Backup manifest is invalid.');
    }
    return BackupManifest(
      createdAt: DateTime.parse(createdAt),
      schemaVersion: schemaVersion,
      dataChecksumSha256: checksum,
    );
  }

  static const String formatName = 'carecache-backup';
  static const int currentFormatVersion = 1;

  final DateTime createdAt;
  final int schemaVersion;
  final String dataChecksumSha256;

  Map<String, Object?> toJson() => <String, Object?>{
    'format': formatName,
    'formatVersion': currentFormatVersion,
    'schemaVersion': schemaVersion,
    'createdAt': createdAt.toUtc().toIso8601String(),
    'dataFile': 'data.json',
    'dataChecksumSha256': dataChecksumSha256,
  };
}

final class CareCacheSnapshot {
  const CareCacheSnapshot({
    required this.devices,
    required this.supplies,
    required this.inventoryEvents,
    required this.tasks,
    required this.taskCompletions,
    required this.preferences,
  });

  final List<DeviceRecord> devices;
  final List<SupplyRecord> supplies;
  final List<InventoryEventRecord> inventoryEvents;
  final List<CareTaskRecord> tasks;
  final List<TaskCompletionRecord> taskCompletions;
  final List<PreferenceRecord> preferences;
}

final class ValidatedBackup {
  const ValidatedBackup({required this.manifest, required this.snapshot});

  final BackupManifest manifest;
  final CareCacheSnapshot snapshot;
}

final class CareCacheBackupService {
  CareCacheBackupService(
    this._database, {
    Future<Directory> Function()? supportDirectory,
  }) : _supportDirectory = supportDirectory ?? getApplicationSupportDirectory;

  static const int schemaVersion = 1;
  static const int _maxArchiveBytes = 20 * 1024 * 1024;
  static const int _maxEntryBytes = 50 * 1024 * 1024;
  static const ValueSerializer _serializer = ValueSerializer.defaults(
    serializeDateTimeValuesAsString: true,
  );

  final AppDatabase _database;
  final Future<Directory> Function() _supportDirectory;

  Future<File> createExportFile() async {
    final bytes = await createBytes();
    final directory = await getTemporaryDirectory();
    final stamp = DateTime.now().toUtc().toIso8601String().replaceAll(':', '-');
    final file = File(path.join(directory.path, 'carecache-$stamp.carecache'));
    await file.writeAsBytes(bytes, flush: true);
    return file;
  }

  Future<Uint8List> createBytes() async {
    final devices = await (_database.select(
      _database.deviceRecords,
    )..orderBy(<OrderingTerm Function(DeviceRecords)>[(row) => OrderingTerm.asc(row.id)])).get();
    final supplies = await (_database.select(
      _database.supplyRecords,
    )..orderBy(<OrderingTerm Function(SupplyRecords)>[(row) => OrderingTerm.asc(row.id)])).get();
    final events =
        await (_database.select(_database.inventoryEventRecords)
              ..orderBy(<OrderingTerm Function(InventoryEventRecords)>[
                (row) => OrderingTerm.asc(row.id),
              ]))
            .get();
    final tasks = await (_database.select(
      _database.careTaskRecords,
    )..orderBy(<OrderingTerm Function(CareTaskRecords)>[(row) => OrderingTerm.asc(row.id)])).get();
    final completions =
        await (_database.select(_database.taskCompletionRecords)
              ..orderBy(<OrderingTerm Function(TaskCompletionRecords)>[
                (row) => OrderingTerm.asc(row.id),
              ]))
            .get();
    final preferences =
        await (_database.select(_database.preferenceRecords)
              ..orderBy(<OrderingTerm Function(PreferenceRecords)>[
                (row) => OrderingTerm.asc(row.key),
              ]))
            .get();

    final dataJson = <String, Object?>{
      'schemaVersion': schemaVersion,
      'devices': devices.map((row) => _jsonMap(row.toJson(serializer: _serializer))).toList(),
      'supplies': supplies.map((row) => _jsonMap(row.toJson(serializer: _serializer))).toList(),
      'inventoryEvents': events
          .map((row) => _jsonMap(row.toJson(serializer: _serializer)))
          .toList(),
      'careTasks': tasks.map((row) => _jsonMap(row.toJson(serializer: _serializer))).toList(),
      'taskCompletions': completions
          .map((row) => _jsonMap(row.toJson(serializer: _serializer)))
          .toList(),
      'preferences': preferences
          .map((row) => _jsonMap(row.toJson(serializer: _serializer)))
          .toList(),
    };
    final dataBytes = Uint8List.fromList(utf8.encode(jsonEncode(dataJson)));
    final manifest = BackupManifest(
      createdAt: DateTime.now().toUtc(),
      schemaVersion: schemaVersion,
      dataChecksumSha256: sha256.convert(dataBytes).toString(),
    );
    final archive = Archive()
      ..add(ArchiveFile.string('manifest.json', jsonEncode(manifest.toJson())))
      ..add(ArchiveFile.bytes('data.json', dataBytes));
    return ZipEncoder().encodeBytes(archive);
  }

  ValidatedBackup validate(Uint8List bytes) {
    if (bytes.length > _maxArchiveBytes) {
      throw const CorruptBackupException('Backup archive is too large.');
    }
    late final Archive archive;
    try {
      archive = ZipDecoder().decodeBytes(bytes, verify: true);
    } on Object catch (error) {
      throw CorruptBackupException('The archive could not be opened: $error');
    }
    final paths = <String>{};
    for (final entry in archive) {
      if (!entry.isFile || _unsafePath(entry.name) || !paths.add(entry.name)) {
        throw const CorruptBackupException('The archive contains an unsafe or duplicate path.');
      }
      if (entry.size > _maxEntryBytes) {
        throw const CorruptBackupException('The archive contains an oversized entry.');
      }
    }
    if (paths.length != 2 || !paths.containsAll(const <String>{'manifest.json', 'data.json'})) {
      throw const CorruptBackupException('The archive contains undeclared files.');
    }
    late final Uint8List manifestBytes;
    late final Uint8List dataBytes;
    try {
      final manifestEntry = archive.find('manifest.json');
      final dataEntry = archive.find('data.json');
      if (manifestEntry == null || dataEntry == null) {
        throw const CorruptBackupException('Manifest or canonical data is missing.');
      }
      final decodedManifest = manifestEntry.readBytes();
      final decodedData = dataEntry.readBytes();
      if (decodedManifest == null || decodedData == null) {
        throw const CorruptBackupException('Manifest or canonical data could not be read.');
      }
      manifestBytes = decodedManifest;
      dataBytes = decodedData;
    } on CorruptBackupException {
      rethrow;
    } on Object catch (error) {
      throw CorruptBackupException('Archive entries could not be read: $error');
    }

    try {
      final manifest = BackupManifest.fromJson(
        jsonDecode(utf8.decode(manifestBytes)) as Map<String, Object?>,
      );
      if (manifest.schemaVersion != schemaVersion) {
        throw UnsupportedBackupException(
          'Backup schema version ${manifest.schemaVersion} is not supported.',
        );
      }
      if (sha256.convert(dataBytes).toString() != manifest.dataChecksumSha256) {
        throw const CorruptBackupException('Canonical data checksum does not match.');
      }
      final root = jsonDecode(utf8.decode(dataBytes)) as Map<String, Object?>;
      if (root['schemaVersion'] != manifest.schemaVersion) {
        throw const CorruptBackupException('Manifest and data schema versions disagree.');
      }
      final snapshot = CareCacheSnapshot(
        devices: _decodeList(root['devices'], DeviceRecord.fromJson),
        supplies: _decodeList(root['supplies'], SupplyRecord.fromJson),
        inventoryEvents: _decodeList(root['inventoryEvents'], InventoryEventRecord.fromJson),
        tasks: _decodeList(root['careTasks'], CareTaskRecord.fromJson),
        taskCompletions: _decodeList(
          root['taskCompletions'],
          TaskCompletionRecord.fromJson,
        ),
        preferences: _decodeList(root['preferences'], PreferenceRecord.fromJson),
      );
      _validateSnapshot(snapshot);
      return ValidatedBackup(manifest: manifest, snapshot: snapshot);
    } on UnsupportedBackupException {
      rethrow;
    } on CorruptBackupException {
      rethrow;
    } on Object catch (error) {
      throw CorruptBackupException('Backup metadata is invalid: $error');
    }
  }

  Future<void> restoreFile(String filePath) async {
    final bytes = await File(filePath).readAsBytes();
    final validated = validate(bytes);
    await _writeSafetySnapshot(await createBytes());
    await _database.transaction(() async {
      await _database.delete(_database.taskCompletionRecords).go();
      await _database.delete(_database.careTaskRecords).go();
      await _database.delete(_database.inventoryEventRecords).go();
      await _database.delete(_database.supplyRecords).go();
      await _database.delete(_database.deviceRecords).go();
      await _database.delete(_database.preferenceRecords).go();

      for (final row in validated.snapshot.devices) {
        await _database.into(_database.deviceRecords).insert(row);
      }
      for (final row in validated.snapshot.supplies) {
        await _database.into(_database.supplyRecords).insert(row);
      }
      for (final row in validated.snapshot.inventoryEvents) {
        await _database.into(_database.inventoryEventRecords).insert(row);
      }
      for (final row in validated.snapshot.tasks) {
        await _database.into(_database.careTaskRecords).insert(row);
      }
      for (final row in validated.snapshot.taskCompletions) {
        await _database.into(_database.taskCompletionRecords).insert(row);
      }
      for (final row in validated.snapshot.preferences) {
        await _database.into(_database.preferenceRecords).insert(row);
      }
    });
  }

  Future<void> _writeSafetySnapshot(Uint8List bytes) async {
    final support = await _supportDirectory();
    final directory = Directory(path.join(support.path, 'safety-backups'));
    await directory.create(recursive: true);
    final stamp = DateTime.now().toUtc().toIso8601String().replaceAll(':', '-');
    final file = File(path.join(directory.path, 'before-restore-$stamp.carecache'));
    await file.writeAsBytes(bytes, flush: true);
  }
}

List<T> _decodeList<T>(Object? value, T Function(Map<String, Object?>) decode) {
  if (value is! List<Object?>) {
    throw const CorruptBackupException('Canonical record list is missing.');
  }
  return value
      .map((item) {
        if (item is! Map<String, Object?>) {
          throw const CorruptBackupException('Canonical record is invalid.');
        }
        return decode(item);
      })
      .toList(growable: false);
}

Map<String, Object?> _jsonMap(Map<String, dynamic> value) {
  return value.cast<String, Object?>();
}

void _validateSnapshot(CareCacheSnapshot snapshot) {
  _requireUnique('device', snapshot.devices.map((row) => row.id));
  _requireUnique('supply', snapshot.supplies.map((row) => row.id));
  _requireUnique('inventory event', snapshot.inventoryEvents.map((row) => row.id));
  _requireUnique('care task', snapshot.tasks.map((row) => row.id));
  _requireUnique('task completion', snapshot.taskCompletions.map((row) => row.id));
  _requireUnique('preference', snapshot.preferences.map((row) => row.key));

  final deviceIds = snapshot.devices.map((row) => row.id).toSet();
  final supplyIds = snapshot.supplies.map((row) => row.id).toSet();
  final taskIds = snapshot.tasks.map((row) => row.id).toSet();
  final supplyCategories = SupplyCategory.values.map((value) => value.name).toSet();
  final eventKinds = InventoryEventKind.values.map((value) => value.name).toSet();
  final taskKinds = CareTaskKind.values.map((value) => value.name).toSet();

  if (snapshot.devices.any((row) => row.name.trim().isEmpty) ||
      snapshot.supplies.any(
        (row) =>
            row.name.trim().isEmpty ||
            row.unitLabel.trim().isEmpty ||
            row.quantityOnHand < 0 ||
            row.reorderPoint < 0 ||
            !supplyCategories.contains(row.category) ||
            (row.deviceId != null && !deviceIds.contains(row.deviceId)),
      ) ||
      snapshot.inventoryEvents.any(
        (row) => !supplyIds.contains(row.supplyId) || !eventKinds.contains(row.kind),
      ) ||
      snapshot.tasks.any(
        (row) =>
            row.title.trim().isEmpty ||
            row.cadenceDays < 1 ||
            row.reminderMinutesAfterMidnight < 0 ||
            row.reminderMinutesAfterMidnight > 1439 ||
            !taskKinds.contains(row.kind) ||
            (row.deviceId != null && !deviceIds.contains(row.deviceId)) ||
            (row.supplyId != null && !supplyIds.contains(row.supplyId)),
      ) ||
      snapshot.taskCompletions.any((row) => !taskIds.contains(row.taskId)) ||
      snapshot.preferences.any((row) => row.key.trim().isEmpty)) {
    throw const CorruptBackupException('Backup contains invalid records or broken references.');
  }
}

void _requireUnique(String label, Iterable<String> ids) {
  final values = ids.toList(growable: false);
  if (values.any((id) => id.trim().isEmpty) || values.toSet().length != values.length) {
    throw CorruptBackupException('Backup contains invalid or duplicate $label identifiers.');
  }
}

bool _unsafePath(String value) {
  return value.startsWith('/') ||
      value.startsWith('\\') ||
      value.split(RegExp(r'[/\\]')).contains('..');
}

final RegExp _sha256Pattern = RegExp(r'^[a-f0-9]{64}$');
