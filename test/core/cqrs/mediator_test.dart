import 'package:carecache/core/cqrs/mediator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('dispatches a command to its single registered handler', () async {
    final mediator = Mediator()..registerCommand<_IncrementCommand, int>(_IncrementHandler());

    final result = await mediator.send<int>(const _IncrementCommand(41));

    expect(result, 42);
  });

  test('dispatches a query without hiding its return type', () {
    final mediator = Mediator()..registerQuery<_GreetingQuery, String>(_GreetingHandler());

    expect(mediator.query<String>(const _GreetingQuery('CareCache')), 'Hello, CareCache');
  });

  test('rejects missing and duplicate registrations', () async {
    final mediator = Mediator()..registerCommand<_IncrementCommand, int>(_IncrementHandler());

    expect(
      () => mediator.registerCommand<_IncrementCommand, int>(_IncrementHandler()),
      throwsA(isA<DuplicateRequestHandlerException>()),
    );
    await expectLater(
      mediator.send<String>(const _MissingCommand()),
      throwsA(isA<UnregisteredRequestException>()),
    );
  });
}

final class _IncrementCommand implements Command<int> {
  const _IncrementCommand(this.value);

  final int value;
}

final class _IncrementHandler implements CommandHandler<_IncrementCommand, int> {
  @override
  Future<int> handle(_IncrementCommand command) async => command.value + 1;
}

final class _GreetingQuery implements Query<String> {
  const _GreetingQuery(this.name);

  final String name;
}

final class _GreetingHandler implements QueryHandler<_GreetingQuery, String> {
  @override
  String handle(_GreetingQuery query) => 'Hello, ${query.name}';
}

final class _MissingCommand implements Command<String> {
  const _MissingCommand();
}
