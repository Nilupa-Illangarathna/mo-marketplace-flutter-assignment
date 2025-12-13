// mobile-frontend/lib/widgets/common/app_drawer.dart

import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          children: [
            const DrawerHeader(
              child: Text(
                'Menu',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _item(context, 'Help', '/help'),
            _item(context, 'Policies', '/policies'),
            _item(context, 'FAQs', '/faqs'),
          ],
        ),
      ),
    );
  }

  Widget _item(BuildContext context, String title, String route) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.pop(context);
        Navigator.pushNamed(context, route);
      },
    );
  }
}
