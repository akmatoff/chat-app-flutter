import 'package:flutter/material.dart';

class Confirm extends StatefulWidget {
  @override
  ConfirmState createState() => ConfirmState();
}

class ConfirmState extends State<Confirm> {
  final confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Подтверждение')),
        floatingActionButton: FloatingActionButton(
          onPressed: () => {},
          child: Icon(Icons.send),
        ),
        body: Center(
            child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 60.0),
          constraints: BoxConstraints(minHeight: 320.0, maxHeight: 500.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Код подтверждения'),
                TextFormField(controller: confirmController),
              ],
            ),
          ),
        )));
  }
}
