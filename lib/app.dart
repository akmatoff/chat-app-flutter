import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/home.dart';
import 'screens/login.dart';
import 'style.dart';

class App extends StatefulWidget {
  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  SharedPreferences sharedPreferences;
  bool loggedIn = false;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    // Check if authorized, no data in sharedPreferences - not authorized
    if (sharedPreferences.getString("token") == null) {
      setState(() {
        loggedIn = false;
      });
    } else {
      sharedPreferences.getString("username");
      setState(() {
        loggedIn = true;
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
        theme: ThemeData(
            fontFamily: 'Merriweather',
            primaryColor: primaryColor,
            scaffoldBackgroundColor: scaffoldBackgroundColor,
            floatingActionButtonTheme:
                FloatingActionButtonThemeData(backgroundColor: primaryColor)));
  }
}
