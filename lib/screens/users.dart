import 'package:chatAppFlutter/models/user-model.dart';
import 'package:chatAppFlutter/services/users-service.dart';
import 'package:chatAppFlutter/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'screens.dart';

class Users extends StatefulWidget {
  @override
  UsersState createState() => UsersState();
}

class UsersState extends State<Users> {
  final searchController = TextEditingController();
  UsersService usersService = UsersService();
  List<User> users;

  @override
  void initState() {
    users = [];
    super.initState();
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
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => Chat(
                        userID: users[i].userID,
                        username: users[i].username,
                        about: users[i].about))),
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                title: Text(users[i].username, style: defaultTextStyle),
              );
            },
            itemCount: users.length));
  }

  fetchData(String username) {
    usersService.getUsersFiltered(username);
    setState(() {
      users = usersService.users;
    });
    print('filtering');
  }
}
