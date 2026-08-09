abstract interface class Command<TResult> {
  const Command();
}

abstract interface class Query<TResult> {
  const Query();
}

abstract interface class CommandHandler<TCommand extends Command<TResult>, TResult> {
  Future<TResult> handle(TCommand command);
}

abstract interface class QueryHandler<TQuery extends Query<TResult>, TResult> {
  TResult handle(TQuery query);
}

final class Mediator {
  final Map<Type, _CommandInvoker> _commandHandlers = <Type, _CommandInvoker>{};
  final Map<Type, _QueryInvoker> _queryHandlers = <Type, _QueryInvoker>{};

  void registerCommand<TCommand extends Command<TResult>, TResult>(
    CommandHandler<TCommand, TResult> handler,
  ) {
    _assertNotRegistered(_commandHandlers, TCommand);
    _commandHandlers[TCommand] = _TypedCommandInvoker<TCommand, TResult>(handler);
  }

  void registerQuery<TQuery extends Query<TResult>, TResult>(
    QueryHandler<TQuery, TResult> handler,
  ) {
    _assertNotRegistered(_queryHandlers, TQuery);
    _queryHandlers[TQuery] = _TypedQueryInvoker<TQuery, TResult>(handler);
  }

  Future<TResult> send<TResult>(Command<TResult> command) async {
    final handler = _commandHandlers[command.runtimeType];
    if (handler == null) {
      throw UnregisteredRequestException(command.runtimeType);
    }
    final result = await handler.invoke(command);
    return result as TResult;
  }

  TResult query<TResult>(Query<TResult> query) {
    final handler = _queryHandlers[query.runtimeType];
    if (handler == null) {
      throw UnregisteredRequestException(query.runtimeType);
    }
    return handler.invoke(query) as TResult;
  }

  static void _assertNotRegistered(Map<Type, Object> handlers, Type requestType) {
    if (handlers.containsKey(requestType)) {
      throw DuplicateRequestHandlerException(requestType);
    }
  }
}

final class UnregisteredRequestException implements Exception {
  const UnregisteredRequestException(this.requestType);

  final Type requestType;

  @override
  String toString() => 'No CQRS handler is registered for $requestType.';
}

final class DuplicateRequestHandlerException implements Exception {
  const DuplicateRequestHandlerException(this.requestType);

  final Type requestType;

  @override
  String toString() => 'A CQRS handler is already registered for $requestType.';
}

abstract interface class _CommandInvoker {
  Future<Object?> invoke(Object request);
}

final class _TypedCommandInvoker<TCommand extends Command<TResult>, TResult>
    implements _CommandInvoker {
  const _TypedCommandInvoker(this._handler);

  final CommandHandler<TCommand, TResult> _handler;

  @override
  Future<Object?> invoke(Object request) async {
    return _handler.handle(request as TCommand);
  }
}

abstract interface class _QueryInvoker {
  Object? invoke(Object request);
}

final class _TypedQueryInvoker<TQuery extends Query<TResult>, TResult> implements _QueryInvoker {
  const _TypedQueryInvoker(this._handler);

  final QueryHandler<TQuery, TResult> _handler;

  @override
  Object? invoke(Object request) => _handler.handle(request as TQuery);
}
