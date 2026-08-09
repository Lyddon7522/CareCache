import '../../../core/cqrs/mediator.dart';
import '../device.dart';
import '../device_store.dart';

final class WatchDevicesQuery implements Query<Stream<List<MedicalDevice>>> {
  const WatchDevicesQuery();
}

final class WatchDevicesHandler
    implements QueryHandler<WatchDevicesQuery, Stream<List<MedicalDevice>>> {
  const WatchDevicesHandler(this._store);

  final DeviceStore _store;

  @override
  Stream<List<MedicalDevice>> handle(WatchDevicesQuery query) => _store.watchDevices();
}

final class WatchDeviceQuery implements Query<Stream<MedicalDevice?>> {
  const WatchDeviceQuery(this.deviceId);

  final String deviceId;
}

final class WatchDeviceHandler implements QueryHandler<WatchDeviceQuery, Stream<MedicalDevice?>> {
  const WatchDeviceHandler(this._store);

  final DeviceStore _store;

  @override
  Stream<MedicalDevice?> handle(WatchDeviceQuery query) => _store.watchDevice(query.deviceId);
}
