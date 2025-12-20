import 'package:flutter/material.dart';
import '../../models/category_model.dart';

const List<CategoryModel> dashboardCategories = [
  CategoryModel(
    name: 'Women\'s Fashion',
    icon: Icons.checkroom,
    route: '/category/women-fashion',
  ),
  CategoryModel(
    name: 'Men\'s Fashion',
    icon: Icons.man,
    route: '/category/men-fashion',
  ),
  CategoryModel(
    name: 'Babies & Kids',
    icon: Icons.child_care,
    route: '/category/baby-kids',
  ),
  CategoryModel(
    name: 'Furniture & Home Living',
    icon: Icons.chair_alt,
    route: '/category/furniture-home',
  ),
  CategoryModel(
    name: 'Toys, Games & Books',
    icon: Icons.toys_outlined,
    route: '/category/toys-games-books',
  ),
  CategoryModel(
    name: 'Beauty & Personal Care',
    icon: Icons.face_retouching_natural,
    route: '/category/beauty-care',
  ),
  CategoryModel(
    name: 'TV & Home Appliances',
    icon: Icons.tv,
    route: '/category/home-appliances',
  ),
];
