import 'package:flutter/material.dart';
import '../../core/layout/header_matrics.dart';
import '../../data/mock/dashboard_categories.dart';
import '../../widgets/common/header.dart';
import '../../widgets/dashboard/dashboard_category_list.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [

         SliverToBoxAdapter(
            child: SizedBox(
              height: DashboardLayoutMetrics.searchBarTopOffset() + 74,
            )
        ),

        SliverToBoxAdapter(
          child: DashboardCategoryList(
            categories: dashboardCategories,
          ),
        ),


      ],
    );
  }
}
