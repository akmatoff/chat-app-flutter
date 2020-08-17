import 'package:flutter/material.dart';

import 'confirm.dart';

class Authorize extends StatefulWidget {
  @override
  AuthorizeState createState() => AuthorizeState();
}

class AuthorizeState extends State<Authorize> {
  final numberInputController = TextEditingController();

  void submit() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => Confirm()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Ваш номер телефона')),
        floatingActionButton: FloatingActionButton(
          onPressed: () => submit(),
          child: Icon(Icons.send),
        ),
        body: Center(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 60.0),
                constraints: BoxConstraints(minHeight: 320.0, maxHeight: 500.0),
                child: Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Ваш номер телефона'),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            controller: numberInputController,
                          )
                        ],
                      )
                    ],
                  ),
                ))));
  }
}
