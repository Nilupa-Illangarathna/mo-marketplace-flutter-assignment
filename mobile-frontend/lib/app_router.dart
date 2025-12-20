import 'package:flutter/material.dart';
import 'package:mo_marketplace/screens/categories/category_page.dart';
import 'package:mo_marketplace/screens/demo/demo_page_one.dart';
import 'package:mo_marketplace/screens/demo/demo_page_two.dart';
import 'package:mo_marketplace/screens/dummy/dummy_ui.dart';
import 'package:mo_marketplace/screens/home/homepage.dart';
import 'package:mo_marketplace/screens/products/product_details_page.dart';
import 'package:mo_marketplace/screens/products/products_page.dart';
import 'package:mo_marketplace/screens/splash/splash_screen.dart';
import 'models/category_model.dart';
import 'models/product_model.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case '/help':
        return MaterialPageRoute(builder: (_) => const DummyPage(title: 'Help'),);
      case '/policies':
        return MaterialPageRoute(builder: (_) => const DummyPage(title: 'Policies'),);
      case '/category':
        final category = settings.arguments as CategoryModel;
        return MaterialPageRoute(
          builder: (_) => CategoryPage(category: category),
        );
      case '/products':
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => ProductsPage(
            category: args['category'] as String,
            subCategory: args['subCategory'] as String,
          ),
        );
      case '/product-details':
        final product = settings.arguments as ProductModel;
        return MaterialPageRoute(
          builder: (_) => ProductDetailsPage(product: product),
        );
      case '/seller-profile':
        return MaterialPageRoute(
          builder: (_) => const DummyPage(title: 'Seller Profile'),
        );
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
