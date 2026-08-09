import '../../core/database/app_database.dart';
import 'appearance.dart';

final class DriftAppearanceStore implements AppearanceStore {
  const DriftAppearanceStore(this._database);

  static const String _themeKey = 'appearance';

  final AppDatabase _database;

  @override
  Stream<CareAppearance> watch() {
    final query = _database.select(_database.preferenceRecords)
      ..where((row) => row.key.equals(_themeKey));
    return query.watchSingleOrNull().map((row) {
      return CareAppearance.values.firstWhere(
        (appearance) => appearance.name == row?.value,
        orElse: () => CareAppearance.system,
      );
    });
  }

  @override
  Future<void> set(CareAppearance appearance) async {
    await _database
        .into(_database.preferenceRecords)
        .insertOnConflictUpdate(
          PreferenceRecordsCompanion.insert(
            key: _themeKey,
            value: appearance.name,
            updatedAt: DateTime.now().toUtc(),
          ),
        );
  }
}
