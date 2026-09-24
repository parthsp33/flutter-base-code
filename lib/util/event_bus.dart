import 'dart:async';

/// Simple app wide event bus. Use it to send events between screens
/// that do not share a cubit.
///
/// Fire:   `GetIt.I<EventBusService>().eventBus.fire(UserUpdatedEvent());`
/// Listen: `eventBus.eventBus.on<UserUpdatedEvent>().listen((event) {...});`
/// Always cancel the subscription in close() or dispose().
class EventBusService {
  final CustomEventBus eventBus = CustomEventBus();
}

class CustomEventBus {
  final StreamController _streamController;

  CustomEventBus({bool sync = false}) : _streamController = StreamController.broadcast(sync: sync);

  Stream<T> on<T>() {
    if (T == dynamic) {
      return _streamController.stream as Stream<T>;
    }
    return _streamController.stream.where((event) => event is T).cast<T>();
  }

  void fire(dynamic event) => _streamController.add(event);

  void destroy() => _streamController.close();
}

/// Add your app events below.
class UserUpdatedEvent {}
