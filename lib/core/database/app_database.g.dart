// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $DeviceRecordsTable extends DeviceRecords with TableInfo<$DeviceRecordsTable, DeviceRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DeviceRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _manufacturerMeta = const VerificationMeta(
    'manufacturer',
  );
  @override
  late final GeneratedColumn<String> manufacturer = GeneratedColumn<String>(
    'manufacturer',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _modelNumberMeta = const VerificationMeta(
    'modelNumber',
  );
  @override
  late final GeneratedColumn<String> modelNumber = GeneratedColumn<String>(
    'model_number',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _serialNumberMeta = const VerificationMeta(
    'serialNumber',
  );
  @override
  late final GeneratedColumn<String> serialNumber = GeneratedColumn<String>(
    'serial_number',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _installedAtMeta = const VerificationMeta(
    'installedAt',
  );
  @override
  late final GeneratedColumn<DateTime> installedAt = GeneratedColumn<DateTime>(
    'installed_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _warrantyExpiresAtMeta = const VerificationMeta(
    'warrantyExpiresAt',
  );
  @override
  late final GeneratedColumn<DateTime> warrantyExpiresAt = GeneratedColumn<DateTime>(
    'warranty_expires_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _supplierMeta = const VerificationMeta(
    'supplier',
  );
  @override
  late final GeneratedColumn<String> supplier = GeneratedColumn<String>(
    'supplier',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _manualUrlMeta = const VerificationMeta(
    'manualUrl',
  );
  @override
  late final GeneratedColumn<String> manualUrl = GeneratedColumn<String>(
    'manual_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _storageLocationMeta = const VerificationMeta(
    'storageLocation',
  );
  @override
  late final GeneratedColumn<String> storageLocation = GeneratedColumn<String>(
    'storage_location',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _prescriptionModeMeta = const VerificationMeta(
    'prescriptionMode',
  );
  @override
  late final GeneratedColumn<String> prescriptionMode = GeneratedColumn<String>(
    'prescription_mode',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _pressureMinMeta = const VerificationMeta(
    'pressureMin',
  );
  @override
  late final GeneratedColumn<double> pressureMin = GeneratedColumn<double>(
    'pressure_min',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _pressureMaxMeta = const VerificationMeta(
    'pressureMax',
  );
  @override
  late final GeneratedColumn<double> pressureMax = GeneratedColumn<double>(
    'pressure_max',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _pressureUnitMeta = const VerificationMeta(
    'pressureUnit',
  );
  @override
  late final GeneratedColumn<String> pressureUnit = GeneratedColumn<String>(
    'pressure_unit',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _humidifierSettingMeta = const VerificationMeta(
    'humidifierSetting',
  );
  @override
  late final GeneratedColumn<String> humidifierSetting = GeneratedColumn<String>(
    'humidifier_setting',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _rampMinutesMeta = const VerificationMeta(
    'rampMinutes',
  );
  @override
  late final GeneratedColumn<int> rampMinutes = GeneratedColumn<int>(
    'ramp_minutes',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _prescribedByMeta = const VerificationMeta(
    'prescribedBy',
  );
  @override
  late final GeneratedColumn<String> prescribedBy = GeneratedColumn<String>(
    'prescribed_by',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _prescribedAtMeta = const VerificationMeta(
    'prescribedAt',
  );
  @override
  late final GeneratedColumn<DateTime> prescribedAt = GeneratedColumn<DateTime>(
    'prescribed_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _prescriptionNotesMeta = const VerificationMeta(
    'prescriptionNotes',
  );
  @override
  late final GeneratedColumn<String> prescriptionNotes = GeneratedColumn<String>(
    'prescription_notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _archivedAtMeta = const VerificationMeta(
    'archivedAt',
  );
  @override
  late final GeneratedColumn<DateTime> archivedAt = GeneratedColumn<DateTime>(
    'archived_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    category,
    manufacturer,
    modelNumber,
    serialNumber,
    installedAt,
    warrantyExpiresAt,
    supplier,
    manualUrl,
    storageLocation,
    prescriptionMode,
    pressureMin,
    pressureMax,
    pressureUnit,
    humidifierSetting,
    rampMinutes,
    prescribedBy,
    prescribedAt,
    prescriptionNotes,
    notes,
    createdAt,
    updatedAt,
    archivedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'device_records';
  @override
  VerificationContext validateIntegrity(
    Insertable<DeviceRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('manufacturer')) {
      context.handle(
        _manufacturerMeta,
        manufacturer.isAcceptableOrUnknown(
          data['manufacturer']!,
          _manufacturerMeta,
        ),
      );
    }
    if (data.containsKey('model_number')) {
      context.handle(
        _modelNumberMeta,
        modelNumber.isAcceptableOrUnknown(
          data['model_number']!,
          _modelNumberMeta,
        ),
      );
    }
    if (data.containsKey('serial_number')) {
      context.handle(
        _serialNumberMeta,
        serialNumber.isAcceptableOrUnknown(
          data['serial_number']!,
          _serialNumberMeta,
        ),
      );
    }
    if (data.containsKey('installed_at')) {
      context.handle(
        _installedAtMeta,
        installedAt.isAcceptableOrUnknown(
          data['installed_at']!,
          _installedAtMeta,
        ),
      );
    }
    if (data.containsKey('warranty_expires_at')) {
      context.handle(
        _warrantyExpiresAtMeta,
        warrantyExpiresAt.isAcceptableOrUnknown(
          data['warranty_expires_at']!,
          _warrantyExpiresAtMeta,
        ),
      );
    }
    if (data.containsKey('supplier')) {
      context.handle(
        _supplierMeta,
        supplier.isAcceptableOrUnknown(data['supplier']!, _supplierMeta),
      );
    }
    if (data.containsKey('manual_url')) {
      context.handle(
        _manualUrlMeta,
        manualUrl.isAcceptableOrUnknown(data['manual_url']!, _manualUrlMeta),
      );
    }
    if (data.containsKey('storage_location')) {
      context.handle(
        _storageLocationMeta,
        storageLocation.isAcceptableOrUnknown(
          data['storage_location']!,
          _storageLocationMeta,
        ),
      );
    }
    if (data.containsKey('prescription_mode')) {
      context.handle(
        _prescriptionModeMeta,
        prescriptionMode.isAcceptableOrUnknown(
          data['prescription_mode']!,
          _prescriptionModeMeta,
        ),
      );
    }
    if (data.containsKey('pressure_min')) {
      context.handle(
        _pressureMinMeta,
        pressureMin.isAcceptableOrUnknown(
          data['pressure_min']!,
          _pressureMinMeta,
        ),
      );
    }
    if (data.containsKey('pressure_max')) {
      context.handle(
        _pressureMaxMeta,
        pressureMax.isAcceptableOrUnknown(
          data['pressure_max']!,
          _pressureMaxMeta,
        ),
      );
    }
    if (data.containsKey('pressure_unit')) {
      context.handle(
        _pressureUnitMeta,
        pressureUnit.isAcceptableOrUnknown(
          data['pressure_unit']!,
          _pressureUnitMeta,
        ),
      );
    }
    if (data.containsKey('humidifier_setting')) {
      context.handle(
        _humidifierSettingMeta,
        humidifierSetting.isAcceptableOrUnknown(
          data['humidifier_setting']!,
          _humidifierSettingMeta,
        ),
      );
    }
    if (data.containsKey('ramp_minutes')) {
      context.handle(
        _rampMinutesMeta,
        rampMinutes.isAcceptableOrUnknown(
          data['ramp_minutes']!,
          _rampMinutesMeta,
        ),
      );
    }
    if (data.containsKey('prescribed_by')) {
      context.handle(
        _prescribedByMeta,
        prescribedBy.isAcceptableOrUnknown(
          data['prescribed_by']!,
          _prescribedByMeta,
        ),
      );
    }
    if (data.containsKey('prescribed_at')) {
      context.handle(
        _prescribedAtMeta,
        prescribedAt.isAcceptableOrUnknown(
          data['prescribed_at']!,
          _prescribedAtMeta,
        ),
      );
    }
    if (data.containsKey('prescription_notes')) {
      context.handle(
        _prescriptionNotesMeta,
        prescriptionNotes.isAcceptableOrUnknown(
          data['prescription_notes']!,
          _prescriptionNotesMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('archived_at')) {
      context.handle(
        _archivedAtMeta,
        archivedAt.isAcceptableOrUnknown(data['archived_at']!, _archivedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DeviceRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DeviceRecord(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      manufacturer: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}manufacturer'],
      ),
      modelNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}model_number'],
      ),
      serialNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}serial_number'],
      ),
      installedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}installed_at'],
      ),
      warrantyExpiresAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}warranty_expires_at'],
      ),
      supplier: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}supplier'],
      ),
      manualUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}manual_url'],
      ),
      storageLocation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}storage_location'],
      ),
      prescriptionMode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}prescription_mode'],
      ),
      pressureMin: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}pressure_min'],
      ),
      pressureMax: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}pressure_max'],
      ),
      pressureUnit: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pressure_unit'],
      ),
      humidifierSetting: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}humidifier_setting'],
      ),
      rampMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ramp_minutes'],
      ),
      prescribedBy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}prescribed_by'],
      ),
      prescribedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}prescribed_at'],
      ),
      prescriptionNotes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}prescription_notes'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      archivedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}archived_at'],
      ),
    );
  }

  @override
  $DeviceRecordsTable createAlias(String alias) {
    return $DeviceRecordsTable(attachedDatabase, alias);
  }
}

