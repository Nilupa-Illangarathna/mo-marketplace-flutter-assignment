import 'package:flutter/material.dart';
import 'package:mo_marketplace/screens/demo/demo_page_one.dart';
import 'package:mo_marketplace/screens/demo/demo_page_two.dart';
import 'package:mo_marketplace/screens/dummy/dummy_ui.dart';
import 'package:mo_marketplace/screens/home/homepage.dart';
import 'package:mo_marketplace/screens/splash/splash_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case '/help':
        return MaterialPageRoute(builder: (_) => const DummyPage(title: 'Help'),);
      case '/policies':
        return MaterialPageRoute(builder: (_) => const DummyPage(title: 'Policies'),);
      case '/faqs':
        return MaterialPageRoute(builder: (_) => const DummyPage(title: 'FAQs'),);
      default:
        return MaterialPageRoute(builder: (_) => const Scaffold(
            body: Center(child: Text('Route not found')),
          ),
        );
    }
  }
}
