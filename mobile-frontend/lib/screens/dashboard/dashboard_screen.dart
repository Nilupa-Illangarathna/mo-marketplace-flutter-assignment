import 'package:flutter/material.dart';
import '../../core/layout/header_matrics.dart';
import '../../models/product_model.dart';
import '../../core/utils/api_caller.dart';
import '../../widgets/dashboard/banner_carousel.dart';
import '../../widgets/dashboard/dashboard_top_products.dart';
import '../../widgets/dashboard/recent_products.dart';
import '../../widgets/dashboard/category_list.dart';
import '../../data/mock/dashboard_categories.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<ProductModel> _allProducts = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    final res = await apiCaller.get('/api/products');

    if (!mounted) return;

    if (res is List) {
      setState(() {
        _allProducts = res
            .map((e) => ProductModel.fromJson(
          Map<String, dynamic>.from(e),
        ))
            .toList();
        loading = false;
      });
    } else {
      setState(() => loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final topProducts = _allProducts.take(10).toList();
    final recentProducts =
    _allProducts.reversed.take(10).toList();

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(
            height: DashboardLayoutMetrics.searchBarTopOffset() + 74,
          ),
        ),

        SliverToBoxAdapter(
          child: DashboardCategoryList(
            categories: dashboardCategories,
          ),
        ),

        const SliverToBoxAdapter(
          child: DashboardBannerCarousel(),
        ),

        SliverToBoxAdapter(
          child: DashboardTopProducts(products: topProducts),
        ),

        SliverToBoxAdapter(
          child: DashboardRecentProducts(products: recentProducts),
        ),

        const SliverToBoxAdapter(
          child: SizedBox(height: 24),
        ),
      ],
    );
  }
}
