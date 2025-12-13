import 'package:flutter/material.dart';
import 'app_router.dart';
import 'theme/app_theme.dart';
import 'theme/theme_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: ThemeController.themeMode,
      builder: (_, mode, __) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'MO Marketplace',
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: mode,
          onGenerateRoute: AppRouter.generateRoute,
        );
      },
    );
  }
}
