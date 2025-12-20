import 'package:flutter/material.dart';

import '../../core/layout/header_matrics.dart';
import '../../core/utils/api_caller.dart';
import '../../core/constants/app_config.dart';
import '../../models/product_model.dart';
import '../../widgets/product/product_card.dart';
import '../dummy/dummy_ui.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  bool loading = true;
  List<ProductModel> products = [];

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    const route = '/api/products';

    final res = await apiCaller.get(route);

    if (!mounted) return;

    if (res is List) {
      setState(() {
        products = res
            .map(
              (e) => ProductModel.fromJson(
            Map<String, dynamic>.from(e),
          ),
        )
            .toList();
        loading = false;
      });
    } else {
      setState(() {
        loading = false;
        products = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        /// --- EXISTING CODE (unchanged) ---
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

        /// --- ADDED BELOW (new) ---
        if (loading)
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(32),
              child: Center(child: CircularProgressIndicator()),
            ),
          )
        else
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  final p = products[index];

                  return ProductCard(
                    name: p.name,
                    price: p.price.toDouble(),
                    imageUrl: '${AppConfig.apiBaseUrl}${p.imagePath}',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DummyPage(title: p.name),
                        ),
                      );
                    },
                  );

                    },
                childCount: products.length,
              ),
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.68,
              ),
            ),
          ),
      ],
    );
  }
}
