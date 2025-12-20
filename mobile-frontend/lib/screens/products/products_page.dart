import 'package:flutter/material.dart';
import '../../models/product_model.dart';
import '../../core/utils/api_caller.dart';
import '../../core/constants/app_config.dart';

class ProductsPage extends StatefulWidget {
  final String category;
  final String subCategory;

  const ProductsPage({
    super.key,
    required this.category,
    required this.subCategory,
  });

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  List<ProductModel> products = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadProducts();
  }

  Future<void> loadProducts() async {
    final String route = '/api/products?category=${widget.category}&subCategory=${widget.subCategory}';

    debugPrint('[ProductsPage] GET $route');

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
      return;
    }

    debugPrint('[ProductsPage] Invalid or empty response: $res');

    setState(() {
      loading = false;
      products = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.subCategory),
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : products.isEmpty
          ? const Center(child: Text('No products found'))
          : GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 0.7,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final p = products[index];

          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                '/product-details',
                arguments: p,
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      '${AppConfig.apiBaseUrl}${p.imagePath}',
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        color: Theme.of(context)
                            .colorScheme
                            .surfaceVariant,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  p.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  'Rs. ${p.price}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
