import '../../../core/cqrs/mediator.dart';
import '../device_store.dart';

final class ArchiveDeviceCommand implements Command<void> {
  const ArchiveDeviceCommand(this.deviceId);

  final String deviceId;
}

final class ArchiveDeviceHandler implements CommandHandler<ArchiveDeviceCommand, void> {
  const ArchiveDeviceHandler(this._store);

  final DeviceStore _store;

  @override
  Future<void> handle(ArchiveDeviceCommand command) => _store.archive(command.deviceId);
}
