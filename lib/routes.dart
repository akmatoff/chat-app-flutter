import 'package:flutter/material.dart';
import 'screens/screens.dart';

Map<String, WidgetBuilder> routes() {
  return <String, WidgetBuilder>{
    "/Home": (BuildContext context) => Home(),
    "/Users": (BuildContext context) => UsersFutureBuilder()
  };
}
