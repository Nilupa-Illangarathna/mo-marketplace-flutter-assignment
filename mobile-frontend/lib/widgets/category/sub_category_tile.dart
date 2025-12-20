import 'package:flutter/material.dart';
import '../../models/sub_category_model.dart';

class SubCategoryTile extends StatelessWidget {
  final SubCategoryModel subCategory;
  final VoidCallback onTap;

  const SubCategoryTile({
    super.key,
    required this.subCategory,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: 56,
          height: 56,
          color: theme.colorScheme.surfaceVariant,
        ),
      ),
      title: Text(subCategory.name.toUpperCase()),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}