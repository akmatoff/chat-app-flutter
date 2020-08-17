import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'register.dart';

import '../style.dart';

class Login extends StatefulWidget {
  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  SharedPreferences sharedPreferences;

  String apiURL = 'localhost:3000';

  // Dialog for sending message to the user if error
  void alertDialog(String title, String text) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(title: Text(title), content: Text(text));
        });
  }

  Future<String> login(String username, String password) async {
    Response res = await post('$apiURL/login',
        body: {'username': username, 'password': password});

    if (res.statusCode == 200) return res.body;
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Авторизация')),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            String username = usernameController.text;
            String password = passwordController.text;
            var res = await login(username, password);
            if (res != null) {
              sharedPreferences = await SharedPreferences.getInstance();
              sharedPreferences.setBool('logged_in', true);
              sharedPreferences.setString('token', res);
              Navigator.pushReplacementNamed(context, '/Home');
            } else {
              alertDialog(
                  'Ошибка при авторизации', 'Неверный логин или пароль.');
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
