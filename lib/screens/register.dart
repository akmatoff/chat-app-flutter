import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../widgets/widgets.dart';
import 'login.dart';

class Register extends StatefulWidget {
  @override
  RegisterState createState() => RegisterState();
}

class RegisterState extends State<Register> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();

  String apiURL = 'https://chat-app-nodejs.akmatoff.repl.co';

  // Sign up, send request to the API
  Future<int> signUp(String username, String password) async {
    Response res = await post('$apiURL/user/signup',
        body: {"username": username, "password": password});
    return res.statusCode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Регистрация')),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            String username = usernameController.text;
            String password = passwordController.text;
            String passwordConfirm = passwordConfirmController.text;

            // Verification
            if (username.length < 4) {
              alertDialog('Слишком короткий логин',
                  'Логин должен содержать как минимум 4 символа', context);
            } else if (password.length < 6) {
              alertDialog('Слишком короткий пароль',
                  'Пароль должен содержать как минимум 6 символов', context);
            } else if (passwordConfirm != password) {
              alertDialog('Пароли не совпадают',
                  'Введите одинаковые пароли для подтверждения.', context);
            } else {
              int res = await signUp(username, password);

              // Check response code and alert user
              if (res == 201) {
                alertDialog('Поздравляем!',
                    'Пользователь был создан. Авторизуйтесь!', context);
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) => Login()));
              } else if (res == 409) {
                alertDialog('Пользователь уже существует',
                    'Введите другой логин или авторизуйтесь.', context);
              } else {
                alertDialog('Неизвестная ошибка',
                    'Произошла неизвестная ошибка.', context);
              }
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Подтверждение пароля'),
                          TextFormField(
                            controller: passwordConfirmController,
                            obscureText: true,
                          )
                        ],
                      ),
                    ],
                  ),
                ))));
  }
}
