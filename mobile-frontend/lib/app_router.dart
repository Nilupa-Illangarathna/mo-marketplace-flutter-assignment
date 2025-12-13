import 'package:flutter/material.dart';
import 'package:mo_marketplace/screens/demo/demo_page_one.dart';
import 'package:mo_marketplace/screens/demo/demo_page_two.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const PageOne());
      case '/second':
        return MaterialPageRoute(builder: (_) => const PageTwo());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Route not found')),
          ),
        );
    }
  }
}
