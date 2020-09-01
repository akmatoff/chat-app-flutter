import 'dart:convert';

import 'package:chatAppFlutter/models/user-model.dart';
import 'package:http/http.dart';

class UsersService {
  String usersUrl = 'https://chat-app-nodejs.akmatoff.repl.co/user/users';
  List<User> users = [];
  User currentUser;

  void getUsersFiltered(String username) async {
    Response res = await get(usersUrl + '?username=' + username, headers: {
      "Content-Type": "application/json",
      "Accept": "application/json"
    });

    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);

      List<dynamic> bodyUsers = body['users'].toList();
      users = bodyUsers.map((dynamic item) => User.fromJson(item)).toList();
      currentUser = users[0];

      print(users);
      print(currentUser.userID);
      print("USERS SERVICE: $currentUser");
    } else {
      throw res.statusCode;
    }
  }
}
