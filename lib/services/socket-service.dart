import 'package:socket_io_client/socket_io_client.dart';

class SocketService {
  Socket socket;

  createSocketConnection() {
    socket = io('http://localhost:3000', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': true
    });

    this.socket.on('connect', (_) => print('connected'));
    this.socket.on('disconnect', (_) => print('disconnected'));
  }
}
