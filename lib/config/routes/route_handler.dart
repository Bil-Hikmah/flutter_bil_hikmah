import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/feature/onboard/screen/onboard_page.dart';
import 'package:page_transition/page_transition.dart';

import '../../feature/splash/screen/splash_screen_page.dart';
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
          builder: (_) => const SplashScreenPage(),
          settings: settings,
        );
      case Routes.onboarding:
        return PageTransition(
          type: PageTransitionType.fade,
          settings: RouteSettings(
            name: settings.name,
          ),
          child: const OnboardPage(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => emptyPage(),
        );
    }
  }
}
