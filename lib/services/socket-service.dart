import 'package:chatAppFlutter/models/chat-model.dart';
import 'package:chatAppFlutter/models/message-model.dart';
import 'package:chatAppFlutter/models/user-model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socket_io_client/socket_io_client.dart';

class SocketService {
  Socket socket;
  SharedPreferences sharedPreferences;
  List<Chat> chats = [];

  createSocketConnection() {
    socket = io('https://chat-app-nodejs.akmatoff.repl.co', <String, dynamic>{
      'transports': ['websocket']
    });

    this.socket.on('connect', (_) => print('connected'));
    this.socket.on('connection-message', (msg) => print(msg));
    this.socket.on('disconnect', (_) => print('disconnected'));
  }

  List<Chat> getChats() {
    User sender;
    Message message;
    Chat chat;
    this.socket.on('receive-message', (msg) {
      sender = User(userID: msg.senderID, username: msg.senderName);
      message = Message(
          senderName: msg.senderName,
          receiverName: msg.receiverName,
          text: msg.text);
      chat = Chat(users: {'sender': sender});
      chat.messages.add(message);
      chats.add(chat);
    });
    return chats;
  }

  sendMessage({String senderName, String receiverName, String message}) {
    this.socket.emit('send-message', (msg) {
      msg.senderName = senderName;
      msg.receiverName = receiverName;
      msg.message = message;

      print('sending message: $msg.senderName, $msg.message');
    });
  }
}
