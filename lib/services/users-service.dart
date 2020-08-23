import 'dart:convert';

import 'package:chatAppFlutter/models/user-model.dart';
import 'package:http/http.dart';

class UsersService {
  final String usersUrl = 'https://chat-app-nodejs.akmatoff.repl.co/user/users';

  Future<List<User>> getUsers() async {
    Response res = await get(usersUrl, headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
    });

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(utf8.decode(res.bodyBytes));

      List<User> users =
          body.map((dynamic item) => User.fromJson(item)).toList();

      return users;
    } else {
      throw res.statusCode;
    }
  }
}
