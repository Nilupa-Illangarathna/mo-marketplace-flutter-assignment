import 'package:flutter/material.dart';
import '../../models/category_model.dart';

const List<CategoryModel> dashboardCategories = [
  CategoryModel(
    name: 'Women\'s Fashion',
    icon: Icons.checkroom,
    route: '/category/women',
  ),
  CategoryModel(
    name: 'Men\'s Fashion',
    icon: Icons.man,
    route: '/category/men',
  ),
  CategoryModel(
    name: 'Babies & Kids',
    icon: Icons.child_care,
    route: '/category/baby',
  ),
  CategoryModel(
    name: 'Furniture & Home Living',
    icon: Icons.chair,
    route: '/category/furniture',
  ),
  CategoryModel(
    name: 'Toys',
    icon: Icons.toys,
    route: '/category/toys',
  ),
];