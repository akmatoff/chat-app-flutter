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
    socket.on('receive-message', (msg) {
      sender = User(userID: msg.senderID, username: msg.senderName);
      message = Message(senderID: sender.userID, text: msg.text);
      chat = Chat(messages: [message], users: {'sender': sender});
      chats.add(chat);
    });
    return chats;
  }

  sendMessage(int senderID, String senderName, int receiverID, String message) {
    socket.emit('send-message', (msg) {
      msg.senderID = senderID;
      msg.senderName = senderName;
      msg.receiverID = receiverID;
      msg.message = message;
    });
  }
}
