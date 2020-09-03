import 'package:chatAppFlutter/services/socket-service.dart';
import 'package:chatAppFlutter/style.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class Chat extends StatefulWidget {
  final int userID;
  final String username;
  final String about;

  final String senderName;

  Chat({this.userID, this.username, this.about, this.senderName});

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  TextEditingController messageController = TextEditingController();
  SocketService socketService = injector.get<SocketService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.username)),
        body: Column(
          children: [
            // Messages Container
            Expanded(
              child: Container(
                child: Column(
                  children: [],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                alignment: Alignment.center,
                constraints: BoxConstraints(minHeight: 40.0),
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(15.0)),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: messageController,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        autofocus: true,
                        style: inputTextStyle,
                        decoration: InputDecoration.collapsed(
                            hintText: 'Введите сообщение...',
                            border: InputBorder.none,
                            hintStyle: inputHintTextStyle),
                      ),
                    ),
                    IconButton(
                        icon: Icon(Icons.send, color: Colors.white),
                        iconSize: 25.0,
                        onPressed: () => submit())
                  ],
                ),
              ),
            )
          ],
        ));
  }

  void submit() {
    socketService.sendMessage(
        text: messageController.text,
        receiverName: widget.username,
        senderName: widget.senderName);
    print('submit');
    messageController.text = '';
  }
}
