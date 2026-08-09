import 'device.dart';

abstract interface class DeviceStore {
  Stream<List<MedicalDevice>> watchDevices();

  Stream<MedicalDevice?> watchDevice(String id);

  Future<String> save(DeviceDraft draft, {String? id});

  Future<void> archive(String id);
}
