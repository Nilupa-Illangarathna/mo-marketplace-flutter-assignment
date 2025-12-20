import 'package:flutter/material.dart';
import '../../models/category_model.dart';

const List<CategoryModel> dashboardCategories = [
  CategoryModel(
    name: 'Women\'s Fashion',
    icon: Icons.checkroom,
    slug: 'women',
  ),
  CategoryModel(
    name: 'Men\'s Fashion',
    icon: Icons.man,
    slug: 'men',
  ),
  CategoryModel(
    name: 'Babies & Kids',
    icon: Icons.child_care,
    slug: 'baby',
  ),
  CategoryModel(
    name: 'Furniture & Home Living',
    icon: Icons.chair_alt,
    slug: 'furniture',
  ),
  CategoryModel(
    name: 'Toys, Games & Books',
    icon: Icons.toys_outlined,
    slug: 'toys_games_books',
  ),
  CategoryModel(
    name: 'Beauty & Personal Care',
    icon: Icons.face_retouching_natural,
    slug: 'beauty_care',
  ),
  CategoryModel(
    name: 'TV & Home Appliances',
    icon: Icons.tv,
    slug: 'home_appliances',
  ),
];
