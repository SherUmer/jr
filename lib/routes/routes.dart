import 'package:flutter/material.dart';

import '../screens/home.dart';
import '../screens/login.dart';
import '../screens/splash.dart';
import '../screens/settings.dart';

class RouteManager {
  static const String splashPage = '/';
  static const String login = '/login';
  static const String home = '/home';
  static const String settingsPage = '/settings';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashPage:
        return MaterialPageRoute(
          builder: (context) => const Splash(),
        );
      case login:
        return MaterialPageRoute(
          builder: (context) => Login(),
        );
      case home:
        return MaterialPageRoute(
          builder: (context) => Home(),
        );
      case settingsPage:
        return MaterialPageRoute(
          builder: (context) => const Settings(),
        );
      default:
        throw const FormatException('Route not found, Check routes again');
    }
  }
}
