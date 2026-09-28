import 'package:base_project/config/env.dart';
import 'package:base_project/data/storage/storage.dart';
import 'package:get_it/get_it.dart';
import 'package:socket_io_client/socket_io_client.dart';

/// Manages the app's Socket.IO connection and event subscriptions.
class SocketService {
  Socket? _socket;

  StorageService get _storage => GetIt.I<StorageService>();

  bool get isConnected => _socket?.connected ?? false;

  /// Opens a connection to [url], defaulting to the active environment host.
  void connect({
    String? url,
    String? path,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
  }) {
    if (isConnected) return;

    _socket?.dispose();

    final token = _storage.authToken;
    final options = OptionBuilder()
        .setTransports(['websocket'])
        .disableAutoConnect()
        .enableForceNew()
        .setExtraHeaders({
          ...?headers,
          if (token.isNotEmpty) 'Authorization': 'Bearer $token',
        });

    if (path != null) options.setPath(path);
    if (query != null) options.setQuery(query);

    _socket = io(url ?? HostMode.env.baseUrl, options.build())..connect();
  }

  /// Registers a listener for a server event. Connect before subscribing.
  void on(String event, void Function(dynamic data) callback) {
    _requireSocket().on(event, callback);
  }

  /// Removes one listener, or all listeners for [event] when [callback] is null.
  void off(String event, [void Function(dynamic data)? callback]) {
    _requireSocket().off(event, callback);
  }

  /// Sends [data] to the server under [event].
  void emit(String event, [dynamic data]) {
    _requireSocket().emit(event, data);
  }

  /// Closes the active connection but keeps the service available to reconnect.
  void disconnect() {
    _socket?.disconnect();
  }

  /// Closes the connection and removes its listeners.
  void dispose() {
    _socket?.dispose();
    _socket = null;
  }

  Socket _requireSocket() {
    final socket = _socket;
    if (socket == null) {
      throw StateError('Connect the socket before using its events.');
    }
    return socket;
  }
}
