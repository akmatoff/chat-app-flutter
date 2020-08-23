import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'register.dart';
import '../style.dart';
import '../widgets/widgets.dart';

class Login extends StatefulWidget {
  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  SharedPreferences sharedPreferences;

  String apiURL = 'https://chat-app-nodejs.akmatoff.repl.co';

  Future<Map<String, dynamic>> login(String username, String password) async {
    Response res = await post('$apiURL/user/login',
        body: {'username': username, 'password': password});

    if (res.statusCode == 200) {
      Map<String, dynamic> result = jsonDecode(res.body);
      return result;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Авторизация')),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            String username = usernameController.text.trim();
            String password = passwordController.text.trim();
            var res = await login(username, password);
            if (res != null && username != '' && password != '') {
              sharedPreferences = await SharedPreferences.getInstance();
              sharedPreferences.setBool('logged_in', true);
              sharedPreferences.setString('user', jsonEncode(res));
              print(res);
              Navigator.pushReplacementNamed(context, '/Home');
            } else {
              alertDialog('Ошибка при авторизации',
                  'Неверный логин или пароль.', context);
            }
          },
          child: Icon(Icons.send),
        ),
        body: Center(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 60.0),
                constraints: BoxConstraints(minHeight: 250.0, maxHeight: 350.0),
                child: Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Логин'),
                          TextFormField(controller: usernameController)
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Пароль'),
                          TextFormField(
                            controller: passwordController,
                            obscureText: true,
                          )
                        ],
                      ),
                      Container(
                        child: FlatButton(
                          child:
                              Text('Зарегистрироваться', style: linkTextStyle),
                          onPressed: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      Register())),
                        ),
                      )
                    ],
                  ),
                ))));
  }
}
