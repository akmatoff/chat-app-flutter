import '../database/database-helper.dart';

class Message {
  int messageID;
  String text;
  String senderName;
  String receiverName;
  String timestamp;

  Message(
      {this.messageID,
      this.text,
      this.senderName,
      this.receiverName,
      this.timestamp});

  Message.fromMap(Map<String, dynamic> message) {
    messageID = message[DatabaseHelper.MESSAGES_MESSAGE_ID];
    senderName = message[DatabaseHelper.MESSAGES_Sender_Name];
    receiverName = message[DatabaseHelper.MESSAGES_Receiver_Name];
    text = message[DatabaseHelper.MESSAGES_TEXT];
    timestamp = message[DatabaseHelper.MESSAGES_TIMESTAMP];
  }
}
