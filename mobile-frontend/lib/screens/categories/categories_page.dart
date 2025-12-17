import 'package:flutter/material.dart';

import '../../core/layout/header_matrics.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(
            height: DashboardLayoutMetrics.searchBarTopOffset() + 24,
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 88,
            padding: const EdgeInsets.fromLTRB(16, 44, 16, 16),
            child: const Text(
              'Categories',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
          ),
        ),

        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Categories content TODO',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}
