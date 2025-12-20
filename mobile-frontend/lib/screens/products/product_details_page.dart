import 'package:flutter/material.dart';
import '../../models/product_model.dart';
import '../../core/constants/app_config.dart';

class ProductDetailsPage extends StatelessWidget {
  final ProductModel product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 320,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                '${AppConfig.apiBaseUrl}${product.imagePath}',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.name,
                      style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 8),
                  Text('Rs. ${product.price}',
                      style: const TextStyle(
                          fontSize: 18, color: Colors.red)),
                  const SizedBox(height: 16),
                  Text(product.description),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/seller-profile');
                    },
                    child: const Text('View Seller'),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
