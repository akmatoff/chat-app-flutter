import 'package:chatAppFlutter/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'app-init.dart';
import 'app.dart';

Injector injector;
void main() async {
  DependencyInjection().init(Injector.getInjector());
  injector = Injector.getInjector();
  await AppInit().initialise(injector);
  runApp(App());
}
