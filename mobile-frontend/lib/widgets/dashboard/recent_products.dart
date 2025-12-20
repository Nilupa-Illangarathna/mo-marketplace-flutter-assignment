import 'package:flutter/material.dart';
import '../../models/product_model.dart';
import '../../core/constants/app_config.dart';
import '../../screens/dummy/dummy_ui.dart';

class DashboardRecentProducts extends StatelessWidget {
  final List<ProductModel> products;

  const DashboardRecentProducts({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) return const SizedBox();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _header(context, 'Recently Added'),

        SizedBox(
          height: 150, // ⬇ reduced height
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final p = products[index];

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const DummyPage(
                        title: 'Recent Product',
                      ),
                    ),
                  );
                },
                child: Container(
                  width: 150, // ⬆ slightly wider
                  margin: const EdgeInsets.only(right: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 100, // ⬇ controlled image height
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            '${AppConfig.apiBaseUrl}${p.imagePath}',
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Rs. ${p.price}',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _header(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
