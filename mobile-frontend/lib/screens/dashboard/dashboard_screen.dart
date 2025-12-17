import 'package:flutter/material.dart';
import '../../core/layout/header_matrics.dart';
import '../../widgets/common/header.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [

         SliverToBoxAdapter(
            child: SizedBox(
              height: DashboardLayoutMetrics.searchBarTopOffset() + 24,
            )
        ),

        const SliverToBoxAdapter(
            child: const PageHeader(title: 'Welcome')
        ),

        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Dashboard content TODO',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}
