import 'dart:convert';

import 'package:chatAppFlutter/models/user-model.dart';
import 'package:http/http.dart';

class UsersService {
  String usersUrl = 'https://chat-app-nodejs.akmatoff.repl.co/user/users';

  Future<List<User>> getUsers() async {
    Response res = await get(usersUrl, headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
    });

    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);

      List<dynamic> bodyUsers = body['users'].toList();
      List<User> users =
          bodyUsers.map((dynamic item) => User.fromJson(item)).toList();

      print('HTTP: 200 / OK');

      return users;
    } else {
      throw res.statusCode;
    }
  }
}
