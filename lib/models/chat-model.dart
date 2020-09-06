import 'message-model.dart';
import 'user-model.dart';

class Chat {
  int chatID;
  Map<String, User> users;
  List<Message> messages;

  Chat({this.chatID, this.users, this.messages});
}
