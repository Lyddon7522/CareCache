import '../../../core/cqrs/mediator.dart';
import '../appearance.dart';

final class SetAppearanceCommand implements Command<void> {
  const SetAppearanceCommand(this.appearance);

  final CareAppearance appearance;
}

final class SetAppearanceHandler implements CommandHandler<SetAppearanceCommand, void> {
  const SetAppearanceHandler(this._store);

  final AppearanceStore _store;

  @override
  Future<void> handle(SetAppearanceCommand command) => _store.set(command.appearance);
}

final class WatchAppearanceQuery implements Query<Stream<CareAppearance>> {
  const WatchAppearanceQuery();
}

final class WatchAppearanceHandler
    implements QueryHandler<WatchAppearanceQuery, Stream<CareAppearance>> {
  const WatchAppearanceHandler(this._store);

  final AppearanceStore _store;

  @override
  Stream<CareAppearance> handle(WatchAppearanceQuery query) => _store.watch();
}
