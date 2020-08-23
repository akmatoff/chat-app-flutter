import 'package:chatAppFlutter/models/user-model.dart';
import 'package:chatAppFlutter/services/users-service.dart';
import 'package:chatAppFlutter/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UsersFutureBuilder extends StatefulWidget {
  @override
  _UsersFutureBuilderState createState() => _UsersFutureBuilderState();
}

class _UsersFutureBuilderState extends State<UsersFutureBuilder> {
  UsersService usersService = UsersService();
  List<User> users;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: usersService.getUsers(),
      builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
        if (snapshot.hasData) {
          users = snapshot.data;
          return Users(users: users);
        } else if (snapshot.hasError) {
          return Center(child: Text('Ошибка при загрузке'));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    ));
  }
}

class Users extends StatefulWidget {
  final List<User> users;

  Users({@required this.users});

  @override
  UsersState createState() => UsersState();
}

class UsersState extends State<Users> {
  final searchController = TextEditingController();
  UsersFutureBuilder usersFutureBuilder = UsersFutureBuilder();
  UsersService usersService = UsersService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: TextField(
        autofocus: true,
        style: searchBarTextStyle,
        decoration: InputDecoration.collapsed(
            hintText: 'Поиск...',
            border: InputBorder.none,
            hintStyle: searchBarTextStyle),
      )),
    );
  }
}
