import 'package:flutter/material.dart';

import 'route_name.dart';

class RouteHandler {
  static String initialRoute = Routes.splash;
  static const initialNavBarVisibility = true;

  static Widget emptyPage() {
    return const Scaffold(
      body: Center(
        child: Text('404 Not Found'),
      ),
    );
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (_) => emptyPage(),
        );
    }
  }
}
