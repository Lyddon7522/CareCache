import 'dart:io';

import '../../../core/cqrs/mediator.dart';
import '../backup_service.dart';

final class ExportBackupCommand implements Command<File> {
  const ExportBackupCommand();
}

final class ExportBackupHandler implements CommandHandler<ExportBackupCommand, File> {
  const ExportBackupHandler(this._backups);

  final CareCacheBackupService _backups;

  @override
  Future<File> handle(ExportBackupCommand command) => _backups.createExportFile();
}
