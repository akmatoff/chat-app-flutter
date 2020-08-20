import 'message-model.dart';
import 'user-model.dart';

class Chat {
  Map<String, User> users;
  List<Message> messages;

  Chat({this.users, this.messages});
}
