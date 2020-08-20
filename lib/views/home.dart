import 'package:chatAppFlutter/models/chat-model.dart';
import 'package:chatAppFlutter/services/socket-service.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  final SocketService socketService = injector.get<SocketService>();
  List<Chat> chats;

  @override
  void initState() {
    socketService.createSocketConnection();
    chats = socketService.getChats();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Коп Суйлобо')),
        body: Container(
            child: ListView.builder(
          itemCount: chats.length,
          itemBuilder: (BuildContext context, int i) => ListTile(
            title: Text(chats[i].users['sender'].username),
            subtitle:
                Text(chats[i].messages[chats[i].messages.length - 1].text),
          ),
        )));
  }
}
