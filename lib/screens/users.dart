import 'package:chatAppFlutter/models/user-model.dart';
import 'package:chatAppFlutter/services/users-service.dart';
import 'package:chatAppFlutter/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Users extends StatefulWidget {
  @override
  UsersState createState() => UsersState();
}

class UsersState extends State<Users> {
  final searchController = TextEditingController();
  // UsersFutureBuilder usersFutureBuilder = UsersFutureBuilder();
  UsersService usersService = UsersService();
  List<User> users;

  @override
  void initState() {
    users = [];
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print('Users: $users');
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: TextField(
          autofocus: true,
          onChanged: (text) {
            fetchData(text);
          },
          style: searchBarTextStyle,
          decoration: InputDecoration.collapsed(
              hintText: 'Поиск...',
              border: InputBorder.none,
              hintStyle: searchBarTextStyle),
        )),
        body: ListView.builder(
            itemBuilder: (BuildContext context, int i) {
              return ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  title: Text(usersService.users[i].username,
                      style: defaultTextStyle));
            },
            itemCount: usersService.users.length));
  }

  fetchData(String username) {
    setState(() {
      usersService.getUsersFiltered(username);
    });
    print('filtering');
  }
}
