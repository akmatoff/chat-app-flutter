import 'package:chatAppFlutter/services/socket-service.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  final SocketService socketService = injector.get<SocketService>();

  @override
  void initState() {
    socketService.createSocketConnection();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Коп Суйлобо')),
    );
  }
}
