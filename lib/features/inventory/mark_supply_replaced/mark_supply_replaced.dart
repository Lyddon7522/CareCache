import '../../../core/cqrs/mediator.dart';
import '../inventory_store.dart';

final class MarkSupplyReplacedCommand implements Command<void> {
  const MarkSupplyReplacedCommand(this.supplyId, {this.replacedAt});

  final String supplyId;
  final DateTime? replacedAt;
}

final class MarkSupplyReplacedHandler implements CommandHandler<MarkSupplyReplacedCommand, void> {
  const MarkSupplyReplacedHandler(this._store);

  final InventoryStore _store;

  @override
  Future<void> handle(MarkSupplyReplacedCommand command) {
    return _store.markReplaced(command.supplyId, replacedAt: command.replacedAt);
  }
}
