import '../../../core/cqrs/mediator.dart';
import '../inventory_store.dart';
import '../supply.dart';

final class SaveSupplyCommand implements Command<String> {
  const SaveSupplyCommand(this.draft, {this.supplyId});

  final SupplyDraft draft;
  final String? supplyId;
}

final class SaveSupplyHandler implements CommandHandler<SaveSupplyCommand, String> {
  const SaveSupplyHandler(this._store);

  final InventoryStore _store;

  @override
  Future<String> handle(SaveSupplyCommand command) {
    return _store.save(command.draft, id: command.supplyId);
  }
}
