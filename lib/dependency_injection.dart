import 'package:chatAppFlutter/services/socket-service.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

class DependencyInjection {
  Injector init(Injector injector) {
    injector.map<SocketService>((i) => SocketService(), isSingleton: true);
    return injector;
  }
}
