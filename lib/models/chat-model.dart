import 'message-model.dart';
import 'user-model.dart';

class ChatModel {
  List<User> users = [];
  List<Message> messages = [];

  List<Message> getMessages(int userID) {
    return messages
        .where((msg) => msg.senderID == userID || msg.receiverID == userID)
        .toList();
  }
}
