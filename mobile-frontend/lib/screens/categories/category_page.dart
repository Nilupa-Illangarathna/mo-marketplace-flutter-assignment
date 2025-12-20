import 'package:flutter/material.dart';
import '../../models/category_model.dart';
import '../../models/sub_category_model.dart';
import '../../core/utils/api_caller.dart';

class CategoryPage extends StatefulWidget {
  final CategoryModel category;

  const CategoryPage({
    super.key,
    required this.category,
  });

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List<SubCategoryModel> subCategories = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadSubCategories();
  }

  Future<void> loadSubCategories() async {
    final String route = '/api/categories/${widget.category.slug}/subcategories';

    debugPrint('[CategoryPage] GET $route');

    final res = await apiCaller.get(route);

    if (!mounted) return;

    if (res is List) {
      setState(() {
        subCategories = res
            .map(
              (e) => SubCategoryModel.fromJson(
            Map<String, dynamic>.from(e),
            imageUrl: '',
          ),
        )
            .toList();
        loading = false;
      });
      return;
    }

    debugPrint('[CategoryPage] Invalid or empty response: $res');

    setState(() {
      loading = false;
      subCategories = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.name),
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : subCategories.isEmpty
          ? const Center(child: Text('No sub-categories found'))
          : ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: subCategories.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, index) {
          final sub = subCategories[index];

          return ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                width: 56,
                height: 56,
                color: theme.colorScheme.surfaceVariant,
              ),
            ),
            title: Text(sub.name.toUpperCase()),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/products',
                arguments: {
                  'category': widget.category.slug,
                  'subCategory': sub.name,
                },
              );
            },
          );
        },
      ),
    );
  }
}
