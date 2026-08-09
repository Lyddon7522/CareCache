import '../../../core/cqrs/mediator.dart';
import '../inventory_store.dart';
import '../supply.dart';

final class AdjustInventoryCommand implements Command<void> {
  const AdjustInventoryCommand({
    required this.supplyId,
    required this.delta,
    required this.kind,
    this.note,
  });

  final String supplyId;
  final int delta;
  final InventoryEventKind kind;
  final String? note;
}

final class AdjustInventoryHandler implements CommandHandler<AdjustInventoryCommand, void> {
  const AdjustInventoryHandler(this._store);

  final InventoryStore _store;

  @override
  Future<void> handle(AdjustInventoryCommand command) {
    return _store.adjust(
      command.supplyId,
      command.delta,
      kind: command.kind,
      note: command.note,
    );
  }
}
