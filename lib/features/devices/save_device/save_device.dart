import '../../../core/cqrs/mediator.dart';
import '../device.dart';
import '../device_store.dart';

final class SaveDeviceCommand implements Command<String> {
  const SaveDeviceCommand(this.draft, {this.deviceId});

  final DeviceDraft draft;
  final String? deviceId;
}

final class SaveDeviceHandler implements CommandHandler<SaveDeviceCommand, String> {
  const SaveDeviceHandler(this._store);

  final DeviceStore _store;

  @override
  Future<String> handle(SaveDeviceCommand command) {
    return _store.save(command.draft, id: command.deviceId);
  }
}
