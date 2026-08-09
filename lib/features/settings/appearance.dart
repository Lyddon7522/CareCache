enum CareAppearance { system, light, dark }

abstract interface class AppearanceStore {
  Stream<CareAppearance> watch();

  Future<void> set(CareAppearance appearance);
}
