import '../../../core/cqrs/mediator.dart';
import '../inventory_store.dart';

final class ArchiveSupplyCommand implements Command<void> {
  const ArchiveSupplyCommand(this.supplyId);

  final String supplyId;
}

final class ArchiveSupplyHandler implements CommandHandler<ArchiveSupplyCommand, void> {
  const ArchiveSupplyHandler(this._store);

  final InventoryStore _store;

  @override
  Future<void> handle(ArchiveSupplyCommand command) => _store.archive(command.supplyId);
}
