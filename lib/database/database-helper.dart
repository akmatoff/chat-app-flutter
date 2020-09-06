import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

// DATABASE TO STORE CHATS AND MESSAGES OF THE USER

class DatabaseHelper {
  // Attributes for the able CHATS
  static const String TABLE_CHATS = "Chats";
  static const String CHATS_CHAT_ID = "Chat_ID";
  static const String CHATS_CURRENT_USERNAME = "Current_Username";
  static const String CHATS_PARTICIPANT_NAME = "Participant_Name";

  // Attributes for the table MESSAGES
  static const String TABLE_MESSAGES = "Messages";
  static const String MESSAGES_MESSAGE_ID = "Message_ID";
  static const String MESSAGES_CHAT_ID = "Chat_ID";
  static const String MESSAGES_Sender_Name = "Sender_Name";
  static const String MESSAGES_Receiver_Name = "Receiver_Name";
  static const String MESSAGES_TEXT = "Text";

  DatabaseHelper(); // Contstructor
  static final DatabaseHelper db = DatabaseHelper(); // Object of class

  Database _database;

  // Database getter. Create database if null, return database if exists.
  Future<Database> getDatabase() async {
    if (_database != null) {
      return _database;
    }

    _database = await createDatabase();

    return _database;
  }

  createDatabase() async {
    String path = await getDatabasesPath();

    return await openDatabase(join(path, 'chats.db'), version: 1,
        onCreate: (Database database, int version) async {
      await database.execute("CREATE TABLE $TABLE_CHATS ("
          "$CHATS_CHAT_ID INTEGER PRIMARY_KEY,"
          "$CHATS_CURRENT_USERNAME varchar(60),"
          "$CHATS_PARTICIPANT_NAME varchar(60)"
          ");"
          "CREATE TABLE $TABLE_MESSAGES ("
          "$MESSAGES_MESSAGE_ID INTEGER PRIMARY KEY,"
          "$MESSAGES_CHAT_ID INTEGER FOREIGN KEY REFERENCES $TABLE_CHATS($CHATS_CHAT_ID),"
          "$MESSAGES_Sender_Name varchar(60),"
          "$MESSAGES_Receiver_Name varchar(60,"
          "$MESSAGES_TEXT TEXT"
          ");");
    });
  }
}