class DeviceRecord extends DataClass implements Insertable<DeviceRecord> {
  final String id;
  final String name;
  final String category;
  final String? manufacturer;
  final String? modelNumber;
  final String? serialNumber;
  final DateTime? installedAt;
  final DateTime? warrantyExpiresAt;
  final String? supplier;
  final String? manualUrl;
  final String? storageLocation;
  final String? prescriptionMode;
  final double? pressureMin;
  final double? pressureMax;
  final String? pressureUnit;
  final String? humidifierSetting;
  final int? rampMinutes;
  final String? prescribedBy;
  final DateTime? prescribedAt;
  final String? prescriptionNotes;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? archivedAt;
  const DeviceRecord({
    required this.id,
    required this.name,
    required this.category,
    this.manufacturer,
    this.modelNumber,
    this.serialNumber,
    this.installedAt,
    this.warrantyExpiresAt,
    this.supplier,
    this.manualUrl,
    this.storageLocation,
    this.prescriptionMode,
    this.pressureMin,
    this.pressureMax,
    this.pressureUnit,
    this.humidifierSetting,
    this.rampMinutes,
    this.prescribedBy,
    this.prescribedAt,
    this.prescriptionNotes,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
    this.archivedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['category'] = Variable<String>(category);
    if (!nullToAbsent || manufacturer != null) {
      map['manufacturer'] = Variable<String>(manufacturer);
    }
    if (!nullToAbsent || modelNumber != null) {
      map['model_number'] = Variable<String>(modelNumber);
    }
    if (!nullToAbsent || serialNumber != null) {
      map['serial_number'] = Variable<String>(serialNumber);
    }
    if (!nullToAbsent || installedAt != null) {
      map['installed_at'] = Variable<DateTime>(installedAt);
    }
    if (!nullToAbsent || warrantyExpiresAt != null) {
      map['warranty_expires_at'] = Variable<DateTime>(warrantyExpiresAt);
    }
    if (!nullToAbsent || supplier != null) {
      map['supplier'] = Variable<String>(supplier);
    }
    if (!nullToAbsent || manualUrl != null) {
      map['manual_url'] = Variable<String>(manualUrl);
    }
    if (!nullToAbsent || storageLocation != null) {
      map['storage_location'] = Variable<String>(storageLocation);
    }
    if (!nullToAbsent || prescriptionMode != null) {
      map['prescription_mode'] = Variable<String>(prescriptionMode);
    }
    if (!nullToAbsent || pressureMin != null) {
      map['pressure_min'] = Variable<double>(pressureMin);
    }
    if (!nullToAbsent || pressureMax != null) {
      map['pressure_max'] = Variable<double>(pressureMax);
    }
    if (!nullToAbsent || pressureUnit != null) {
      map['pressure_unit'] = Variable<String>(pressureUnit);
    }
    if (!nullToAbsent || humidifierSetting != null) {
      map['humidifier_setting'] = Variable<String>(humidifierSetting);
    }
    if (!nullToAbsent || rampMinutes != null) {
      map['ramp_minutes'] = Variable<int>(rampMinutes);
    }
    if (!nullToAbsent || prescribedBy != null) {
      map['prescribed_by'] = Variable<String>(prescribedBy);
    }
    if (!nullToAbsent || prescribedAt != null) {
      map['prescribed_at'] = Variable<DateTime>(prescribedAt);
    }
    if (!nullToAbsent || prescriptionNotes != null) {
      map['prescription_notes'] = Variable<String>(prescriptionNotes);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || archivedAt != null) {
      map['archived_at'] = Variable<DateTime>(archivedAt);
    }
    return map;
  }

  DeviceRecordsCompanion toCompanion(bool nullToAbsent) {
    return DeviceRecordsCompanion(
      id: Value(id),
      name: Value(name),
      category: Value(category),
      manufacturer: manufacturer == null && nullToAbsent
          ? const Value.absent()
          : Value(manufacturer),
      modelNumber: modelNumber == null && nullToAbsent ? const Value.absent() : Value(modelNumber),
      serialNumber: serialNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(serialNumber),
      installedAt: installedAt == null && nullToAbsent ? const Value.absent() : Value(installedAt),
      warrantyExpiresAt: warrantyExpiresAt == null && nullToAbsent
          ? const Value.absent()
          : Value(warrantyExpiresAt),
      supplier: supplier == null && nullToAbsent ? const Value.absent() : Value(supplier),
      manualUrl: manualUrl == null && nullToAbsent ? const Value.absent() : Value(manualUrl),
      storageLocation: storageLocation == null && nullToAbsent
          ? const Value.absent()
          : Value(storageLocation),
      prescriptionMode: prescriptionMode == null && nullToAbsent
          ? const Value.absent()
          : Value(prescriptionMode),
      pressureMin: pressureMin == null && nullToAbsent ? const Value.absent() : Value(pressureMin),
      pressureMax: pressureMax == null && nullToAbsent ? const Value.absent() : Value(pressureMax),
      pressureUnit: pressureUnit == null && nullToAbsent
          ? const Value.absent()
          : Value(pressureUnit),
      humidifierSetting: humidifierSetting == null && nullToAbsent
          ? const Value.absent()
          : Value(humidifierSetting),
      rampMinutes: rampMinutes == null && nullToAbsent ? const Value.absent() : Value(rampMinutes),
      prescribedBy: prescribedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(prescribedBy),
      prescribedAt: prescribedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(prescribedAt),
      prescriptionNotes: prescriptionNotes == null && nullToAbsent
          ? const Value.absent()
          : Value(prescriptionNotes),
      notes: notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      archivedAt: archivedAt == null && nullToAbsent ? const Value.absent() : Value(archivedAt),
    );
  }

  factory DeviceRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DeviceRecord(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      category: serializer.fromJson<String>(json['category']),
      manufacturer: serializer.fromJson<String?>(json['manufacturer']),
      modelNumber: serializer.fromJson<String?>(json['modelNumber']),
      serialNumber: serializer.fromJson<String?>(json['serialNumber']),
      installedAt: serializer.fromJson<DateTime?>(json['installedAt']),
      warrantyExpiresAt: serializer.fromJson<DateTime?>(
        json['warrantyExpiresAt'],
      ),
      supplier: serializer.fromJson<String?>(json['supplier']),
      manualUrl: serializer.fromJson<String?>(json['manualUrl']),
      storageLocation: serializer.fromJson<String?>(json['storageLocation']),
      prescriptionMode: serializer.fromJson<String?>(json['prescriptionMode']),
      pressureMin: serializer.fromJson<double?>(json['pressureMin']),
      pressureMax: serializer.fromJson<double?>(json['pressureMax']),
      pressureUnit: serializer.fromJson<String?>(json['pressureUnit']),
      humidifierSetting: serializer.fromJson<String?>(
        json['humidifierSetting'],
      ),
      rampMinutes: serializer.fromJson<int?>(json['rampMinutes']),
      prescribedBy: serializer.fromJson<String?>(json['prescribedBy']),
      prescribedAt: serializer.fromJson<DateTime?>(json['prescribedAt']),
      prescriptionNotes: serializer.fromJson<String?>(
        json['prescriptionNotes'],
      ),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      archivedAt: serializer.fromJson<DateTime?>(json['archivedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'category': serializer.toJson<String>(category),
      'manufacturer': serializer.toJson<String?>(manufacturer),
      'modelNumber': serializer.toJson<String?>(modelNumber),
      'serialNumber': serializer.toJson<String?>(serialNumber),
      'installedAt': serializer.toJson<DateTime?>(installedAt),
      'warrantyExpiresAt': serializer.toJson<DateTime?>(warrantyExpiresAt),
      'supplier': serializer.toJson<String?>(supplier),
      'manualUrl': serializer.toJson<String?>(manualUrl),
      'storageLocation': serializer.toJson<String?>(storageLocation),
      'prescriptionMode': serializer.toJson<String?>(prescriptionMode),
      'pressureMin': serializer.toJson<double?>(pressureMin),
      'pressureMax': serializer.toJson<double?>(pressureMax),
      'pressureUnit': serializer.toJson<String?>(pressureUnit),
      'humidifierSetting': serializer.toJson<String?>(humidifierSetting),
      'rampMinutes': serializer.toJson<int?>(rampMinutes),
      'prescribedBy': serializer.toJson<String?>(prescribedBy),
      'prescribedAt': serializer.toJson<DateTime?>(prescribedAt),
      'prescriptionNotes': serializer.toJson<String?>(prescriptionNotes),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'archivedAt': serializer.toJson<DateTime?>(archivedAt),
    };
  }

  DeviceRecord copyWith({
    String? id,
    String? name,
    String? category,
    Value<String?> manufacturer = const Value.absent(),
    Value<String?> modelNumber = const Value.absent(),
    Value<String?> serialNumber = const Value.absent(),
    Value<DateTime?> installedAt = const Value.absent(),
    Value<DateTime?> warrantyExpiresAt = const Value.absent(),
    Value<String?> supplier = const Value.absent(),
    Value<String?> manualUrl = const Value.absent(),
    Value<String?> storageLocation = const Value.absent(),
    Value<String?> prescriptionMode = const Value.absent(),
    Value<double?> pressureMin = const Value.absent(),
    Value<double?> pressureMax = const Value.absent(),
    Value<String?> pressureUnit = const Value.absent(),
    Value<String?> humidifierSetting = const Value.absent(),
    Value<int?> rampMinutes = const Value.absent(),
    Value<String?> prescribedBy = const Value.absent(),
    Value<DateTime?> prescribedAt = const Value.absent(),
    Value<String?> prescriptionNotes = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> archivedAt = const Value.absent(),
  }) => DeviceRecord(
    id: id ?? this.id,
    name: name ?? this.name,
    category: category ?? this.category,
    manufacturer: manufacturer.present ? manufacturer.value : this.manufacturer,
    modelNumber: modelNumber.present ? modelNumber.value : this.modelNumber,
    serialNumber: serialNumber.present ? serialNumber.value : this.serialNumber,
    installedAt: installedAt.present ? installedAt.value : this.installedAt,
    warrantyExpiresAt: warrantyExpiresAt.present ? warrantyExpiresAt.value : this.warrantyExpiresAt,
    supplier: supplier.present ? supplier.value : this.supplier,
    manualUrl: manualUrl.present ? manualUrl.value : this.manualUrl,
    storageLocation: storageLocation.present ? storageLocation.value : this.storageLocation,
    prescriptionMode: prescriptionMode.present ? prescriptionMode.value : this.prescriptionMode,
    pressureMin: pressureMin.present ? pressureMin.value : this.pressureMin,
    pressureMax: pressureMax.present ? pressureMax.value : this.pressureMax,
    pressureUnit: pressureUnit.present ? pressureUnit.value : this.pressureUnit,
    humidifierSetting: humidifierSetting.present ? humidifierSetting.value : this.humidifierSetting,
    rampMinutes: rampMinutes.present ? rampMinutes.value : this.rampMinutes,
    prescribedBy: prescribedBy.present ? prescribedBy.value : this.prescribedBy,
    prescribedAt: prescribedAt.present ? prescribedAt.value : this.prescribedAt,
    prescriptionNotes: prescriptionNotes.present ? prescriptionNotes.value : this.prescriptionNotes,
    notes: notes.present ? notes.value : this.notes,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    archivedAt: archivedAt.present ? archivedAt.value : this.archivedAt,
  );
  DeviceRecord copyWithCompanion(DeviceRecordsCompanion data) {
    return DeviceRecord(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      category: data.category.present ? data.category.value : this.category,
      manufacturer: data.manufacturer.present ? data.manufacturer.value : this.manufacturer,
      modelNumber: data.modelNumber.present ? data.modelNumber.value : this.modelNumber,
      serialNumber: data.serialNumber.present ? data.serialNumber.value : this.serialNumber,
      installedAt: data.installedAt.present ? data.installedAt.value : this.installedAt,
      warrantyExpiresAt: data.warrantyExpiresAt.present
          ? data.warrantyExpiresAt.value
          : this.warrantyExpiresAt,
      supplier: data.supplier.present ? data.supplier.value : this.supplier,
      manualUrl: data.manualUrl.present ? data.manualUrl.value : this.manualUrl,
      storageLocation: data.storageLocation.present
          ? data.storageLocation.value
          : this.storageLocation,
      prescriptionMode: data.prescriptionMode.present
          ? data.prescriptionMode.value
          : this.prescriptionMode,
      pressureMin: data.pressureMin.present ? data.pressureMin.value : this.pressureMin,
      pressureMax: data.pressureMax.present ? data.pressureMax.value : this.pressureMax,
      pressureUnit: data.pressureUnit.present ? data.pressureUnit.value : this.pressureUnit,
      humidifierSetting: data.humidifierSetting.present
          ? data.humidifierSetting.value
          : this.humidifierSetting,
      rampMinutes: data.rampMinutes.present ? data.rampMinutes.value : this.rampMinutes,
      prescribedBy: data.prescribedBy.present ? data.prescribedBy.value : this.prescribedBy,
      prescribedAt: data.prescribedAt.present ? data.prescribedAt.value : this.prescribedAt,
      prescriptionNotes: data.prescriptionNotes.present
          ? data.prescriptionNotes.value
          : this.prescriptionNotes,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      archivedAt: data.archivedAt.present ? data.archivedAt.value : this.archivedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DeviceRecord(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('manufacturer: $manufacturer, ')
          ..write('modelNumber: $modelNumber, ')
          ..write('serialNumber: $serialNumber, ')
          ..write('installedAt: $installedAt, ')
          ..write('warrantyExpiresAt: $warrantyExpiresAt, ')
          ..write('supplier: $supplier, ')
          ..write('manualUrl: $manualUrl, ')
          ..write('storageLocation: $storageLocation, ')
          ..write('prescriptionMode: $prescriptionMode, ')
          ..write('pressureMin: $pressureMin, ')
          ..write('pressureMax: $pressureMax, ')
          ..write('pressureUnit: $pressureUnit, ')
          ..write('humidifierSetting: $humidifierSetting, ')
          ..write('rampMinutes: $rampMinutes, ')
          ..write('prescribedBy: $prescribedBy, ')
          ..write('prescribedAt: $prescribedAt, ')
          ..write('prescriptionNotes: $prescriptionNotes, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('archivedAt: $archivedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    name,
    category,
    manufacturer,
    modelNumber,
    serialNumber,
    installedAt,
    warrantyExpiresAt,
    supplier,
    manualUrl,
    storageLocation,
    prescriptionMode,
    pressureMin,
    pressureMax,
    pressureUnit,
    humidifierSetting,
    rampMinutes,
    prescribedBy,
    prescribedAt,
    prescriptionNotes,
    notes,
    createdAt,
    updatedAt,
    archivedAt,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DeviceRecord &&
          other.id == this.id &&
          other.name == this.name &&
          other.category == this.category &&
          other.manufacturer == this.manufacturer &&
          other.modelNumber == this.modelNumber &&
          other.serialNumber == this.serialNumber &&
          other.installedAt == this.installedAt &&
          other.warrantyExpiresAt == this.warrantyExpiresAt &&
          other.supplier == this.supplier &&
          other.manualUrl == this.manualUrl &&
          other.storageLocation == this.storageLocation &&
          other.prescriptionMode == this.prescriptionMode &&
          other.pressureMin == this.pressureMin &&
          other.pressureMax == this.pressureMax &&
          other.pressureUnit == this.pressureUnit &&
          other.humidifierSetting == this.humidifierSetting &&
          other.rampMinutes == this.rampMinutes &&
          other.prescribedBy == this.prescribedBy &&
          other.prescribedAt == this.prescribedAt &&
          other.prescriptionNotes == this.prescriptionNotes &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.archivedAt == this.archivedAt);
}

class DeviceRecordsCompanion extends UpdateCompanion<DeviceRecord> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> category;
  final Value<String?> manufacturer;
  final Value<String?> modelNumber;
  final Value<String?> serialNumber;
  final Value<DateTime?> installedAt;
  final Value<DateTime?> warrantyExpiresAt;
  final Value<String?> supplier;
  final Value<String?> manualUrl;
  final Value<String?> storageLocation;
  final Value<String?> prescriptionMode;
  final Value<double?> pressureMin;
  final Value<double?> pressureMax;
  final Value<String?> pressureUnit;
  final Value<String?> humidifierSetting;
  final Value<int?> rampMinutes;
  final Value<String?> prescribedBy;
  final Value<DateTime?> prescribedAt;
  final Value<String?> prescriptionNotes;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> archivedAt;
  final Value<int> rowid;
  const DeviceRecordsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.category = const Value.absent(),
    this.manufacturer = const Value.absent(),
    this.modelNumber = const Value.absent(),
    this.serialNumber = const Value.absent(),
    this.installedAt = const Value.absent(),
    this.warrantyExpiresAt = const Value.absent(),
    this.supplier = const Value.absent(),
    this.manualUrl = const Value.absent(),
    this.storageLocation = const Value.absent(),
    this.prescriptionMode = const Value.absent(),
    this.pressureMin = const Value.absent(),
    this.pressureMax = const Value.absent(),
    this.pressureUnit = const Value.absent(),
    this.humidifierSetting = const Value.absent(),
    this.rampMinutes = const Value.absent(),
    this.prescribedBy = const Value.absent(),
    this.prescribedAt = const Value.absent(),
    this.prescriptionNotes = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.archivedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DeviceRecordsCompanion.insert({
    required String id,
    required String name,
    required String category,
    this.manufacturer = const Value.absent(),
    this.modelNumber = const Value.absent(),
    this.serialNumber = const Value.absent(),
    this.installedAt = const Value.absent(),
    this.warrantyExpiresAt = const Value.absent(),
    this.supplier = const Value.absent(),
    this.manualUrl = const Value.absent(),
    this.storageLocation = const Value.absent(),
    this.prescriptionMode = const Value.absent(),
    this.pressureMin = const Value.absent(),
    this.pressureMax = const Value.absent(),
    this.pressureUnit = const Value.absent(),
    this.humidifierSetting = const Value.absent(),
    this.rampMinutes = const Value.absent(),
    this.prescribedBy = const Value.absent(),
    this.prescribedAt = const Value.absent(),
    this.prescriptionNotes = const Value.absent(),
    this.notes = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.archivedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       category = Value(category),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<DeviceRecord> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? category,
    Expression<String>? manufacturer,
    Expression<String>? modelNumber,
    Expression<String>? serialNumber,
    Expression<DateTime>? installedAt,
    Expression<DateTime>? warrantyExpiresAt,
    Expression<String>? supplier,
    Expression<String>? manualUrl,
    Expression<String>? storageLocation,
    Expression<String>? prescriptionMode,
    Expression<double>? pressureMin,
    Expression<double>? pressureMax,
    Expression<String>? pressureUnit,
    Expression<String>? humidifierSetting,
    Expression<int>? rampMinutes,
    Expression<String>? prescribedBy,
    Expression<DateTime>? prescribedAt,
    Expression<String>? prescriptionNotes,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? archivedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (category != null) 'category': category,
      if (manufacturer != null) 'manufacturer': manufacturer,
      if (modelNumber != null) 'model_number': modelNumber,
      if (serialNumber != null) 'serial_number': serialNumber,
      if (installedAt != null) 'installed_at': installedAt,
      if (warrantyExpiresAt != null) 'warranty_expires_at': warrantyExpiresAt,
      if (supplier != null) 'supplier': supplier,
      if (manualUrl != null) 'manual_url': manualUrl,
      if (storageLocation != null) 'storage_location': storageLocation,
      if (prescriptionMode != null) 'prescription_mode': prescriptionMode,
      if (pressureMin != null) 'pressure_min': pressureMin,
      if (pressureMax != null) 'pressure_max': pressureMax,
      if (pressureUnit != null) 'pressure_unit': pressureUnit,
      if (humidifierSetting != null) 'humidifier_setting': humidifierSetting,
      if (rampMinutes != null) 'ramp_minutes': rampMinutes,
      if (prescribedBy != null) 'prescribed_by': prescribedBy,
      if (prescribedAt != null) 'prescribed_at': prescribedAt,
      if (prescriptionNotes != null) 'prescription_notes': prescriptionNotes,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (archivedAt != null) 'archived_at': archivedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DeviceRecordsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? category,
    Value<String?>? manufacturer,
    Value<String?>? modelNumber,
    Value<String?>? serialNumber,
    Value<DateTime?>? installedAt,
    Value<DateTime?>? warrantyExpiresAt,
    Value<String?>? supplier,
    Value<String?>? manualUrl,
    Value<String?>? storageLocation,
    Value<String?>? prescriptionMode,
    Value<double?>? pressureMin,
    Value<double?>? pressureMax,
    Value<String?>? pressureUnit,
    Value<String?>? humidifierSetting,
    Value<int?>? rampMinutes,
    Value<String?>? prescribedBy,
    Value<DateTime?>? prescribedAt,
    Value<String?>? prescriptionNotes,
    Value<String?>? notes,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? archivedAt,
    Value<int>? rowid,
  }) {
    return DeviceRecordsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      manufacturer: manufacturer ?? this.manufacturer,
      modelNumber: modelNumber ?? this.modelNumber,
      serialNumber: serialNumber ?? this.serialNumber,
      installedAt: installedAt ?? this.installedAt,
      warrantyExpiresAt: warrantyExpiresAt ?? this.warrantyExpiresAt,
      supplier: supplier ?? this.supplier,
      manualUrl: manualUrl ?? this.manualUrl,
      storageLocation: storageLocation ?? this.storageLocation,
      prescriptionMode: prescriptionMode ?? this.prescriptionMode,
      pressureMin: pressureMin ?? this.pressureMin,
      pressureMax: pressureMax ?? this.pressureMax,
      pressureUnit: pressureUnit ?? this.pressureUnit,
      humidifierSetting: humidifierSetting ?? this.humidifierSetting,
      rampMinutes: rampMinutes ?? this.rampMinutes,
      prescribedBy: prescribedBy ?? this.prescribedBy,
      prescribedAt: prescribedAt ?? this.prescribedAt,
      prescriptionNotes: prescriptionNotes ?? this.prescriptionNotes,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      archivedAt: archivedAt ?? this.archivedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (manufacturer.present) {
      map['manufacturer'] = Variable<String>(manufacturer.value);
    }
    if (modelNumber.present) {
      map['model_number'] = Variable<String>(modelNumber.value);
    }
    if (serialNumber.present) {
      map['serial_number'] = Variable<String>(serialNumber.value);
    }
    if (installedAt.present) {
      map['installed_at'] = Variable<DateTime>(installedAt.value);
    }
    if (warrantyExpiresAt.present) {
      map['warranty_expires_at'] = Variable<DateTime>(warrantyExpiresAt.value);
    }
    if (supplier.present) {
      map['supplier'] = Variable<String>(supplier.value);
    }
    if (manualUrl.present) {
      map['manual_url'] = Variable<String>(manualUrl.value);
    }
    if (storageLocation.present) {
      map['storage_location'] = Variable<String>(storageLocation.value);
    }
    if (prescriptionMode.present) {
      map['prescription_mode'] = Variable<String>(prescriptionMode.value);
    }
    if (pressureMin.present) {
      map['pressure_min'] = Variable<double>(pressureMin.value);
    }
    if (pressureMax.present) {
      map['pressure_max'] = Variable<double>(pressureMax.value);
    }
    if (pressureUnit.present) {
      map['pressure_unit'] = Variable<String>(pressureUnit.value);
    }
    if (humidifierSetting.present) {
      map['humidifier_setting'] = Variable<String>(humidifierSetting.value);
    }
    if (rampMinutes.present) {
      map['ramp_minutes'] = Variable<int>(rampMinutes.value);
    }
    if (prescribedBy.present) {
      map['prescribed_by'] = Variable<String>(prescribedBy.value);
    }
    if (prescribedAt.present) {
      map['prescribed_at'] = Variable<DateTime>(prescribedAt.value);
    }
    if (prescriptionNotes.present) {
      map['prescription_notes'] = Variable<String>(prescriptionNotes.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (archivedAt.present) {
      map['archived_at'] = Variable<DateTime>(archivedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DeviceRecordsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('manufacturer: $manufacturer, ')
          ..write('modelNumber: $modelNumber, ')
          ..write('serialNumber: $serialNumber, ')
          ..write('installedAt: $installedAt, ')
          ..write('warrantyExpiresAt: $warrantyExpiresAt, ')
          ..write('supplier: $supplier, ')
          ..write('manualUrl: $manualUrl, ')
          ..write('storageLocation: $storageLocation, ')
          ..write('prescriptionMode: $prescriptionMode, ')
          ..write('pressureMin: $pressureMin, ')
          ..write('pressureMax: $pressureMax, ')
          ..write('pressureUnit: $pressureUnit, ')
          ..write('humidifierSetting: $humidifierSetting, ')
          ..write('rampMinutes: $rampMinutes, ')
          ..write('prescribedBy: $prescribedBy, ')
          ..write('prescribedAt: $prescribedAt, ')
          ..write('prescriptionNotes: $prescriptionNotes, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('archivedAt: $archivedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SupplyRecordsTable extends SupplyRecords with TableInfo<$SupplyRecordsTable, SupplyRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SupplyRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deviceIdMeta = const VerificationMeta(
    'deviceId',
  );
  @override
  late final GeneratedColumn<String> deviceId = GeneratedColumn<String>(
    'device_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _brandMeta = const VerificationMeta('brand');
  @override
  late final GeneratedColumn<String> brand = GeneratedColumn<String>(
    'brand',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _modelNumberMeta = const VerificationMeta(
    'modelNumber',
  );
  @override
  late final GeneratedColumn<String> modelNumber = GeneratedColumn<String>(
    'model_number',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _barcodeMeta = const VerificationMeta(
    'barcode',
  );
  @override
  late final GeneratedColumn<String> barcode = GeneratedColumn<String>(
    'barcode',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lotNumberMeta = const VerificationMeta(
    'lotNumber',
  );
  @override
  late final GeneratedColumn<String> lotNumber = GeneratedColumn<String>(
    'lot_number',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _expirationDateMeta = const VerificationMeta(
    'expirationDate',
  );
  @override
  late final GeneratedColumn<DateTime> expirationDate = GeneratedColumn<DateTime>(
    'expiration_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _unitLabelMeta = const VerificationMeta(
    'unitLabel',
  );
  @override
  late final GeneratedColumn<String> unitLabel = GeneratedColumn<String>(
    'unit_label',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant<String>('item'),
  );
  static const VerificationMeta _quantityOnHandMeta = const VerificationMeta(
    'quantityOnHand',
  );
  @override
  late final GeneratedColumn<int> quantityOnHand = GeneratedColumn<int>(
    'quantity_on_hand',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant<int>(0),
  );
  static const VerificationMeta _reorderPointMeta = const VerificationMeta(
    'reorderPoint',
  );
  @override
  late final GeneratedColumn<int> reorderPoint = GeneratedColumn<int>(
    'reorder_point',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant<int>(0),
  );
  static const VerificationMeta _replacementCadenceDaysMeta = const VerificationMeta(
    'replacementCadenceDays',
  );
  @override
  late final GeneratedColumn<int> replacementCadenceDays = GeneratedColumn<int>(
    'replacement_cadence_days',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lastReplacedAtMeta = const VerificationMeta(
    'lastReplacedAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastReplacedAt = GeneratedColumn<DateTime>(
    'last_replaced_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nextReplacementAtMeta = const VerificationMeta(
    'nextReplacementAt',
  );
  @override
  late final GeneratedColumn<DateTime> nextReplacementAt = GeneratedColumn<DateTime>(
    'next_replacement_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _storageLocationMeta = const VerificationMeta(
    'storageLocation',
  );
  @override
  late final GeneratedColumn<String> storageLocation = GeneratedColumn<String>(
    'storage_location',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _imagePathMeta = const VerificationMeta(
    'imagePath',
  );
  @override
  late final GeneratedColumn<String> imagePath = GeneratedColumn<String>(
    'image_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _archivedAtMeta = const VerificationMeta(
    'archivedAt',
  );
  @override
  late final GeneratedColumn<DateTime> archivedAt = GeneratedColumn<DateTime>(
    'archived_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    deviceId,
    name,
    category,
    brand,
    modelNumber,
    barcode,
    lotNumber,
    expirationDate,
    unitLabel,
    quantityOnHand,
    reorderPoint,
    replacementCadenceDays,
    lastReplacedAt,
    nextReplacementAt,
    storageLocation,
    notes,
    imagePath,
    createdAt,
    updatedAt,
    archivedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'supply_records';
  @override
  VerificationContext validateIntegrity(
    Insertable<SupplyRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('device_id')) {
      context.handle(
        _deviceIdMeta,
        deviceId.isAcceptableOrUnknown(data['device_id']!, _deviceIdMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('brand')) {
      context.handle(
        _brandMeta,
        brand.isAcceptableOrUnknown(data['brand']!, _brandMeta),
      );
    }
    if (data.containsKey('model_number')) {
      context.handle(
        _modelNumberMeta,
        modelNumber.isAcceptableOrUnknown(
          data['model_number']!,
          _modelNumberMeta,
        ),
      );
    }
    if (data.containsKey('barcode')) {
      context.handle(
        _barcodeMeta,
        barcode.isAcceptableOrUnknown(data['barcode']!, _barcodeMeta),
      );
    }
    if (data.containsKey('lot_number')) {
      context.handle(
        _lotNumberMeta,
        lotNumber.isAcceptableOrUnknown(data['lot_number']!, _lotNumberMeta),
      );
    }
    if (data.containsKey('expiration_date')) {
      context.handle(
        _expirationDateMeta,
        expirationDate.isAcceptableOrUnknown(
          data['expiration_date']!,
          _expirationDateMeta,
        ),
      );
    }
    if (data.containsKey('unit_label')) {
      context.handle(
        _unitLabelMeta,
        unitLabel.isAcceptableOrUnknown(data['unit_label']!, _unitLabelMeta),
      );
    }
    if (data.containsKey('quantity_on_hand')) {
      context.handle(
        _quantityOnHandMeta,
        quantityOnHand.isAcceptableOrUnknown(
          data['quantity_on_hand']!,
          _quantityOnHandMeta,
        ),
      );
    }
    if (data.containsKey('reorder_point')) {
      context.handle(
        _reorderPointMeta,
        reorderPoint.isAcceptableOrUnknown(
          data['reorder_point']!,
          _reorderPointMeta,
        ),
      );
    }
    if (data.containsKey('replacement_cadence_days')) {
      context.handle(
        _replacementCadenceDaysMeta,
        replacementCadenceDays.isAcceptableOrUnknown(
          data['replacement_cadence_days']!,
          _replacementCadenceDaysMeta,
        ),
      );
    }
    if (data.containsKey('last_replaced_at')) {
      context.handle(
        _lastReplacedAtMeta,
        lastReplacedAt.isAcceptableOrUnknown(
          data['last_replaced_at']!,
          _lastReplacedAtMeta,
        ),
      );
    }
    if (data.containsKey('next_replacement_at')) {
      context.handle(
        _nextReplacementAtMeta,
        nextReplacementAt.isAcceptableOrUnknown(
          data['next_replacement_at']!,
          _nextReplacementAtMeta,
        ),
      );
    }
    if (data.containsKey('storage_location')) {
      context.handle(
        _storageLocationMeta,
        storageLocation.isAcceptableOrUnknown(
          data['storage_location']!,
          _storageLocationMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('image_path')) {
      context.handle(
        _imagePathMeta,
        imagePath.isAcceptableOrUnknown(data['image_path']!, _imagePathMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('archived_at')) {
      context.handle(
        _archivedAtMeta,
        archivedAt.isAcceptableOrUnknown(data['archived_at']!, _archivedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SupplyRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SupplyRecord(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      deviceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}device_id'],
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      brand: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}brand'],
      ),
      modelNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}model_number'],
      ),
      barcode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}barcode'],
      ),
      lotNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}lot_number'],
      ),
      expirationDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}expiration_date'],
      ),
      unitLabel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unit_label'],
      )!,
      quantityOnHand: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}quantity_on_hand'],
      )!,
      reorderPoint: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}reorder_point'],
      )!,
      replacementCadenceDays: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}replacement_cadence_days'],
      ),
      lastReplacedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_replaced_at'],
      ),
      nextReplacementAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}next_replacement_at'],
      ),
      storageLocation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}storage_location'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      imagePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_path'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      archivedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}archived_at'],
      ),
    );
  }

  @override
  $SupplyRecordsTable createAlias(String alias) {
    return $SupplyRecordsTable(attachedDatabase, alias);
  }
}

class SupplyRecord extends DataClass implements Insertable<SupplyRecord> {
  final String id;
  final String? deviceId;
  final String name;
  final String category;
  final String? brand;
  final String? modelNumber;
  final String? barcode;
  final String? lotNumber;
  final DateTime? expirationDate;
  final String unitLabel;
  final int quantityOnHand;
  final int reorderPoint;
  final int? replacementCadenceDays;
  final DateTime? lastReplacedAt;
  final DateTime? nextReplacementAt;
  final String? storageLocation;
  final String? notes;
  final String? imagePath;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? archivedAt;
  const SupplyRecord({
    required this.id,
    this.deviceId,
    required this.name,
    required this.category,
    this.brand,
    this.modelNumber,
    this.barcode,
    this.lotNumber,
    this.expirationDate,
    required this.unitLabel,
    required this.quantityOnHand,
    required this.reorderPoint,
    this.replacementCadenceDays,
    this.lastReplacedAt,
    this.nextReplacementAt,
    this.storageLocation,
    this.notes,
    this.imagePath,
    required this.createdAt,
    required this.updatedAt,
    this.archivedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || deviceId != null) {
      map['device_id'] = Variable<String>(deviceId);
    }
    map['name'] = Variable<String>(name);
    map['category'] = Variable<String>(category);
    if (!nullToAbsent || brand != null) {
      map['brand'] = Variable<String>(brand);
    }
    if (!nullToAbsent || modelNumber != null) {
      map['model_number'] = Variable<String>(modelNumber);
    }
    if (!nullToAbsent || barcode != null) {
      map['barcode'] = Variable<String>(barcode);
    }
    if (!nullToAbsent || lotNumber != null) {
      map['lot_number'] = Variable<String>(lotNumber);
    }
    if (!nullToAbsent || expirationDate != null) {
      map['expiration_date'] = Variable<DateTime>(expirationDate);
    }
    map['unit_label'] = Variable<String>(unitLabel);
    map['quantity_on_hand'] = Variable<int>(quantityOnHand);
    map['reorder_point'] = Variable<int>(reorderPoint);
    if (!nullToAbsent || replacementCadenceDays != null) {
      map['replacement_cadence_days'] = Variable<int>(replacementCadenceDays);
    }
    if (!nullToAbsent || lastReplacedAt != null) {
      map['last_replaced_at'] = Variable<DateTime>(lastReplacedAt);
    }
    if (!nullToAbsent || nextReplacementAt != null) {
      map['next_replacement_at'] = Variable<DateTime>(nextReplacementAt);
    }
    if (!nullToAbsent || storageLocation != null) {
      map['storage_location'] = Variable<String>(storageLocation);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    if (!nullToAbsent || imagePath != null) {
      map['image_path'] = Variable<String>(imagePath);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || archivedAt != null) {
      map['archived_at'] = Variable<DateTime>(archivedAt);
    }
    return map;
  }

  SupplyRecordsCompanion toCompanion(bool nullToAbsent) {
    return SupplyRecordsCompanion(
      id: Value(id),
      deviceId: deviceId == null && nullToAbsent ? const Value.absent() : Value(deviceId),
      name: Value(name),
      category: Value(category),
      brand: brand == null && nullToAbsent ? const Value.absent() : Value(brand),
      modelNumber: modelNumber == null && nullToAbsent ? const Value.absent() : Value(modelNumber),
      barcode: barcode == null && nullToAbsent ? const Value.absent() : Value(barcode),
      lotNumber: lotNumber == null && nullToAbsent ? const Value.absent() : Value(lotNumber),
      expirationDate: expirationDate == null && nullToAbsent
          ? const Value.absent()
          : Value(expirationDate),
      unitLabel: Value(unitLabel),
      quantityOnHand: Value(quantityOnHand),
      reorderPoint: Value(reorderPoint),
      replacementCadenceDays: replacementCadenceDays == null && nullToAbsent
          ? const Value.absent()
          : Value(replacementCadenceDays),
      lastReplacedAt: lastReplacedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastReplacedAt),
      nextReplacementAt: nextReplacementAt == null && nullToAbsent
          ? const Value.absent()
          : Value(nextReplacementAt),
      storageLocation: storageLocation == null && nullToAbsent
          ? const Value.absent()
          : Value(storageLocation),
      notes: notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      imagePath: imagePath == null && nullToAbsent ? const Value.absent() : Value(imagePath),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      archivedAt: archivedAt == null && nullToAbsent ? const Value.absent() : Value(archivedAt),
    );
  }

  factory SupplyRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SupplyRecord(
      id: serializer.fromJson<String>(json['id']),
      deviceId: serializer.fromJson<String?>(json['deviceId']),
      name: serializer.fromJson<String>(json['name']),
      category: serializer.fromJson<String>(json['category']),
      brand: serializer.fromJson<String?>(json['brand']),
      modelNumber: serializer.fromJson<String?>(json['modelNumber']),
      barcode: serializer.fromJson<String?>(json['barcode']),
      lotNumber: serializer.fromJson<String?>(json['lotNumber']),
      expirationDate: serializer.fromJson<DateTime?>(json['expirationDate']),
      unitLabel: serializer.fromJson<String>(json['unitLabel']),
      quantityOnHand: serializer.fromJson<int>(json['quantityOnHand']),
      reorderPoint: serializer.fromJson<int>(json['reorderPoint']),
      replacementCadenceDays: serializer.fromJson<int?>(
        json['replacementCadenceDays'],
      ),
      lastReplacedAt: serializer.fromJson<DateTime?>(json['lastReplacedAt']),
      nextReplacementAt: serializer.fromJson<DateTime?>(
        json['nextReplacementAt'],
      ),
      storageLocation: serializer.fromJson<String?>(json['storageLocation']),
      notes: serializer.fromJson<String?>(json['notes']),
      imagePath: serializer.fromJson<String?>(json['imagePath']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      archivedAt: serializer.fromJson<DateTime?>(json['archivedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'deviceId': serializer.toJson<String?>(deviceId),
      'name': serializer.toJson<String>(name),
      'category': serializer.toJson<String>(category),
      'brand': serializer.toJson<String?>(brand),
      'modelNumber': serializer.toJson<String?>(modelNumber),
      'barcode': serializer.toJson<String?>(barcode),
      'lotNumber': serializer.toJson<String?>(lotNumber),
      'expirationDate': serializer.toJson<DateTime?>(expirationDate),
      'unitLabel': serializer.toJson<String>(unitLabel),
      'quantityOnHand': serializer.toJson<int>(quantityOnHand),
      'reorderPoint': serializer.toJson<int>(reorderPoint),
      'replacementCadenceDays': serializer.toJson<int?>(replacementCadenceDays),
      'lastReplacedAt': serializer.toJson<DateTime?>(lastReplacedAt),
      'nextReplacementAt': serializer.toJson<DateTime?>(nextReplacementAt),
      'storageLocation': serializer.toJson<String?>(storageLocation),
      'notes': serializer.toJson<String?>(notes),
      'imagePath': serializer.toJson<String?>(imagePath),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'archivedAt': serializer.toJson<DateTime?>(archivedAt),
    };
  }

  SupplyRecord copyWith({
    String? id,
    Value<String?> deviceId = const Value.absent(),
    String? name,
    String? category,
    Value<String?> brand = const Value.absent(),
    Value<String?> modelNumber = const Value.absent(),
    Value<String?> barcode = const Value.absent(),
    Value<String?> lotNumber = const Value.absent(),
    Value<DateTime?> expirationDate = const Value.absent(),
    String? unitLabel,
    int? quantityOnHand,
    int? reorderPoint,
    Value<int?> replacementCadenceDays = const Value.absent(),
    Value<DateTime?> lastReplacedAt = const Value.absent(),
    Value<DateTime?> nextReplacementAt = const Value.absent(),
    Value<String?> storageLocation = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    Value<String?> imagePath = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> archivedAt = const Value.absent(),
  }) => SupplyRecord(
    id: id ?? this.id,
    deviceId: deviceId.present ? deviceId.value : this.deviceId,
    name: name ?? this.name,
    category: category ?? this.category,
    brand: brand.present ? brand.value : this.brand,
    modelNumber: modelNumber.present ? modelNumber.value : this.modelNumber,
    barcode: barcode.present ? barcode.value : this.barcode,
    lotNumber: lotNumber.present ? lotNumber.value : this.lotNumber,
    expirationDate: expirationDate.present ? expirationDate.value : this.expirationDate,
    unitLabel: unitLabel ?? this.unitLabel,
    quantityOnHand: quantityOnHand ?? this.quantityOnHand,
    reorderPoint: reorderPoint ?? this.reorderPoint,
    replacementCadenceDays: replacementCadenceDays.present
        ? replacementCadenceDays.value
        : this.replacementCadenceDays,
    lastReplacedAt: lastReplacedAt.present ? lastReplacedAt.value : this.lastReplacedAt,
    nextReplacementAt: nextReplacementAt.present ? nextReplacementAt.value : this.nextReplacementAt,
    storageLocation: storageLocation.present ? storageLocation.value : this.storageLocation,
    notes: notes.present ? notes.value : this.notes,
    imagePath: imagePath.present ? imagePath.value : this.imagePath,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    archivedAt: archivedAt.present ? archivedAt.value : this.archivedAt,
  );
  SupplyRecord copyWithCompanion(SupplyRecordsCompanion data) {
    return SupplyRecord(
      id: data.id.present ? data.id.value : this.id,
      deviceId: data.deviceId.present ? data.deviceId.value : this.deviceId,
      name: data.name.present ? data.name.value : this.name,
      category: data.category.present ? data.category.value : this.category,
      brand: data.brand.present ? data.brand.value : this.brand,
      modelNumber: data.modelNumber.present ? data.modelNumber.value : this.modelNumber,
      barcode: data.barcode.present ? data.barcode.value : this.barcode,
      lotNumber: data.lotNumber.present ? data.lotNumber.value : this.lotNumber,
      expirationDate: data.expirationDate.present ? data.expirationDate.value : this.expirationDate,
      unitLabel: data.unitLabel.present ? data.unitLabel.value : this.unitLabel,
      quantityOnHand: data.quantityOnHand.present ? data.quantityOnHand.value : this.quantityOnHand,
      reorderPoint: data.reorderPoint.present ? data.reorderPoint.value : this.reorderPoint,
      replacementCadenceDays: data.replacementCadenceDays.present
          ? data.replacementCadenceDays.value
          : this.replacementCadenceDays,
      lastReplacedAt: data.lastReplacedAt.present ? data.lastReplacedAt.value : this.lastReplacedAt,
      nextReplacementAt: data.nextReplacementAt.present
          ? data.nextReplacementAt.value
          : this.nextReplacementAt,
      storageLocation: data.storageLocation.present
          ? data.storageLocation.value
          : this.storageLocation,
      notes: data.notes.present ? data.notes.value : this.notes,
      imagePath: data.imagePath.present ? data.imagePath.value : this.imagePath,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      archivedAt: data.archivedAt.present ? data.archivedAt.value : this.archivedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SupplyRecord(')
          ..write('id: $id, ')
          ..write('deviceId: $deviceId, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('brand: $brand, ')
          ..write('modelNumber: $modelNumber, ')
          ..write('barcode: $barcode, ')
          ..write('lotNumber: $lotNumber, ')
          ..write('expirationDate: $expirationDate, ')
          ..write('unitLabel: $unitLabel, ')
          ..write('quantityOnHand: $quantityOnHand, ')
          ..write('reorderPoint: $reorderPoint, ')
          ..write('replacementCadenceDays: $replacementCadenceDays, ')
          ..write('lastReplacedAt: $lastReplacedAt, ')
          ..write('nextReplacementAt: $nextReplacementAt, ')
          ..write('storageLocation: $storageLocation, ')
          ..write('notes: $notes, ')
          ..write('imagePath: $imagePath, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('archivedAt: $archivedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    deviceId,
    name,
    category,
    brand,
    modelNumber,
    barcode,
    lotNumber,
    expirationDate,
    unitLabel,
    quantityOnHand,
    reorderPoint,
    replacementCadenceDays,
    lastReplacedAt,
    nextReplacementAt,
    storageLocation,
    notes,
    imagePath,
    createdAt,
    updatedAt,
    archivedAt,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SupplyRecord &&
          other.id == this.id &&
          other.deviceId == this.deviceId &&
          other.name == this.name &&
          other.category == this.category &&
          other.brand == this.brand &&
          other.modelNumber == this.modelNumber &&
          other.barcode == this.barcode &&
          other.lotNumber == this.lotNumber &&
          other.expirationDate == this.expirationDate &&
          other.unitLabel == this.unitLabel &&
          other.quantityOnHand == this.quantityOnHand &&
          other.reorderPoint == this.reorderPoint &&
          other.replacementCadenceDays == this.replacementCadenceDays &&
          other.lastReplacedAt == this.lastReplacedAt &&
          other.nextReplacementAt == this.nextReplacementAt &&
          other.storageLocation == this.storageLocation &&
          other.notes == this.notes &&
          other.imagePath == this.imagePath &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.archivedAt == this.archivedAt);
}

class SupplyRecordsCompanion extends UpdateCompanion<SupplyRecord> {
  final Value<String> id;
  final Value<String?> deviceId;
  final Value<String> name;
  final Value<String> category;
  final Value<String?> brand;
  final Value<String?> modelNumber;
  final Value<String?> barcode;
  final Value<String?> lotNumber;
  final Value<DateTime?> expirationDate;
  final Value<String> unitLabel;
  final Value<int> quantityOnHand;
  final Value<int> reorderPoint;
  final Value<int?> replacementCadenceDays;
  final Value<DateTime?> lastReplacedAt;
  final Value<DateTime?> nextReplacementAt;
  final Value<String?> storageLocation;
  final Value<String?> notes;
  final Value<String?> imagePath;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> archivedAt;
  final Value<int> rowid;
  const SupplyRecordsCompanion({
    this.id = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.name = const Value.absent(),
    this.category = const Value.absent(),
    this.brand = const Value.absent(),
    this.modelNumber = const Value.absent(),
    this.barcode = const Value.absent(),
    this.lotNumber = const Value.absent(),
    this.expirationDate = const Value.absent(),
    this.unitLabel = const Value.absent(),
    this.quantityOnHand = const Value.absent(),
    this.reorderPoint = const Value.absent(),
    this.replacementCadenceDays = const Value.absent(),
    this.lastReplacedAt = const Value.absent(),
    this.nextReplacementAt = const Value.absent(),
    this.storageLocation = const Value.absent(),
    this.notes = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.archivedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SupplyRecordsCompanion.insert({
    required String id,
    this.deviceId = const Value.absent(),
    required String name,
    required String category,
    this.brand = const Value.absent(),
    this.modelNumber = const Value.absent(),
    this.barcode = const Value.absent(),
    this.lotNumber = const Value.absent(),
    this.expirationDate = const Value.absent(),
    this.unitLabel = const Value.absent(),
    this.quantityOnHand = const Value.absent(),
    this.reorderPoint = const Value.absent(),
    this.replacementCadenceDays = const Value.absent(),
    this.lastReplacedAt = const Value.absent(),
    this.nextReplacementAt = const Value.absent(),
    this.storageLocation = const Value.absent(),
    this.notes = const Value.absent(),
    this.imagePath = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.archivedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       category = Value(category),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<SupplyRecord> custom({
    Expression<String>? id,
    Expression<String>? deviceId,
    Expression<String>? name,
    Expression<String>? category,
    Expression<String>? brand,
    Expression<String>? modelNumber,
    Expression<String>? barcode,
    Expression<String>? lotNumber,
    Expression<DateTime>? expirationDate,
    Expression<String>? unitLabel,
    Expression<int>? quantityOnHand,
    Expression<int>? reorderPoint,
    Expression<int>? replacementCadenceDays,
    Expression<DateTime>? lastReplacedAt,
    Expression<DateTime>? nextReplacementAt,
    Expression<String>? storageLocation,
    Expression<String>? notes,
    Expression<String>? imagePath,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? archivedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (deviceId != null) 'device_id': deviceId,
      if (name != null) 'name': name,
      if (category != null) 'category': category,
      if (brand != null) 'brand': brand,
      if (modelNumber != null) 'model_number': modelNumber,
      if (barcode != null) 'barcode': barcode,
      if (lotNumber != null) 'lot_number': lotNumber,
      if (expirationDate != null) 'expiration_date': expirationDate,
      if (unitLabel != null) 'unit_label': unitLabel,
      if (quantityOnHand != null) 'quantity_on_hand': quantityOnHand,
      if (reorderPoint != null) 'reorder_point': reorderPoint,
      if (replacementCadenceDays != null) 'replacement_cadence_days': replacementCadenceDays,
      if (lastReplacedAt != null) 'last_replaced_at': lastReplacedAt,
      if (nextReplacementAt != null) 'next_replacement_at': nextReplacementAt,
      if (storageLocation != null) 'storage_location': storageLocation,
      if (notes != null) 'notes': notes,
      if (imagePath != null) 'image_path': imagePath,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (archivedAt != null) 'archived_at': archivedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SupplyRecordsCompanion copyWith({
    Value<String>? id,
    Value<String?>? deviceId,
    Value<String>? name,
    Value<String>? category,
    Value<String?>? brand,
    Value<String?>? modelNumber,
    Value<String?>? barcode,
    Value<String?>? lotNumber,
    Value<DateTime?>? expirationDate,
    Value<String>? unitLabel,
    Value<int>? quantityOnHand,
    Value<int>? reorderPoint,
    Value<int?>? replacementCadenceDays,
    Value<DateTime?>? lastReplacedAt,
    Value<DateTime?>? nextReplacementAt,
    Value<String?>? storageLocation,
    Value<String?>? notes,
    Value<String?>? imagePath,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? archivedAt,
    Value<int>? rowid,
  }) {
    return SupplyRecordsCompanion(
      id: id ?? this.id,
      deviceId: deviceId ?? this.deviceId,
      name: name ?? this.name,
      category: category ?? this.category,
      brand: brand ?? this.brand,
      modelNumber: modelNumber ?? this.modelNumber,
      barcode: barcode ?? this.barcode,
      lotNumber: lotNumber ?? this.lotNumber,
      expirationDate: expirationDate ?? this.expirationDate,
      unitLabel: unitLabel ?? this.unitLabel,
      quantityOnHand: quantityOnHand ?? this.quantityOnHand,
      reorderPoint: reorderPoint ?? this.reorderPoint,
      replacementCadenceDays: replacementCadenceDays ?? this.replacementCadenceDays,
      lastReplacedAt: lastReplacedAt ?? this.lastReplacedAt,
      nextReplacementAt: nextReplacementAt ?? this.nextReplacementAt,
      storageLocation: storageLocation ?? this.storageLocation,
      notes: notes ?? this.notes,
      imagePath: imagePath ?? this.imagePath,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      archivedAt: archivedAt ?? this.archivedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (deviceId.present) {
      map['device_id'] = Variable<String>(deviceId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (brand.present) {
      map['brand'] = Variable<String>(brand.value);
    }
    if (modelNumber.present) {
      map['model_number'] = Variable<String>(modelNumber.value);
    }
    if (barcode.present) {
      map['barcode'] = Variable<String>(barcode.value);
    }
    if (lotNumber.present) {
      map['lot_number'] = Variable<String>(lotNumber.value);
    }
    if (expirationDate.present) {
      map['expiration_date'] = Variable<DateTime>(expirationDate.value);
    }
    if (unitLabel.present) {
      map['unit_label'] = Variable<String>(unitLabel.value);
    }
    if (quantityOnHand.present) {
      map['quantity_on_hand'] = Variable<int>(quantityOnHand.value);
    }
    if (reorderPoint.present) {
      map['reorder_point'] = Variable<int>(reorderPoint.value);
    }
    if (replacementCadenceDays.present) {
      map['replacement_cadence_days'] = Variable<int>(
        replacementCadenceDays.value,
      );
    }
    if (lastReplacedAt.present) {
      map['last_replaced_at'] = Variable<DateTime>(lastReplacedAt.value);
    }
    if (nextReplacementAt.present) {
      map['next_replacement_at'] = Variable<DateTime>(nextReplacementAt.value);
    }
    if (storageLocation.present) {
      map['storage_location'] = Variable<String>(storageLocation.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (archivedAt.present) {
      map['archived_at'] = Variable<DateTime>(archivedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SupplyRecordsCompanion(')
          ..write('id: $id, ')
          ..write('deviceId: $deviceId, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('brand: $brand, ')
          ..write('modelNumber: $modelNumber, ')
          ..write('barcode: $barcode, ')
          ..write('lotNumber: $lotNumber, ')
          ..write('expirationDate: $expirationDate, ')
          ..write('unitLabel: $unitLabel, ')
          ..write('quantityOnHand: $quantityOnHand, ')
          ..write('reorderPoint: $reorderPoint, ')
          ..write('replacementCadenceDays: $replacementCadenceDays, ')
          ..write('lastReplacedAt: $lastReplacedAt, ')
          ..write('nextReplacementAt: $nextReplacementAt, ')
          ..write('storageLocation: $storageLocation, ')
          ..write('notes: $notes, ')
          ..write('imagePath: $imagePath, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('archivedAt: $archivedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $InventoryEventRecordsTable extends InventoryEventRecords
    with TableInfo<$InventoryEventRecordsTable, InventoryEventRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InventoryEventRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _supplyIdMeta = const VerificationMeta(
    'supplyId',
  );
  @override
  late final GeneratedColumn<String> supplyId = GeneratedColumn<String>(
    'supply_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES supply_records (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _kindMeta = const VerificationMeta('kind');
  @override
  late final GeneratedColumn<String> kind = GeneratedColumn<String>(
    'kind',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deltaMeta = const VerificationMeta('delta');
  @override
  late final GeneratedColumn<int> delta = GeneratedColumn<int>(
    'delta',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _occurredAtMeta = const VerificationMeta(
    'occurredAt',
  );
  @override
  late final GeneratedColumn<DateTime> occurredAt = GeneratedColumn<DateTime>(
    'occurred_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    supplyId,
    kind,
    delta,
    occurredAt,
    note,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'inventory_event_records';
  @override
  VerificationContext validateIntegrity(
    Insertable<InventoryEventRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('supply_id')) {
      context.handle(
        _supplyIdMeta,
        supplyId.isAcceptableOrUnknown(data['supply_id']!, _supplyIdMeta),
      );
    } else if (isInserting) {
      context.missing(_supplyIdMeta);
    }
    if (data.containsKey('kind')) {
      context.handle(
        _kindMeta,
        kind.isAcceptableOrUnknown(data['kind']!, _kindMeta),
      );
    } else if (isInserting) {
      context.missing(_kindMeta);
    }
    if (data.containsKey('delta')) {
      context.handle(
        _deltaMeta,
        delta.isAcceptableOrUnknown(data['delta']!, _deltaMeta),
      );
    } else if (isInserting) {
      context.missing(_deltaMeta);
    }
    if (data.containsKey('occurred_at')) {
      context.handle(
        _occurredAtMeta,
        occurredAt.isAcceptableOrUnknown(data['occurred_at']!, _occurredAtMeta),
      );
    } else if (isInserting) {
      context.missing(_occurredAtMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  InventoryEventRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InventoryEventRecord(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      supplyId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}supply_id'],
      )!,
      kind: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}kind'],
      )!,
      delta: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}delta'],
      )!,
      occurredAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}occurred_at'],
      )!,
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
    );
  }

  @override
  $InventoryEventRecordsTable createAlias(String alias) {
    return $InventoryEventRecordsTable(attachedDatabase, alias);
  }
}

class InventoryEventRecord extends DataClass implements Insertable<InventoryEventRecord> {
  final String id;
  final String supplyId;
  final String kind;
  final int delta;
  final DateTime occurredAt;
  final String? note;
  const InventoryEventRecord({
    required this.id,
    required this.supplyId,
    required this.kind,
    required this.delta,
    required this.occurredAt,
    this.note,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['supply_id'] = Variable<String>(supplyId);
    map['kind'] = Variable<String>(kind);
    map['delta'] = Variable<int>(delta);
    map['occurred_at'] = Variable<DateTime>(occurredAt);
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    return map;
  }

  InventoryEventRecordsCompanion toCompanion(bool nullToAbsent) {
    return InventoryEventRecordsCompanion(
      id: Value(id),
      supplyId: Value(supplyId),
      kind: Value(kind),
      delta: Value(delta),
      occurredAt: Value(occurredAt),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
    );
  }

  factory InventoryEventRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InventoryEventRecord(
      id: serializer.fromJson<String>(json['id']),
      supplyId: serializer.fromJson<String>(json['supplyId']),
      kind: serializer.fromJson<String>(json['kind']),
      delta: serializer.fromJson<int>(json['delta']),
      occurredAt: serializer.fromJson<DateTime>(json['occurredAt']),
      note: serializer.fromJson<String?>(json['note']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'supplyId': serializer.toJson<String>(supplyId),
      'kind': serializer.toJson<String>(kind),
      'delta': serializer.toJson<int>(delta),
      'occurredAt': serializer.toJson<DateTime>(occurredAt),
      'note': serializer.toJson<String?>(note),
    };
  }

  InventoryEventRecord copyWith({
    String? id,
    String? supplyId,
    String? kind,
    int? delta,
    DateTime? occurredAt,
    Value<String?> note = const Value.absent(),
  }) => InventoryEventRecord(
    id: id ?? this.id,
    supplyId: supplyId ?? this.supplyId,
    kind: kind ?? this.kind,
    delta: delta ?? this.delta,
    occurredAt: occurredAt ?? this.occurredAt,
    note: note.present ? note.value : this.note,
  );
  InventoryEventRecord copyWithCompanion(InventoryEventRecordsCompanion data) {
    return InventoryEventRecord(
      id: data.id.present ? data.id.value : this.id,
      supplyId: data.supplyId.present ? data.supplyId.value : this.supplyId,
      kind: data.kind.present ? data.kind.value : this.kind,
      delta: data.delta.present ? data.delta.value : this.delta,
      occurredAt: data.occurredAt.present ? data.occurredAt.value : this.occurredAt,
      note: data.note.present ? data.note.value : this.note,
    );
  }

  @override
  String toString() {
    return (StringBuffer('InventoryEventRecord(')
          ..write('id: $id, ')
          ..write('supplyId: $supplyId, ')
          ..write('kind: $kind, ')
          ..write('delta: $delta, ')
          ..write('occurredAt: $occurredAt, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, supplyId, kind, delta, occurredAt, note);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InventoryEventRecord &&
          other.id == this.id &&
          other.supplyId == this.supplyId &&
          other.kind == this.kind &&
          other.delta == this.delta &&
          other.occurredAt == this.occurredAt &&
          other.note == this.note);
}

class InventoryEventRecordsCompanion extends UpdateCompanion<InventoryEventRecord> {
  final Value<String> id;
  final Value<String> supplyId;
  final Value<String> kind;
  final Value<int> delta;
  final Value<DateTime> occurredAt;
  final Value<String?> note;
  final Value<int> rowid;
  const InventoryEventRecordsCompanion({
    this.id = const Value.absent(),
    this.supplyId = const Value.absent(),
    this.kind = const Value.absent(),
    this.delta = const Value.absent(),
    this.occurredAt = const Value.absent(),
    this.note = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  InventoryEventRecordsCompanion.insert({
    required String id,
    required String supplyId,
    required String kind,
    required int delta,
    required DateTime occurredAt,
    this.note = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       supplyId = Value(supplyId),
       kind = Value(kind),
       delta = Value(delta),
       occurredAt = Value(occurredAt);
  static Insertable<InventoryEventRecord> custom({
    Expression<String>? id,
    Expression<String>? supplyId,
    Expression<String>? kind,
    Expression<int>? delta,
    Expression<DateTime>? occurredAt,
    Expression<String>? note,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (supplyId != null) 'supply_id': supplyId,
      if (kind != null) 'kind': kind,
      if (delta != null) 'delta': delta,
      if (occurredAt != null) 'occurred_at': occurredAt,
      if (note != null) 'note': note,
      if (rowid != null) 'rowid': rowid,
    });
  }

  InventoryEventRecordsCompanion copyWith({
    Value<String>? id,
    Value<String>? supplyId,
    Value<String>? kind,
    Value<int>? delta,
    Value<DateTime>? occurredAt,
    Value<String?>? note,
    Value<int>? rowid,
  }) {
    return InventoryEventRecordsCompanion(
      id: id ?? this.id,
      supplyId: supplyId ?? this.supplyId,
      kind: kind ?? this.kind,
      delta: delta ?? this.delta,
      occurredAt: occurredAt ?? this.occurredAt,
      note: note ?? this.note,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (supplyId.present) {
      map['supply_id'] = Variable<String>(supplyId.value);
    }
    if (kind.present) {
      map['kind'] = Variable<String>(kind.value);
    }
    if (delta.present) {
      map['delta'] = Variable<int>(delta.value);
    }
    if (occurredAt.present) {
      map['occurred_at'] = Variable<DateTime>(occurredAt.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InventoryEventRecordsCompanion(')
          ..write('id: $id, ')
          ..write('supplyId: $supplyId, ')
          ..write('kind: $kind, ')
          ..write('delta: $delta, ')
          ..write('occurredAt: $occurredAt, ')
          ..write('note: $note, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CareTaskRecordsTable extends CareTaskRecords
    with TableInfo<$CareTaskRecordsTable, CareTaskRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CareTaskRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deviceIdMeta = const VerificationMeta(
    'deviceId',
  );
  @override
  late final GeneratedColumn<String> deviceId = GeneratedColumn<String>(
    'device_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _supplyIdMeta = const VerificationMeta(
    'supplyId',
  );
  @override
  late final GeneratedColumn<String> supplyId = GeneratedColumn<String>(
    'supply_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _kindMeta = const VerificationMeta('kind');
  @override
  late final GeneratedColumn<String> kind = GeneratedColumn<String>(
    'kind',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cadenceDaysMeta = const VerificationMeta(
    'cadenceDays',
  );
  @override
  late final GeneratedColumn<int> cadenceDays = GeneratedColumn<int>(
    'cadence_days',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nextDueAtMeta = const VerificationMeta(
    'nextDueAt',
  );
  @override
  late final GeneratedColumn<DateTime> nextDueAt = GeneratedColumn<DateTime>(
    'next_due_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastCompletedAtMeta = const VerificationMeta(
    'lastCompletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastCompletedAt = GeneratedColumn<DateTime>(
    'last_completed_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _remindersEnabledMeta = const VerificationMeta(
    'remindersEnabled',
  );
  @override
  late final GeneratedColumn<bool> remindersEnabled = GeneratedColumn<bool>(
    'reminders_enabled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("reminders_enabled" IN (0, 1))',
    ),
    defaultValue: const Constant<bool>(true),
  );
  static const VerificationMeta _reminderMinutesAfterMidnightMeta = const VerificationMeta(
    'reminderMinutesAfterMidnight',
  );
  @override
  late final GeneratedColumn<int> reminderMinutesAfterMidnight = GeneratedColumn<int>(
    'reminder_minutes_after_midnight',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant<int>(540),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _archivedAtMeta = const VerificationMeta(
    'archivedAt',
  );
  @override
  late final GeneratedColumn<DateTime> archivedAt = GeneratedColumn<DateTime>(
    'archived_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    deviceId,
    supplyId,
    title,
    kind,
    cadenceDays,
    nextDueAt,
    lastCompletedAt,
    remindersEnabled,
    reminderMinutesAfterMidnight,
    notes,
    createdAt,
    updatedAt,
    archivedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'care_task_records';
  @override
  VerificationContext validateIntegrity(
    Insertable<CareTaskRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('device_id')) {
      context.handle(
        _deviceIdMeta,
        deviceId.isAcceptableOrUnknown(data['device_id']!, _deviceIdMeta),
      );
    }
    if (data.containsKey('supply_id')) {
      context.handle(
        _supplyIdMeta,
        supplyId.isAcceptableOrUnknown(data['supply_id']!, _supplyIdMeta),
      );
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('kind')) {
      context.handle(
        _kindMeta,
        kind.isAcceptableOrUnknown(data['kind']!, _kindMeta),
      );
    } else if (isInserting) {
      context.missing(_kindMeta);
    }
    if (data.containsKey('cadence_days')) {
      context.handle(
        _cadenceDaysMeta,
        cadenceDays.isAcceptableOrUnknown(
          data['cadence_days']!,
          _cadenceDaysMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_cadenceDaysMeta);
    }
    if (data.containsKey('next_due_at')) {
      context.handle(
        _nextDueAtMeta,
        nextDueAt.isAcceptableOrUnknown(data['next_due_at']!, _nextDueAtMeta),
      );
    } else if (isInserting) {
      context.missing(_nextDueAtMeta);
    }
    if (data.containsKey('last_completed_at')) {
      context.handle(
        _lastCompletedAtMeta,
        lastCompletedAt.isAcceptableOrUnknown(
          data['last_completed_at']!,
          _lastCompletedAtMeta,
        ),
      );
    }
    if (data.containsKey('reminders_enabled')) {
      context.handle(
        _remindersEnabledMeta,
        remindersEnabled.isAcceptableOrUnknown(
          data['reminders_enabled']!,
          _remindersEnabledMeta,
        ),
      );
    }
    if (data.containsKey('reminder_minutes_after_midnight')) {
      context.handle(
        _reminderMinutesAfterMidnightMeta,
        reminderMinutesAfterMidnight.isAcceptableOrUnknown(
          data['reminder_minutes_after_midnight']!,
          _reminderMinutesAfterMidnightMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('archived_at')) {
      context.handle(
        _archivedAtMeta,
        archivedAt.isAcceptableOrUnknown(data['archived_at']!, _archivedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CareTaskRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CareTaskRecord(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      deviceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}device_id'],
      ),
      supplyId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}supply_id'],
      ),
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      kind: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}kind'],
      )!,
      cadenceDays: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}cadence_days'],
      )!,
      nextDueAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}next_due_at'],
      )!,
      lastCompletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_completed_at'],
      ),
      remindersEnabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}reminders_enabled'],
      )!,
      reminderMinutesAfterMidnight: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}reminder_minutes_after_midnight'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      archivedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}archived_at'],
      ),
    );
  }

  @override
  $CareTaskRecordsTable createAlias(String alias) {
    return $CareTaskRecordsTable(attachedDatabase, alias);
  }
}

class CareTaskRecord extends DataClass implements Insertable<CareTaskRecord> {
  final String id;
  final String? deviceId;
  final String? supplyId;
  final String title;
  final String kind;
  final int cadenceDays;
  final DateTime nextDueAt;
  final DateTime? lastCompletedAt;
  final bool remindersEnabled;
  final int reminderMinutesAfterMidnight;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? archivedAt;
  const CareTaskRecord({
    required this.id,
    this.deviceId,
    this.supplyId,
    required this.title,
    required this.kind,
    required this.cadenceDays,
    required this.nextDueAt,
    this.lastCompletedAt,
    required this.remindersEnabled,
    required this.reminderMinutesAfterMidnight,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
    this.archivedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || deviceId != null) {
      map['device_id'] = Variable<String>(deviceId);
    }
    if (!nullToAbsent || supplyId != null) {
      map['supply_id'] = Variable<String>(supplyId);
    }
    map['title'] = Variable<String>(title);
    map['kind'] = Variable<String>(kind);
    map['cadence_days'] = Variable<int>(cadenceDays);
    map['next_due_at'] = Variable<DateTime>(nextDueAt);
    if (!nullToAbsent || lastCompletedAt != null) {
      map['last_completed_at'] = Variable<DateTime>(lastCompletedAt);
    }
    map['reminders_enabled'] = Variable<bool>(remindersEnabled);
    map['reminder_minutes_after_midnight'] = Variable<int>(
      reminderMinutesAfterMidnight,
    );
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || archivedAt != null) {
      map['archived_at'] = Variable<DateTime>(archivedAt);
    }
    return map;
  }

  CareTaskRecordsCompanion toCompanion(bool nullToAbsent) {
    return CareTaskRecordsCompanion(
      id: Value(id),
      deviceId: deviceId == null && nullToAbsent ? const Value.absent() : Value(deviceId),
      supplyId: supplyId == null && nullToAbsent ? const Value.absent() : Value(supplyId),
      title: Value(title),
      kind: Value(kind),
      cadenceDays: Value(cadenceDays),
      nextDueAt: Value(nextDueAt),
      lastCompletedAt: lastCompletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastCompletedAt),
      remindersEnabled: Value(remindersEnabled),
      reminderMinutesAfterMidnight: Value(reminderMinutesAfterMidnight),
      notes: notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      archivedAt: archivedAt == null && nullToAbsent ? const Value.absent() : Value(archivedAt),
    );
  }

  factory CareTaskRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CareTaskRecord(
      id: serializer.fromJson<String>(json['id']),
      deviceId: serializer.fromJson<String?>(json['deviceId']),
      supplyId: serializer.fromJson<String?>(json['supplyId']),
      title: serializer.fromJson<String>(json['title']),
      kind: serializer.fromJson<String>(json['kind']),
      cadenceDays: serializer.fromJson<int>(json['cadenceDays']),
      nextDueAt: serializer.fromJson<DateTime>(json['nextDueAt']),
      lastCompletedAt: serializer.fromJson<DateTime?>(json['lastCompletedAt']),
      remindersEnabled: serializer.fromJson<bool>(json['remindersEnabled']),
      reminderMinutesAfterMidnight: serializer.fromJson<int>(
        json['reminderMinutesAfterMidnight'],
      ),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      archivedAt: serializer.fromJson<DateTime?>(json['archivedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'deviceId': serializer.toJson<String?>(deviceId),
      'supplyId': serializer.toJson<String?>(supplyId),
      'title': serializer.toJson<String>(title),
      'kind': serializer.toJson<String>(kind),
      'cadenceDays': serializer.toJson<int>(cadenceDays),
      'nextDueAt': serializer.toJson<DateTime>(nextDueAt),
      'lastCompletedAt': serializer.toJson<DateTime?>(lastCompletedAt),
      'remindersEnabled': serializer.toJson<bool>(remindersEnabled),
      'reminderMinutesAfterMidnight': serializer.toJson<int>(
        reminderMinutesAfterMidnight,
      ),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'archivedAt': serializer.toJson<DateTime?>(archivedAt),
    };
  }

  CareTaskRecord copyWith({
    String? id,
    Value<String?> deviceId = const Value.absent(),
    Value<String?> supplyId = const Value.absent(),
    String? title,
    String? kind,
    int? cadenceDays,
    DateTime? nextDueAt,
    Value<DateTime?> lastCompletedAt = const Value.absent(),
    bool? remindersEnabled,
    int? reminderMinutesAfterMidnight,
    Value<String?> notes = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> archivedAt = const Value.absent(),
  }) => CareTaskRecord(
    id: id ?? this.id,
    deviceId: deviceId.present ? deviceId.value : this.deviceId,
    supplyId: supplyId.present ? supplyId.value : this.supplyId,
    title: title ?? this.title,
    kind: kind ?? this.kind,
    cadenceDays: cadenceDays ?? this.cadenceDays,
    nextDueAt: nextDueAt ?? this.nextDueAt,
    lastCompletedAt: lastCompletedAt.present ? lastCompletedAt.value : this.lastCompletedAt,
    remindersEnabled: remindersEnabled ?? this.remindersEnabled,
    reminderMinutesAfterMidnight: reminderMinutesAfterMidnight ?? this.reminderMinutesAfterMidnight,
    notes: notes.present ? notes.value : this.notes,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    archivedAt: archivedAt.present ? archivedAt.value : this.archivedAt,
  );
  CareTaskRecord copyWithCompanion(CareTaskRecordsCompanion data) {
    return CareTaskRecord(
      id: data.id.present ? data.id.value : this.id,
      deviceId: data.deviceId.present ? data.deviceId.value : this.deviceId,
      supplyId: data.supplyId.present ? data.supplyId.value : this.supplyId,
      title: data.title.present ? data.title.value : this.title,
      kind: data.kind.present ? data.kind.value : this.kind,
      cadenceDays: data.cadenceDays.present ? data.cadenceDays.value : this.cadenceDays,
      nextDueAt: data.nextDueAt.present ? data.nextDueAt.value : this.nextDueAt,
      lastCompletedAt: data.lastCompletedAt.present
          ? data.lastCompletedAt.value
          : this.lastCompletedAt,
      remindersEnabled: data.remindersEnabled.present
          ? data.remindersEnabled.value
          : this.remindersEnabled,
      reminderMinutesAfterMidnight: data.reminderMinutesAfterMidnight.present
          ? data.reminderMinutesAfterMidnight.value
          : this.reminderMinutesAfterMidnight,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      archivedAt: data.archivedAt.present ? data.archivedAt.value : this.archivedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CareTaskRecord(')
          ..write('id: $id, ')
          ..write('deviceId: $deviceId, ')
          ..write('supplyId: $supplyId, ')
          ..write('title: $title, ')
          ..write('kind: $kind, ')
          ..write('cadenceDays: $cadenceDays, ')
          ..write('nextDueAt: $nextDueAt, ')
          ..write('lastCompletedAt: $lastCompletedAt, ')
          ..write('remindersEnabled: $remindersEnabled, ')
          ..write(
            'reminderMinutesAfterMidnight: $reminderMinutesAfterMidnight, ',
          )
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('archivedAt: $archivedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    deviceId,
    supplyId,
    title,
    kind,
    cadenceDays,
    nextDueAt,
    lastCompletedAt,
    remindersEnabled,
    reminderMinutesAfterMidnight,
    notes,
    createdAt,
    updatedAt,
    archivedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CareTaskRecord &&
          other.id == this.id &&
          other.deviceId == this.deviceId &&
          other.supplyId == this.supplyId &&
          other.title == this.title &&
          other.kind == this.kind &&
          other.cadenceDays == this.cadenceDays &&
          other.nextDueAt == this.nextDueAt &&
          other.lastCompletedAt == this.lastCompletedAt &&
          other.remindersEnabled == this.remindersEnabled &&
          other.reminderMinutesAfterMidnight == this.reminderMinutesAfterMidnight &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.archivedAt == this.archivedAt);
}

class CareTaskRecordsCompanion extends UpdateCompanion<CareTaskRecord> {
  final Value<String> id;
  final Value<String?> deviceId;
  final Value<String?> supplyId;
  final Value<String> title;
  final Value<String> kind;
  final Value<int> cadenceDays;
  final Value<DateTime> nextDueAt;
  final Value<DateTime?> lastCompletedAt;
  final Value<bool> remindersEnabled;
  final Value<int> reminderMinutesAfterMidnight;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> archivedAt;
  final Value<int> rowid;
  const CareTaskRecordsCompanion({
    this.id = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.supplyId = const Value.absent(),
    this.title = const Value.absent(),
    this.kind = const Value.absent(),
    this.cadenceDays = const Value.absent(),
    this.nextDueAt = const Value.absent(),
    this.lastCompletedAt = const Value.absent(),
    this.remindersEnabled = const Value.absent(),
    this.reminderMinutesAfterMidnight = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.archivedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CareTaskRecordsCompanion.insert({
    required String id,
    this.deviceId = const Value.absent(),
    this.supplyId = const Value.absent(),
    required String title,
    required String kind,
    required int cadenceDays,
    required DateTime nextDueAt,
    this.lastCompletedAt = const Value.absent(),
    this.remindersEnabled = const Value.absent(),
    this.reminderMinutesAfterMidnight = const Value.absent(),
    this.notes = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.archivedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title),
       kind = Value(kind),
       cadenceDays = Value(cadenceDays),
       nextDueAt = Value(nextDueAt),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<CareTaskRecord> custom({
    Expression<String>? id,
    Expression<String>? deviceId,
    Expression<String>? supplyId,
    Expression<String>? title,
    Expression<String>? kind,
    Expression<int>? cadenceDays,
    Expression<DateTime>? nextDueAt,
    Expression<DateTime>? lastCompletedAt,
    Expression<bool>? remindersEnabled,
    Expression<int>? reminderMinutesAfterMidnight,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? archivedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (deviceId != null) 'device_id': deviceId,
      if (supplyId != null) 'supply_id': supplyId,
      if (title != null) 'title': title,
      if (kind != null) 'kind': kind,
      if (cadenceDays != null) 'cadence_days': cadenceDays,
      if (nextDueAt != null) 'next_due_at': nextDueAt,
      if (lastCompletedAt != null) 'last_completed_at': lastCompletedAt,
      if (remindersEnabled != null) 'reminders_enabled': remindersEnabled,
      if (reminderMinutesAfterMidnight != null)
        'reminder_minutes_after_midnight': reminderMinutesAfterMidnight,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (archivedAt != null) 'archived_at': archivedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CareTaskRecordsCompanion copyWith({
    Value<String>? id,
    Value<String?>? deviceId,
    Value<String?>? supplyId,
    Value<String>? title,
    Value<String>? kind,
    Value<int>? cadenceDays,
    Value<DateTime>? nextDueAt,
    Value<DateTime?>? lastCompletedAt,
    Value<bool>? remindersEnabled,
    Value<int>? reminderMinutesAfterMidnight,
    Value<String?>? notes,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? archivedAt,
    Value<int>? rowid,
  }) {
    return CareTaskRecordsCompanion(
      id: id ?? this.id,
      deviceId: deviceId ?? this.deviceId,
      supplyId: supplyId ?? this.supplyId,
      title: title ?? this.title,
      kind: kind ?? this.kind,
      cadenceDays: cadenceDays ?? this.cadenceDays,
      nextDueAt: nextDueAt ?? this.nextDueAt,
      lastCompletedAt: lastCompletedAt ?? this.lastCompletedAt,
      remindersEnabled: remindersEnabled ?? this.remindersEnabled,
      reminderMinutesAfterMidnight:
          reminderMinutesAfterMidnight ?? this.reminderMinutesAfterMidnight,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      archivedAt: archivedAt ?? this.archivedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (deviceId.present) {
      map['device_id'] = Variable<String>(deviceId.value);
    }
    if (supplyId.present) {
      map['supply_id'] = Variable<String>(supplyId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (kind.present) {
      map['kind'] = Variable<String>(kind.value);
    }
    if (cadenceDays.present) {
      map['cadence_days'] = Variable<int>(cadenceDays.value);
    }
    if (nextDueAt.present) {
      map['next_due_at'] = Variable<DateTime>(nextDueAt.value);
    }
    if (lastCompletedAt.present) {
      map['last_completed_at'] = Variable<DateTime>(lastCompletedAt.value);
    }
    if (remindersEnabled.present) {
      map['reminders_enabled'] = Variable<bool>(remindersEnabled.value);
    }
    if (reminderMinutesAfterMidnight.present) {
      map['reminder_minutes_after_midnight'] = Variable<int>(
        reminderMinutesAfterMidnight.value,
      );
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (archivedAt.present) {
      map['archived_at'] = Variable<DateTime>(archivedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CareTaskRecordsCompanion(')
          ..write('id: $id, ')
          ..write('deviceId: $deviceId, ')
          ..write('supplyId: $supplyId, ')
          ..write('title: $title, ')
          ..write('kind: $kind, ')
          ..write('cadenceDays: $cadenceDays, ')
          ..write('nextDueAt: $nextDueAt, ')
          ..write('lastCompletedAt: $lastCompletedAt, ')
          ..write('remindersEnabled: $remindersEnabled, ')
          ..write(
            'reminderMinutesAfterMidnight: $reminderMinutesAfterMidnight, ',
          )
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('archivedAt: $archivedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TaskCompletionRecordsTable extends TaskCompletionRecords
    with TableInfo<$TaskCompletionRecordsTable, TaskCompletionRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TaskCompletionRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _taskIdMeta = const VerificationMeta('taskId');
  @override
  late final GeneratedColumn<String> taskId = GeneratedColumn<String>(
    'task_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES care_task_records (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _completedAtMeta = const VerificationMeta(
    'completedAt',
  );
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
    'completed_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, taskId, completedAt, note];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'task_completion_records';
  @override
  VerificationContext validateIntegrity(
    Insertable<TaskCompletionRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('task_id')) {
      context.handle(
        _taskIdMeta,
        taskId.isAcceptableOrUnknown(data['task_id']!, _taskIdMeta),
      );
    } else if (isInserting) {
      context.missing(_taskIdMeta);
    }
    if (data.containsKey('completed_at')) {
      context.handle(
        _completedAtMeta,
        completedAt.isAcceptableOrUnknown(
          data['completed_at']!,
          _completedAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_completedAtMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TaskCompletionRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TaskCompletionRecord(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      taskId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}task_id'],
      )!,
      completedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}completed_at'],
      )!,
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
    );
  }

  @override
  $TaskCompletionRecordsTable createAlias(String alias) {
    return $TaskCompletionRecordsTable(attachedDatabase, alias);
  }
}

class TaskCompletionRecord extends DataClass implements Insertable<TaskCompletionRecord> {
  final String id;
  final String taskId;
  final DateTime completedAt;
  final String? note;
  const TaskCompletionRecord({
    required this.id,
    required this.taskId,
    required this.completedAt,
    this.note,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['task_id'] = Variable<String>(taskId);
    map['completed_at'] = Variable<DateTime>(completedAt);
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    return map;
  }

  TaskCompletionRecordsCompanion toCompanion(bool nullToAbsent) {
    return TaskCompletionRecordsCompanion(
      id: Value(id),
      taskId: Value(taskId),
      completedAt: Value(completedAt),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
    );
  }

  factory TaskCompletionRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TaskCompletionRecord(
      id: serializer.fromJson<String>(json['id']),
      taskId: serializer.fromJson<String>(json['taskId']),
      completedAt: serializer.fromJson<DateTime>(json['completedAt']),
      note: serializer.fromJson<String?>(json['note']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'taskId': serializer.toJson<String>(taskId),
      'completedAt': serializer.toJson<DateTime>(completedAt),
      'note': serializer.toJson<String?>(note),
    };
  }

  TaskCompletionRecord copyWith({
    String? id,
    String? taskId,
    DateTime? completedAt,
    Value<String?> note = const Value.absent(),
  }) => TaskCompletionRecord(
    id: id ?? this.id,
    taskId: taskId ?? this.taskId,
    completedAt: completedAt ?? this.completedAt,
    note: note.present ? note.value : this.note,
  );
  TaskCompletionRecord copyWithCompanion(TaskCompletionRecordsCompanion data) {
    return TaskCompletionRecord(
      id: data.id.present ? data.id.value : this.id,
      taskId: data.taskId.present ? data.taskId.value : this.taskId,
      completedAt: data.completedAt.present ? data.completedAt.value : this.completedAt,
      note: data.note.present ? data.note.value : this.note,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TaskCompletionRecord(')
          ..write('id: $id, ')
          ..write('taskId: $taskId, ')
          ..write('completedAt: $completedAt, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, taskId, completedAt, note);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TaskCompletionRecord &&
          other.id == this.id &&
          other.taskId == this.taskId &&
          other.completedAt == this.completedAt &&
          other.note == this.note);
}

class TaskCompletionRecordsCompanion extends UpdateCompanion<TaskCompletionRecord> {
  final Value<String> id;
  final Value<String> taskId;
  final Value<DateTime> completedAt;
  final Value<String?> note;
  final Value<int> rowid;
  const TaskCompletionRecordsCompanion({
    this.id = const Value.absent(),
    this.taskId = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.note = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TaskCompletionRecordsCompanion.insert({
    required String id,
    required String taskId,
    required DateTime completedAt,
    this.note = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       taskId = Value(taskId),
       completedAt = Value(completedAt);
  static Insertable<TaskCompletionRecord> custom({
    Expression<String>? id,
    Expression<String>? taskId,
    Expression<DateTime>? completedAt,
    Expression<String>? note,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (taskId != null) 'task_id': taskId,
      if (completedAt != null) 'completed_at': completedAt,
      if (note != null) 'note': note,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TaskCompletionRecordsCompanion copyWith({
    Value<String>? id,
    Value<String>? taskId,
    Value<DateTime>? completedAt,
    Value<String?>? note,
    Value<int>? rowid,
  }) {
    return TaskCompletionRecordsCompanion(
      id: id ?? this.id,
      taskId: taskId ?? this.taskId,
      completedAt: completedAt ?? this.completedAt,
      note: note ?? this.note,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (taskId.present) {
      map['task_id'] = Variable<String>(taskId.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TaskCompletionRecordsCompanion(')
          ..write('id: $id, ')
          ..write('taskId: $taskId, ')
          ..write('completedAt: $completedAt, ')
          ..write('note: $note, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PreferenceRecordsTable extends PreferenceRecords
    with TableInfo<$PreferenceRecordsTable, PreferenceRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PreferenceRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [key, value, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'preference_records';
  @override
  VerificationContext validateIntegrity(
    Insertable<PreferenceRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  PreferenceRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PreferenceRecord(
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $PreferenceRecordsTable createAlias(String alias) {
    return $PreferenceRecordsTable(attachedDatabase, alias);
  }
}

class PreferenceRecord extends DataClass implements Insertable<PreferenceRecord> {
  final String key;
  final String value;
  final DateTime updatedAt;
  const PreferenceRecord({
    required this.key,
    required this.value,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  PreferenceRecordsCompanion toCompanion(bool nullToAbsent) {
    return PreferenceRecordsCompanion(
      key: Value(key),
      value: Value(value),
      updatedAt: Value(updatedAt),
    );
  }

  factory PreferenceRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PreferenceRecord(
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  PreferenceRecord copyWith({
    String? key,
    String? value,
    DateTime? updatedAt,
  }) => PreferenceRecord(
    key: key ?? this.key,
    value: value ?? this.value,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  PreferenceRecord copyWithCompanion(PreferenceRecordsCompanion data) {
    return PreferenceRecord(
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PreferenceRecord(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, value, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PreferenceRecord &&
          other.key == this.key &&
          other.value == this.value &&
          other.updatedAt == this.updatedAt);
}

class PreferenceRecordsCompanion extends UpdateCompanion<PreferenceRecord> {
  final Value<String> key;
  final Value<String> value;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const PreferenceRecordsCompanion({
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PreferenceRecordsCompanion.insert({
    required String key,
    required String value,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : key = Value(key),
       value = Value(value),
       updatedAt = Value(updatedAt);
  static Insertable<PreferenceRecord> custom({
    Expression<String>? key,
    Expression<String>? value,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PreferenceRecordsCompanion copyWith({
    Value<String>? key,
    Value<String>? value,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return PreferenceRecordsCompanion(
      key: key ?? this.key,
      value: value ?? this.value,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PreferenceRecordsCompanion(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $DeviceRecordsTable deviceRecords = $DeviceRecordsTable(this);
  late final $SupplyRecordsTable supplyRecords = $SupplyRecordsTable(this);
  late final $InventoryEventRecordsTable inventoryEventRecords = $InventoryEventRecordsTable(this);
  late final $CareTaskRecordsTable careTaskRecords = $CareTaskRecordsTable(
    this,
  );
  late final $TaskCompletionRecordsTable taskCompletionRecords = $TaskCompletionRecordsTable(this);
  late final $PreferenceRecordsTable preferenceRecords = $PreferenceRecordsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    deviceRecords,
    supplyRecords,
    inventoryEventRecords,
    careTaskRecords,
    taskCompletionRecords,
    preferenceRecords,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'supply_records',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('inventory_event_records', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'care_task_records',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('task_completion_records', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$DeviceRecordsTableCreateCompanionBuilder =
    DeviceRecordsCompanion Function({
      required String id,
      required String name,
      required String category,
      Value<String?> manufacturer,
      Value<String?> modelNumber,
      Value<String?> serialNumber,
      Value<DateTime?> installedAt,
      Value<DateTime?> warrantyExpiresAt,
      Value<String?> supplier,
      Value<String?> manualUrl,
      Value<String?> storageLocation,
      Value<String?> prescriptionMode,
      Value<double?> pressureMin,
      Value<double?> pressureMax,
      Value<String?> pressureUnit,
      Value<String?> humidifierSetting,
      Value<int?> rampMinutes,
      Value<String?> prescribedBy,
      Value<DateTime?> prescribedAt,
      Value<String?> prescriptionNotes,
      Value<String?> notes,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<DateTime?> archivedAt,
      Value<int> rowid,
    });
typedef $$DeviceRecordsTableUpdateCompanionBuilder =
    DeviceRecordsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> category,
      Value<String?> manufacturer,
      Value<String?> modelNumber,
      Value<String?> serialNumber,
      Value<DateTime?> installedAt,
      Value<DateTime?> warrantyExpiresAt,
      Value<String?> supplier,
      Value<String?> manualUrl,
      Value<String?> storageLocation,
      Value<String?> prescriptionMode,
      Value<double?> pressureMin,
      Value<double?> pressureMax,
      Value<String?> pressureUnit,
      Value<String?> humidifierSetting,
      Value<int?> rampMinutes,
      Value<String?> prescribedBy,
      Value<DateTime?> prescribedAt,
      Value<String?> prescriptionNotes,
      Value<String?> notes,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> archivedAt,
      Value<int> rowid,
    });

class $$DeviceRecordsTableFilterComposer extends Composer<_$AppDatabase, $DeviceRecordsTable> {
  $$DeviceRecordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get manufacturer => $composableBuilder(
    column: $table.manufacturer,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get modelNumber => $composableBuilder(
    column: $table.modelNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get serialNumber => $composableBuilder(
    column: $table.serialNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get installedAt => $composableBuilder(
    column: $table.installedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get warrantyExpiresAt => $composableBuilder(
    column: $table.warrantyExpiresAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get supplier => $composableBuilder(
    column: $table.supplier,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get manualUrl => $composableBuilder(
    column: $table.manualUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get storageLocation => $composableBuilder(
    column: $table.storageLocation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get prescriptionMode => $composableBuilder(
    column: $table.prescriptionMode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get pressureMin => $composableBuilder(
    column: $table.pressureMin,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get pressureMax => $composableBuilder(
    column: $table.pressureMax,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pressureUnit => $composableBuilder(
    column: $table.pressureUnit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get humidifierSetting => $composableBuilder(
    column: $table.humidifierSetting,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get rampMinutes => $composableBuilder(
    column: $table.rampMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get prescribedBy => $composableBuilder(
    column: $table.prescribedBy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get prescribedAt => $composableBuilder(
    column: $table.prescribedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get prescriptionNotes => $composableBuilder(
    column: $table.prescriptionNotes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get archivedAt => $composableBuilder(
    column: $table.archivedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DeviceRecordsTableOrderingComposer extends Composer<_$AppDatabase, $DeviceRecordsTable> {
  $$DeviceRecordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get manufacturer => $composableBuilder(
    column: $table.manufacturer,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get modelNumber => $composableBuilder(
    column: $table.modelNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get serialNumber => $composableBuilder(
    column: $table.serialNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get installedAt => $composableBuilder(
    column: $table.installedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get warrantyExpiresAt => $composableBuilder(
    column: $table.warrantyExpiresAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get supplier => $composableBuilder(
    column: $table.supplier,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get manualUrl => $composableBuilder(
    column: $table.manualUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get storageLocation => $composableBuilder(
    column: $table.storageLocation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get prescriptionMode => $composableBuilder(
    column: $table.prescriptionMode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get pressureMin => $composableBuilder(
    column: $table.pressureMin,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get pressureMax => $composableBuilder(
    column: $table.pressureMax,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pressureUnit => $composableBuilder(
    column: $table.pressureUnit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get humidifierSetting => $composableBuilder(
    column: $table.humidifierSetting,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get rampMinutes => $composableBuilder(
    column: $table.rampMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get prescribedBy => $composableBuilder(
    column: $table.prescribedBy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get prescribedAt => $composableBuilder(
    column: $table.prescribedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get prescriptionNotes => $composableBuilder(
    column: $table.prescriptionNotes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get archivedAt => $composableBuilder(
    column: $table.archivedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DeviceRecordsTableAnnotationComposer extends Composer<_$AppDatabase, $DeviceRecordsTable> {
  $$DeviceRecordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get manufacturer => $composableBuilder(
    column: $table.manufacturer,
    builder: (column) => column,
  );

  GeneratedColumn<String> get modelNumber => $composableBuilder(
    column: $table.modelNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get serialNumber => $composableBuilder(
    column: $table.serialNumber,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get installedAt => $composableBuilder(
    column: $table.installedAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get warrantyExpiresAt => $composableBuilder(
    column: $table.warrantyExpiresAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get supplier =>
      $composableBuilder(column: $table.supplier, builder: (column) => column);

  GeneratedColumn<String> get manualUrl =>
      $composableBuilder(column: $table.manualUrl, builder: (column) => column);

  GeneratedColumn<String> get storageLocation => $composableBuilder(
    column: $table.storageLocation,
    builder: (column) => column,
  );

  GeneratedColumn<String> get prescriptionMode => $composableBuilder(
    column: $table.prescriptionMode,
    builder: (column) => column,
  );

  GeneratedColumn<double> get pressureMin => $composableBuilder(
    column: $table.pressureMin,
    builder: (column) => column,
  );

  GeneratedColumn<double> get pressureMax => $composableBuilder(
    column: $table.pressureMax,
    builder: (column) => column,
  );

  GeneratedColumn<String> get pressureUnit => $composableBuilder(
    column: $table.pressureUnit,
    builder: (column) => column,
  );

  GeneratedColumn<String> get humidifierSetting => $composableBuilder(
    column: $table.humidifierSetting,
    builder: (column) => column,
  );

  GeneratedColumn<int> get rampMinutes => $composableBuilder(
    column: $table.rampMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<String> get prescribedBy => $composableBuilder(
    column: $table.prescribedBy,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get prescribedAt => $composableBuilder(
    column: $table.prescribedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get prescriptionNotes => $composableBuilder(
    column: $table.prescriptionNotes,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get archivedAt => $composableBuilder(
    column: $table.archivedAt,
    builder: (column) => column,
  );
}

class $$DeviceRecordsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DeviceRecordsTable,
          DeviceRecord,
          $$DeviceRecordsTableFilterComposer,
          $$DeviceRecordsTableOrderingComposer,
          $$DeviceRecordsTableAnnotationComposer,
          $$DeviceRecordsTableCreateCompanionBuilder,
          $$DeviceRecordsTableUpdateCompanionBuilder,
          (
            DeviceRecord,
            BaseReferences<_$AppDatabase, $DeviceRecordsTable, DeviceRecord>,
          ),
          DeviceRecord,
          PrefetchHooks Function()
        > {
  $$DeviceRecordsTableTableManager(_$AppDatabase db, $DeviceRecordsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () => $$DeviceRecordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DeviceRecordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DeviceRecordsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<String?> manufacturer = const Value.absent(),
                Value<String?> modelNumber = const Value.absent(),
                Value<String?> serialNumber = const Value.absent(),
                Value<DateTime?> installedAt = const Value.absent(),
                Value<DateTime?> warrantyExpiresAt = const Value.absent(),
                Value<String?> supplier = const Value.absent(),
                Value<String?> manualUrl = const Value.absent(),
                Value<String?> storageLocation = const Value.absent(),
                Value<String?> prescriptionMode = const Value.absent(),
                Value<double?> pressureMin = const Value.absent(),
                Value<double?> pressureMax = const Value.absent(),
                Value<String?> pressureUnit = const Value.absent(),
                Value<String?> humidifierSetting = const Value.absent(),
                Value<int?> rampMinutes = const Value.absent(),
                Value<String?> prescribedBy = const Value.absent(),
                Value<DateTime?> prescribedAt = const Value.absent(),
                Value<String?> prescriptionNotes = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> archivedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DeviceRecordsCompanion(
                id: id,
                name: name,
                category: category,
                manufacturer: manufacturer,
                modelNumber: modelNumber,
                serialNumber: serialNumber,
                installedAt: installedAt,
                warrantyExpiresAt: warrantyExpiresAt,
                supplier: supplier,
                manualUrl: manualUrl,
                storageLocation: storageLocation,
                prescriptionMode: prescriptionMode,
                pressureMin: pressureMin,
                pressureMax: pressureMax,
                pressureUnit: pressureUnit,
                humidifierSetting: humidifierSetting,
                rampMinutes: rampMinutes,
                prescribedBy: prescribedBy,
                prescribedAt: prescribedAt,
                prescriptionNotes: prescriptionNotes,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                archivedAt: archivedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String category,
                Value<String?> manufacturer = const Value.absent(),
                Value<String?> modelNumber = const Value.absent(),
                Value<String?> serialNumber = const Value.absent(),
                Value<DateTime?> installedAt = const Value.absent(),
                Value<DateTime?> warrantyExpiresAt = const Value.absent(),
                Value<String?> supplier = const Value.absent(),
                Value<String?> manualUrl = const Value.absent(),
                Value<String?> storageLocation = const Value.absent(),
                Value<String?> prescriptionMode = const Value.absent(),
                Value<double?> pressureMin = const Value.absent(),
                Value<double?> pressureMax = const Value.absent(),
                Value<String?> pressureUnit = const Value.absent(),
                Value<String?> humidifierSetting = const Value.absent(),
                Value<int?> rampMinutes = const Value.absent(),
                Value<String?> prescribedBy = const Value.absent(),
                Value<DateTime?> prescribedAt = const Value.absent(),
                Value<String?> prescriptionNotes = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> archivedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DeviceRecordsCompanion.insert(
                id: id,
                name: name,
                category: category,
                manufacturer: manufacturer,
                modelNumber: modelNumber,
                serialNumber: serialNumber,
                installedAt: installedAt,
                warrantyExpiresAt: warrantyExpiresAt,
                supplier: supplier,
                manualUrl: manualUrl,
                storageLocation: storageLocation,
                prescriptionMode: prescriptionMode,
                pressureMin: pressureMin,
                pressureMax: pressureMax,
                pressureUnit: pressureUnit,
                humidifierSetting: humidifierSetting,
                rampMinutes: rampMinutes,
                prescribedBy: prescribedBy,
                prescribedAt: prescribedAt,
                prescriptionNotes: prescriptionNotes,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                archivedAt: archivedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$DeviceRecordsTable, DeviceRecord>(table),
                  BaseReferences<_$AppDatabase, $DeviceRecordsTable, DeviceRecord>(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DeviceRecordsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DeviceRecordsTable,
      DeviceRecord,
      $$DeviceRecordsTableFilterComposer,
      $$DeviceRecordsTableOrderingComposer,
      $$DeviceRecordsTableAnnotationComposer,
      $$DeviceRecordsTableCreateCompanionBuilder,
      $$DeviceRecordsTableUpdateCompanionBuilder,
      (
        DeviceRecord,
        BaseReferences<_$AppDatabase, $DeviceRecordsTable, DeviceRecord>,
      ),
      DeviceRecord,
      PrefetchHooks Function()
    >;
typedef $$SupplyRecordsTableCreateCompanionBuilder =
    SupplyRecordsCompanion Function({
      required String id,
      Value<String?> deviceId,
      required String name,
      required String category,
      Value<String?> brand,
      Value<String?> modelNumber,
      Value<String?> barcode,
      Value<String?> lotNumber,
      Value<DateTime?> expirationDate,
      Value<String> unitLabel,
      Value<int> quantityOnHand,
      Value<int> reorderPoint,
      Value<int?> replacementCadenceDays,
      Value<DateTime?> lastReplacedAt,
      Value<DateTime?> nextReplacementAt,
      Value<String?> storageLocation,
      Value<String?> notes,
      Value<String?> imagePath,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<DateTime?> archivedAt,
      Value<int> rowid,
    });
typedef $$SupplyRecordsTableUpdateCompanionBuilder =
    SupplyRecordsCompanion Function({
      Value<String> id,
      Value<String?> deviceId,
      Value<String> name,
      Value<String> category,
      Value<String?> brand,
      Value<String?> modelNumber,
      Value<String?> barcode,
      Value<String?> lotNumber,
      Value<DateTime?> expirationDate,
      Value<String> unitLabel,
      Value<int> quantityOnHand,
      Value<int> reorderPoint,
      Value<int?> replacementCadenceDays,
      Value<DateTime?> lastReplacedAt,
      Value<DateTime?> nextReplacementAt,
      Value<String?> storageLocation,
      Value<String?> notes,
      Value<String?> imagePath,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> archivedAt,
      Value<int> rowid,
    });

final class $$SupplyRecordsTableReferences
    extends BaseReferences<_$AppDatabase, $SupplyRecordsTable, SupplyRecord> {
  $$SupplyRecordsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$InventoryEventRecordsTable, List<InventoryEventRecord>>
  _inventoryEventRecordsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.inventoryEventRecords,
    aliasName: 'supply_records__id__inventory_event_records__supply_id',
  );

  $$InventoryEventRecordsTableProcessedTableManager get inventoryEventRecordsRefs {
    final manager = $$InventoryEventRecordsTableTableManager(
      $_db,
      $_db.inventoryEventRecords,
    ).filter((f) => f.supplyId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _inventoryEventRecordsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$SupplyRecordsTableFilterComposer extends Composer<_$AppDatabase, $SupplyRecordsTable> {
  $$SupplyRecordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get brand => $composableBuilder(
    column: $table.brand,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get modelNumber => $composableBuilder(
    column: $table.modelNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get barcode => $composableBuilder(
    column: $table.barcode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lotNumber => $composableBuilder(
    column: $table.lotNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get expirationDate => $composableBuilder(
    column: $table.expirationDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unitLabel => $composableBuilder(
    column: $table.unitLabel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get quantityOnHand => $composableBuilder(
    column: $table.quantityOnHand,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get reorderPoint => $composableBuilder(
    column: $table.reorderPoint,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get replacementCadenceDays => $composableBuilder(
    column: $table.replacementCadenceDays,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastReplacedAt => $composableBuilder(
    column: $table.lastReplacedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get nextReplacementAt => $composableBuilder(
    column: $table.nextReplacementAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get storageLocation => $composableBuilder(
    column: $table.storageLocation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get archivedAt => $composableBuilder(
    column: $table.archivedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> inventoryEventRecordsRefs(
    Expression<bool> Function($$InventoryEventRecordsTableFilterComposer f) f,
  ) {
    final $$InventoryEventRecordsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.inventoryEventRecords,
      getReferencedColumn: (t) => t.supplyId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InventoryEventRecordsTableFilterComposer(
            $db: $db,
            $table: $db.inventoryEventRecords,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SupplyRecordsTableOrderingComposer extends Composer<_$AppDatabase, $SupplyRecordsTable> {
  $$SupplyRecordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get brand => $composableBuilder(
    column: $table.brand,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get modelNumber => $composableBuilder(
    column: $table.modelNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get barcode => $composableBuilder(
    column: $table.barcode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lotNumber => $composableBuilder(
    column: $table.lotNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get expirationDate => $composableBuilder(
    column: $table.expirationDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unitLabel => $composableBuilder(
    column: $table.unitLabel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get quantityOnHand => $composableBuilder(
    column: $table.quantityOnHand,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get reorderPoint => $composableBuilder(
    column: $table.reorderPoint,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get replacementCadenceDays => $composableBuilder(
    column: $table.replacementCadenceDays,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastReplacedAt => $composableBuilder(
    column: $table.lastReplacedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get nextReplacementAt => $composableBuilder(
    column: $table.nextReplacementAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get storageLocation => $composableBuilder(
    column: $table.storageLocation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get archivedAt => $composableBuilder(
    column: $table.archivedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SupplyRecordsTableAnnotationComposer extends Composer<_$AppDatabase, $SupplyRecordsTable> {
  $$SupplyRecordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get deviceId =>
      $composableBuilder(column: $table.deviceId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get brand =>
      $composableBuilder(column: $table.brand, builder: (column) => column);

  GeneratedColumn<String> get modelNumber => $composableBuilder(
    column: $table.modelNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get barcode =>
      $composableBuilder(column: $table.barcode, builder: (column) => column);

  GeneratedColumn<String> get lotNumber =>
      $composableBuilder(column: $table.lotNumber, builder: (column) => column);

  GeneratedColumn<DateTime> get expirationDate => $composableBuilder(
    column: $table.expirationDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get unitLabel =>
      $composableBuilder(column: $table.unitLabel, builder: (column) => column);

  GeneratedColumn<int> get quantityOnHand => $composableBuilder(
    column: $table.quantityOnHand,
    builder: (column) => column,
  );

  GeneratedColumn<int> get reorderPoint => $composableBuilder(
    column: $table.reorderPoint,
    builder: (column) => column,
  );

  GeneratedColumn<int> get replacementCadenceDays => $composableBuilder(
    column: $table.replacementCadenceDays,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastReplacedAt => $composableBuilder(
    column: $table.lastReplacedAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get nextReplacementAt => $composableBuilder(
    column: $table.nextReplacementAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get storageLocation => $composableBuilder(
    column: $table.storageLocation,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get imagePath =>
      $composableBuilder(column: $table.imagePath, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get archivedAt => $composableBuilder(
    column: $table.archivedAt,
    builder: (column) => column,
  );

  Expression<T> inventoryEventRecordsRefs<T extends Object>(
    Expression<T> Function($$InventoryEventRecordsTableAnnotationComposer a) f,
  ) {
    final $$InventoryEventRecordsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.inventoryEventRecords,
      getReferencedColumn: (t) => t.supplyId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InventoryEventRecordsTableAnnotationComposer(
            $db: $db,
            $table: $db.inventoryEventRecords,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SupplyRecordsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SupplyRecordsTable,
          SupplyRecord,
          $$SupplyRecordsTableFilterComposer,
          $$SupplyRecordsTableOrderingComposer,
          $$SupplyRecordsTableAnnotationComposer,
          $$SupplyRecordsTableCreateCompanionBuilder,
          $$SupplyRecordsTableUpdateCompanionBuilder,
          (SupplyRecord, $$SupplyRecordsTableReferences),
          SupplyRecord,
          PrefetchHooks Function({bool inventoryEventRecordsRefs})
        > {
  $$SupplyRecordsTableTableManager(_$AppDatabase db, $SupplyRecordsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () => $$SupplyRecordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SupplyRecordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SupplyRecordsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> deviceId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<String?> brand = const Value.absent(),
                Value<String?> modelNumber = const Value.absent(),
                Value<String?> barcode = const Value.absent(),
                Value<String?> lotNumber = const Value.absent(),
                Value<DateTime?> expirationDate = const Value.absent(),
                Value<String> unitLabel = const Value.absent(),
                Value<int> quantityOnHand = const Value.absent(),
                Value<int> reorderPoint = const Value.absent(),
                Value<int?> replacementCadenceDays = const Value.absent(),
                Value<DateTime?> lastReplacedAt = const Value.absent(),
                Value<DateTime?> nextReplacementAt = const Value.absent(),
                Value<String?> storageLocation = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String?> imagePath = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> archivedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SupplyRecordsCompanion(
                id: id,
                deviceId: deviceId,
                name: name,
                category: category,
                brand: brand,
                modelNumber: modelNumber,
                barcode: barcode,
                lotNumber: lotNumber,
                expirationDate: expirationDate,
                unitLabel: unitLabel,
                quantityOnHand: quantityOnHand,
                reorderPoint: reorderPoint,
                replacementCadenceDays: replacementCadenceDays,
                lastReplacedAt: lastReplacedAt,
                nextReplacementAt: nextReplacementAt,
                storageLocation: storageLocation,
                notes: notes,
                imagePath: imagePath,
                createdAt: createdAt,
                updatedAt: updatedAt,
                archivedAt: archivedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> deviceId = const Value.absent(),
                required String name,
                required String category,
                Value<String?> brand = const Value.absent(),
                Value<String?> modelNumber = const Value.absent(),
                Value<String?> barcode = const Value.absent(),
                Value<String?> lotNumber = const Value.absent(),
                Value<DateTime?> expirationDate = const Value.absent(),
                Value<String> unitLabel = const Value.absent(),
                Value<int> quantityOnHand = const Value.absent(),
                Value<int> reorderPoint = const Value.absent(),
                Value<int?> replacementCadenceDays = const Value.absent(),
                Value<DateTime?> lastReplacedAt = const Value.absent(),
                Value<DateTime?> nextReplacementAt = const Value.absent(),
                Value<String?> storageLocation = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String?> imagePath = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> archivedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SupplyRecordsCompanion.insert(
                id: id,
                deviceId: deviceId,
                name: name,
                category: category,
                brand: brand,
                modelNumber: modelNumber,
                barcode: barcode,
                lotNumber: lotNumber,
                expirationDate: expirationDate,
                unitLabel: unitLabel,
                quantityOnHand: quantityOnHand,
                reorderPoint: reorderPoint,
                replacementCadenceDays: replacementCadenceDays,
                lastReplacedAt: lastReplacedAt,
                nextReplacementAt: nextReplacementAt,
                storageLocation: storageLocation,
                notes: notes,
                imagePath: imagePath,
                createdAt: createdAt,
                updatedAt: updatedAt,
                archivedAt: archivedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$SupplyRecordsTable, SupplyRecord>(table),
                  $$SupplyRecordsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({inventoryEventRecordsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (inventoryEventRecordsRefs) db.inventoryEventRecords,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (inventoryEventRecordsRefs)
                    await $_getPrefetchedData<
                      SupplyRecord,
                      $SupplyRecordsTable,
                      InventoryEventRecord
                    >(
                      currentTable: table,
                      referencedTable: $$SupplyRecordsTableReferences
                          ._inventoryEventRecordsRefsTable(db),
                      managerFromTypedResult: (p0) => $$SupplyRecordsTableReferences(
                        db,
                        table,
                        p0,
                      ).inventoryEventRecordsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.supplyId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$SupplyRecordsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SupplyRecordsTable,
      SupplyRecord,
      $$SupplyRecordsTableFilterComposer,
      $$SupplyRecordsTableOrderingComposer,
      $$SupplyRecordsTableAnnotationComposer,
      $$SupplyRecordsTableCreateCompanionBuilder,
      $$SupplyRecordsTableUpdateCompanionBuilder,
      (SupplyRecord, $$SupplyRecordsTableReferences),
      SupplyRecord,
      PrefetchHooks Function({bool inventoryEventRecordsRefs})
    >;
typedef $$InventoryEventRecordsTableCreateCompanionBuilder =
    InventoryEventRecordsCompanion Function({
      required String id,
      required String supplyId,
      required String kind,
      required int delta,
      required DateTime occurredAt,
      Value<String?> note,
      Value<int> rowid,
    });
typedef $$InventoryEventRecordsTableUpdateCompanionBuilder =
    InventoryEventRecordsCompanion Function({
      Value<String> id,
      Value<String> supplyId,
      Value<String> kind,
      Value<int> delta,
      Value<DateTime> occurredAt,
      Value<String?> note,
      Value<int> rowid,
    });

final class $$InventoryEventRecordsTableReferences
    extends BaseReferences<_$AppDatabase, $InventoryEventRecordsTable, InventoryEventRecord> {
  $$InventoryEventRecordsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $SupplyRecordsTable _supplyIdTable(_$AppDatabase db) =>
      db.supplyRecords.createAlias('inventory_event_records__supply_id__supply_records__id');

  $$SupplyRecordsTableProcessedTableManager get supplyId {
    final $_column = $_itemColumn<String>('supply_id')!;

    final manager = $$SupplyRecordsTableTableManager(
      $_db,
      $_db.supplyRecords,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_supplyIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$InventoryEventRecordsTableFilterComposer
    extends Composer<_$AppDatabase, $InventoryEventRecordsTable> {
  $$InventoryEventRecordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get delta => $composableBuilder(
    column: $table.delta,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get occurredAt => $composableBuilder(
    column: $table.occurredAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  $$SupplyRecordsTableFilterComposer get supplyId {
    final $$SupplyRecordsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.supplyId,
      referencedTable: $db.supplyRecords,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SupplyRecordsTableFilterComposer(
            $db: $db,
            $table: $db.supplyRecords,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$InventoryEventRecordsTableOrderingComposer
    extends Composer<_$AppDatabase, $InventoryEventRecordsTable> {
  $$InventoryEventRecordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get delta => $composableBuilder(
    column: $table.delta,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get occurredAt => $composableBuilder(
    column: $table.occurredAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  $$SupplyRecordsTableOrderingComposer get supplyId {
    final $$SupplyRecordsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.supplyId,
      referencedTable: $db.supplyRecords,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SupplyRecordsTableOrderingComposer(
            $db: $db,
            $table: $db.supplyRecords,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$InventoryEventRecordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $InventoryEventRecordsTable> {
  $$InventoryEventRecordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get kind =>
      $composableBuilder(column: $table.kind, builder: (column) => column);

  GeneratedColumn<int> get delta =>
      $composableBuilder(column: $table.delta, builder: (column) => column);

  GeneratedColumn<DateTime> get occurredAt => $composableBuilder(
    column: $table.occurredAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  $$SupplyRecordsTableAnnotationComposer get supplyId {
    final $$SupplyRecordsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.supplyId,
      referencedTable: $db.supplyRecords,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SupplyRecordsTableAnnotationComposer(
            $db: $db,
            $table: $db.supplyRecords,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$InventoryEventRecordsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $InventoryEventRecordsTable,
          InventoryEventRecord,
          $$InventoryEventRecordsTableFilterComposer,
          $$InventoryEventRecordsTableOrderingComposer,
          $$InventoryEventRecordsTableAnnotationComposer,
          $$InventoryEventRecordsTableCreateCompanionBuilder,
          $$InventoryEventRecordsTableUpdateCompanionBuilder,
          (InventoryEventRecord, $$InventoryEventRecordsTableReferences),
          InventoryEventRecord,
          PrefetchHooks Function({bool supplyId})
        > {
  $$InventoryEventRecordsTableTableManager(
    _$AppDatabase db,
    $InventoryEventRecordsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () => $$InventoryEventRecordsTableFilterComposer(
            $db: db,
            $table: table,
          ),
          createOrderingComposer: () => $$InventoryEventRecordsTableOrderingComposer(
            $db: db,
            $table: table,
          ),
          createComputedFieldComposer: () => $$InventoryEventRecordsTableAnnotationComposer(
            $db: db,
            $table: table,
          ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> supplyId = const Value.absent(),
                Value<String> kind = const Value.absent(),
                Value<int> delta = const Value.absent(),
                Value<DateTime> occurredAt = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => InventoryEventRecordsCompanion(
                id: id,
                supplyId: supplyId,
                kind: kind,
                delta: delta,
                occurredAt: occurredAt,
                note: note,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String supplyId,
                required String kind,
                required int delta,
                required DateTime occurredAt,
                Value<String?> note = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => InventoryEventRecordsCompanion.insert(
                id: id,
                supplyId: supplyId,
                kind: kind,
                delta: delta,
                occurredAt: occurredAt,
                note: note,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$InventoryEventRecordsTable, InventoryEventRecord>(table),
                  $$InventoryEventRecordsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({supplyId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (supplyId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.supplyId,
                                referencedTable: $$InventoryEventRecordsTableReferences
                                    ._supplyIdTable(db),
                                referencedColumn: $$InventoryEventRecordsTableReferences
                                    ._supplyIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$InventoryEventRecordsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $InventoryEventRecordsTable,
      InventoryEventRecord,
      $$InventoryEventRecordsTableFilterComposer,
      $$InventoryEventRecordsTableOrderingComposer,
      $$InventoryEventRecordsTableAnnotationComposer,
      $$InventoryEventRecordsTableCreateCompanionBuilder,
      $$InventoryEventRecordsTableUpdateCompanionBuilder,
      (InventoryEventRecord, $$InventoryEventRecordsTableReferences),
      InventoryEventRecord,
      PrefetchHooks Function({bool supplyId})
    >;
typedef $$CareTaskRecordsTableCreateCompanionBuilder =
    CareTaskRecordsCompanion Function({
      required String id,
      Value<String?> deviceId,
      Value<String?> supplyId,
      required String title,
      required String kind,
      required int cadenceDays,
      required DateTime nextDueAt,
      Value<DateTime?> lastCompletedAt,
      Value<bool> remindersEnabled,
      Value<int> reminderMinutesAfterMidnight,
      Value<String?> notes,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<DateTime?> archivedAt,
      Value<int> rowid,
    });
typedef $$CareTaskRecordsTableUpdateCompanionBuilder =
    CareTaskRecordsCompanion Function({
      Value<String> id,
      Value<String?> deviceId,
      Value<String?> supplyId,
      Value<String> title,
      Value<String> kind,
      Value<int> cadenceDays,
      Value<DateTime> nextDueAt,
      Value<DateTime?> lastCompletedAt,
      Value<bool> remindersEnabled,
      Value<int> reminderMinutesAfterMidnight,
      Value<String?> notes,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> archivedAt,
      Value<int> rowid,
    });

final class $$CareTaskRecordsTableReferences
    extends BaseReferences<_$AppDatabase, $CareTaskRecordsTable, CareTaskRecord> {
  $$CareTaskRecordsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$TaskCompletionRecordsTable, List<TaskCompletionRecord>>
  _taskCompletionRecordsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.taskCompletionRecords,
    aliasName: 'care_task_records__id__task_completion_records__task_id',
  );

  $$TaskCompletionRecordsTableProcessedTableManager get taskCompletionRecordsRefs {
    final manager = $$TaskCompletionRecordsTableTableManager(
      $_db,
      $_db.taskCompletionRecords,
    ).filter((f) => f.taskId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _taskCompletionRecordsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CareTaskRecordsTableFilterComposer extends Composer<_$AppDatabase, $CareTaskRecordsTable> {
  $$CareTaskRecordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get supplyId => $composableBuilder(
    column: $table.supplyId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get cadenceDays => $composableBuilder(
    column: $table.cadenceDays,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get nextDueAt => $composableBuilder(
    column: $table.nextDueAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastCompletedAt => $composableBuilder(
    column: $table.lastCompletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get remindersEnabled => $composableBuilder(
    column: $table.remindersEnabled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get reminderMinutesAfterMidnight => $composableBuilder(
    column: $table.reminderMinutesAfterMidnight,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get archivedAt => $composableBuilder(
    column: $table.archivedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> taskCompletionRecordsRefs(
    Expression<bool> Function($$TaskCompletionRecordsTableFilterComposer f) f,
  ) {
    final $$TaskCompletionRecordsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.taskCompletionRecords,
      getReferencedColumn: (t) => t.taskId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TaskCompletionRecordsTableFilterComposer(
            $db: $db,
            $table: $db.taskCompletionRecords,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CareTaskRecordsTableOrderingComposer
    extends Composer<_$AppDatabase, $CareTaskRecordsTable> {
  $$CareTaskRecordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get supplyId => $composableBuilder(
    column: $table.supplyId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get cadenceDays => $composableBuilder(
    column: $table.cadenceDays,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get nextDueAt => $composableBuilder(
    column: $table.nextDueAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastCompletedAt => $composableBuilder(
    column: $table.lastCompletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get remindersEnabled => $composableBuilder(
    column: $table.remindersEnabled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get reminderMinutesAfterMidnight => $composableBuilder(
    column: $table.reminderMinutesAfterMidnight,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get archivedAt => $composableBuilder(
    column: $table.archivedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CareTaskRecordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CareTaskRecordsTable> {
  $$CareTaskRecordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get deviceId =>
      $composableBuilder(column: $table.deviceId, builder: (column) => column);

  GeneratedColumn<String> get supplyId =>
      $composableBuilder(column: $table.supplyId, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get kind =>
      $composableBuilder(column: $table.kind, builder: (column) => column);

  GeneratedColumn<int> get cadenceDays => $composableBuilder(
    column: $table.cadenceDays,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get nextDueAt =>
      $composableBuilder(column: $table.nextDueAt, builder: (column) => column);

  GeneratedColumn<DateTime> get lastCompletedAt => $composableBuilder(
    column: $table.lastCompletedAt,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get remindersEnabled => $composableBuilder(
    column: $table.remindersEnabled,
    builder: (column) => column,
  );

  GeneratedColumn<int> get reminderMinutesAfterMidnight => $composableBuilder(
    column: $table.reminderMinutesAfterMidnight,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get archivedAt => $composableBuilder(
    column: $table.archivedAt,
    builder: (column) => column,
  );

  Expression<T> taskCompletionRecordsRefs<T extends Object>(
    Expression<T> Function($$TaskCompletionRecordsTableAnnotationComposer a) f,
  ) {
    final $$TaskCompletionRecordsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.taskCompletionRecords,
      getReferencedColumn: (t) => t.taskId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TaskCompletionRecordsTableAnnotationComposer(
            $db: $db,
            $table: $db.taskCompletionRecords,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CareTaskRecordsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CareTaskRecordsTable,
          CareTaskRecord,
          $$CareTaskRecordsTableFilterComposer,
          $$CareTaskRecordsTableOrderingComposer,
          $$CareTaskRecordsTableAnnotationComposer,
          $$CareTaskRecordsTableCreateCompanionBuilder,
          $$CareTaskRecordsTableUpdateCompanionBuilder,
          (CareTaskRecord, $$CareTaskRecordsTableReferences),
          CareTaskRecord,
          PrefetchHooks Function({bool taskCompletionRecordsRefs})
        > {
  $$CareTaskRecordsTableTableManager(
    _$AppDatabase db,
    $CareTaskRecordsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CareTaskRecordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CareTaskRecordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CareTaskRecordsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> deviceId = const Value.absent(),
                Value<String?> supplyId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> kind = const Value.absent(),
                Value<int> cadenceDays = const Value.absent(),
                Value<DateTime> nextDueAt = const Value.absent(),
                Value<DateTime?> lastCompletedAt = const Value.absent(),
                Value<bool> remindersEnabled = const Value.absent(),
                Value<int> reminderMinutesAfterMidnight = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> archivedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CareTaskRecordsCompanion(
                id: id,
                deviceId: deviceId,
                supplyId: supplyId,
                title: title,
                kind: kind,
                cadenceDays: cadenceDays,
                nextDueAt: nextDueAt,
                lastCompletedAt: lastCompletedAt,
                remindersEnabled: remindersEnabled,
                reminderMinutesAfterMidnight: reminderMinutesAfterMidnight,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                archivedAt: archivedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> deviceId = const Value.absent(),
                Value<String?> supplyId = const Value.absent(),
                required String title,
                required String kind,
                required int cadenceDays,
                required DateTime nextDueAt,
                Value<DateTime?> lastCompletedAt = const Value.absent(),
                Value<bool> remindersEnabled = const Value.absent(),
                Value<int> reminderMinutesAfterMidnight = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> archivedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CareTaskRecordsCompanion.insert(
                id: id,
                deviceId: deviceId,
                supplyId: supplyId,
                title: title,
                kind: kind,
                cadenceDays: cadenceDays,
                nextDueAt: nextDueAt,
                lastCompletedAt: lastCompletedAt,
                remindersEnabled: remindersEnabled,
                reminderMinutesAfterMidnight: reminderMinutesAfterMidnight,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                archivedAt: archivedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$CareTaskRecordsTable, CareTaskRecord>(table),
                  $$CareTaskRecordsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({taskCompletionRecordsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (taskCompletionRecordsRefs) db.taskCompletionRecords,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (taskCompletionRecordsRefs)
                    await $_getPrefetchedData<
                      CareTaskRecord,
                      $CareTaskRecordsTable,
                      TaskCompletionRecord
                    >(
                      currentTable: table,
                      referencedTable: $$CareTaskRecordsTableReferences
                          ._taskCompletionRecordsRefsTable(db),
                      managerFromTypedResult: (p0) => $$CareTaskRecordsTableReferences(
                        db,
                        table,
                        p0,
                      ).taskCompletionRecordsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.taskId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$CareTaskRecordsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CareTaskRecordsTable,
      CareTaskRecord,
      $$CareTaskRecordsTableFilterComposer,
      $$CareTaskRecordsTableOrderingComposer,
      $$CareTaskRecordsTableAnnotationComposer,
      $$CareTaskRecordsTableCreateCompanionBuilder,
      $$CareTaskRecordsTableUpdateCompanionBuilder,
      (CareTaskRecord, $$CareTaskRecordsTableReferences),
      CareTaskRecord,
      PrefetchHooks Function({bool taskCompletionRecordsRefs})
    >;
typedef $$TaskCompletionRecordsTableCreateCompanionBuilder =
    TaskCompletionRecordsCompanion Function({
      required String id,
      required String taskId,
      required DateTime completedAt,
      Value<String?> note,
      Value<int> rowid,
    });
typedef $$TaskCompletionRecordsTableUpdateCompanionBuilder =
    TaskCompletionRecordsCompanion Function({
      Value<String> id,
      Value<String> taskId,
      Value<DateTime> completedAt,
      Value<String?> note,
      Value<int> rowid,
    });

final class $$TaskCompletionRecordsTableReferences
    extends BaseReferences<_$AppDatabase, $TaskCompletionRecordsTable, TaskCompletionRecord> {
  $$TaskCompletionRecordsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $CareTaskRecordsTable _taskIdTable(_$AppDatabase db) =>
      db.careTaskRecords.createAlias('task_completion_records__task_id__care_task_records__id');

  $$CareTaskRecordsTableProcessedTableManager get taskId {
    final $_column = $_itemColumn<String>('task_id')!;

    final manager = $$CareTaskRecordsTableTableManager(
      $_db,
      $_db.careTaskRecords,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_taskIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$TaskCompletionRecordsTableFilterComposer
    extends Composer<_$AppDatabase, $TaskCompletionRecordsTable> {
  $$TaskCompletionRecordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  $$CareTaskRecordsTableFilterComposer get taskId {
    final $$CareTaskRecordsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.taskId,
      referencedTable: $db.careTaskRecords,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CareTaskRecordsTableFilterComposer(
            $db: $db,
            $table: $db.careTaskRecords,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TaskCompletionRecordsTableOrderingComposer
    extends Composer<_$AppDatabase, $TaskCompletionRecordsTable> {
  $$TaskCompletionRecordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  $$CareTaskRecordsTableOrderingComposer get taskId {
    final $$CareTaskRecordsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.taskId,
      referencedTable: $db.careTaskRecords,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CareTaskRecordsTableOrderingComposer(
            $db: $db,
            $table: $db.careTaskRecords,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TaskCompletionRecordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TaskCompletionRecordsTable> {
  $$TaskCompletionRecordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  $$CareTaskRecordsTableAnnotationComposer get taskId {
    final $$CareTaskRecordsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.taskId,
      referencedTable: $db.careTaskRecords,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CareTaskRecordsTableAnnotationComposer(
            $db: $db,
            $table: $db.careTaskRecords,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer: $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TaskCompletionRecordsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TaskCompletionRecordsTable,
          TaskCompletionRecord,
          $$TaskCompletionRecordsTableFilterComposer,
          $$TaskCompletionRecordsTableOrderingComposer,
          $$TaskCompletionRecordsTableAnnotationComposer,
          $$TaskCompletionRecordsTableCreateCompanionBuilder,
          $$TaskCompletionRecordsTableUpdateCompanionBuilder,
          (TaskCompletionRecord, $$TaskCompletionRecordsTableReferences),
          TaskCompletionRecord,
          PrefetchHooks Function({bool taskId})
        > {
  $$TaskCompletionRecordsTableTableManager(
    _$AppDatabase db,
    $TaskCompletionRecordsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () => $$TaskCompletionRecordsTableFilterComposer(
            $db: db,
            $table: table,
          ),
          createOrderingComposer: () => $$TaskCompletionRecordsTableOrderingComposer(
            $db: db,
            $table: table,
          ),
          createComputedFieldComposer: () => $$TaskCompletionRecordsTableAnnotationComposer(
            $db: db,
            $table: table,
          ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> taskId = const Value.absent(),
                Value<DateTime> completedAt = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TaskCompletionRecordsCompanion(
                id: id,
                taskId: taskId,
                completedAt: completedAt,
                note: note,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String taskId,
                required DateTime completedAt,
                Value<String?> note = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TaskCompletionRecordsCompanion.insert(
                id: id,
                taskId: taskId,
                completedAt: completedAt,
                note: note,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$TaskCompletionRecordsTable, TaskCompletionRecord>(table),
                  $$TaskCompletionRecordsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({taskId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (taskId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.taskId,
                                referencedTable: $$TaskCompletionRecordsTableReferences
                                    ._taskIdTable(db),
                                referencedColumn: $$TaskCompletionRecordsTableReferences
                                    ._taskIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$TaskCompletionRecordsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TaskCompletionRecordsTable,
      TaskCompletionRecord,
      $$TaskCompletionRecordsTableFilterComposer,
      $$TaskCompletionRecordsTableOrderingComposer,
      $$TaskCompletionRecordsTableAnnotationComposer,
      $$TaskCompletionRecordsTableCreateCompanionBuilder,
      $$TaskCompletionRecordsTableUpdateCompanionBuilder,
      (TaskCompletionRecord, $$TaskCompletionRecordsTableReferences),
      TaskCompletionRecord,
      PrefetchHooks Function({bool taskId})
    >;
typedef $$PreferenceRecordsTableCreateCompanionBuilder =
    PreferenceRecordsCompanion Function({
      required String key,
      required String value,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$PreferenceRecordsTableUpdateCompanionBuilder =
    PreferenceRecordsCompanion Function({
      Value<String> key,
      Value<String> value,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$PreferenceRecordsTableFilterComposer
    extends Composer<_$AppDatabase, $PreferenceRecordsTable> {
  $$PreferenceRecordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PreferenceRecordsTableOrderingComposer
    extends Composer<_$AppDatabase, $PreferenceRecordsTable> {
  $$PreferenceRecordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PreferenceRecordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PreferenceRecordsTable> {
  $$PreferenceRecordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$PreferenceRecordsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PreferenceRecordsTable,
          PreferenceRecord,
          $$PreferenceRecordsTableFilterComposer,
          $$PreferenceRecordsTableOrderingComposer,
          $$PreferenceRecordsTableAnnotationComposer,
          $$PreferenceRecordsTableCreateCompanionBuilder,
          $$PreferenceRecordsTableUpdateCompanionBuilder,
          (
            PreferenceRecord,
            BaseReferences<_$AppDatabase, $PreferenceRecordsTable, PreferenceRecord>,
          ),
          PreferenceRecord,
          PrefetchHooks Function()
        > {
  $$PreferenceRecordsTableTableManager(
    _$AppDatabase db,
    $PreferenceRecordsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PreferenceRecordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PreferenceRecordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () => $$PreferenceRecordsTableAnnotationComposer(
            $db: db,
            $table: table,
          ),
          updateCompanionCallback:
              ({
                Value<String> key = const Value.absent(),
                Value<String> value = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PreferenceRecordsCompanion(
                key: key,
                value: value,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String key,
                required String value,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => PreferenceRecordsCompanion.insert(
                key: key,
                value: value,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$PreferenceRecordsTable, PreferenceRecord>(table),
                  BaseReferences<_$AppDatabase, $PreferenceRecordsTable, PreferenceRecord>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PreferenceRecordsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PreferenceRecordsTable,
      PreferenceRecord,
      $$PreferenceRecordsTableFilterComposer,
      $$PreferenceRecordsTableOrderingComposer,
      $$PreferenceRecordsTableAnnotationComposer,
      $$PreferenceRecordsTableCreateCompanionBuilder,
      $$PreferenceRecordsTableUpdateCompanionBuilder,
      (
        PreferenceRecord,
        BaseReferences<_$AppDatabase, $PreferenceRecordsTable, PreferenceRecord>,
      ),
      PreferenceRecord,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$DeviceRecordsTableTableManager get deviceRecords =>
      $$DeviceRecordsTableTableManager(_db, _db.deviceRecords);
  $$SupplyRecordsTableTableManager get supplyRecords =>
      $$SupplyRecordsTableTableManager(_db, _db.supplyRecords);
  $$InventoryEventRecordsTableTableManager get inventoryEventRecords =>
      $$InventoryEventRecordsTableTableManager(_db, _db.inventoryEventRecords);
  $$CareTaskRecordsTableTableManager get careTaskRecords =>
      $$CareTaskRecordsTableTableManager(_db, _db.careTaskRecords);
  $$TaskCompletionRecordsTableTableManager get taskCompletionRecords =>
      $$TaskCompletionRecordsTableTableManager(_db, _db.taskCompletionRecords);
  $$PreferenceRecordsTableTableManager get preferenceRecords =>
      $$PreferenceRecordsTableTableManager(_db, _db.preferenceRecords);
}
