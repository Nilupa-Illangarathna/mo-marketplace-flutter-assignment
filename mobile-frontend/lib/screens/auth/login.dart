import 'package:flutter/material.dart';

import '../../core/layout/header_matrics.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            height: 88,
            padding: const EdgeInsets.fromLTRB(16, 44, 16, 16),
            child: const Text(
              'Login',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),

        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Login content TODO',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}
