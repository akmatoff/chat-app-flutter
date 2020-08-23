import 'package:flutter/material.dart';

class Users extends StatefulWidget {
  @override
  UsersState createState() => UsersState();
}

class UsersState extends State<Users> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Пользователи')),
    );
  }
}
