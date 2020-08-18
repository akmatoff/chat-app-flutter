import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'views/home.dart';
import 'views/login.dart';
import 'models/user-model.dart';
import 'style.dart';

class App extends StatefulWidget {
  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  Map<String, WidgetBuilder> routes() {
    return <String, WidgetBuilder>{"/Home": (BuildContext context) => Home()};
  }

  SharedPreferences sharedPreferences;
  bool loggedIn = false;
  User user;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    // Check if authorized, no data in sharedPreferences - not authorized
    if (sharedPreferences.getBool("logged_in") == null) {
      setState(() {
        loggedIn = false;
      });
    } else {
      // Load user data from sharedPrefs
      var userLoad = jsonDecode(sharedPreferences.getString("user"));
      // Create an instance of user from sharedPrefs
      user = User(
          userID: userLoad['user_id'],
          username: userLoad['username'],
          about: userLoad['about']);

      setState(() {
        loggedIn = true;
        print(user);
      });
    }
  }

  Widget home() {
    if (loggedIn) {
      return Home();
    } else {
      return Login();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: home(),
        routes: routes(),
        theme: ThemeData(
            primaryColor: primaryColor,
            scaffoldBackgroundColor: scaffoldBackgroundColor,
            floatingActionButtonTheme:
                FloatingActionButtonThemeData(backgroundColor: primaryColor)));
  }
}
