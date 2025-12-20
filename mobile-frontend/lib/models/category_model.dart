import 'package:flutter/material.dart';
/*
  TODO:NOTE:
  - This model is intentionally kept minimal.
  - Getters and setters are NOT added because these are public nd final:
  - `toJson()` and `fromJson()` are NOT added
  - Custom print methods are NOT added: Will ad dit if debugging needed
*/
class CategoryModel {
  final String name;
  final IconData icon;
  final String slug;

  const CategoryModel({
    required this.name,
    required this.icon,
    required this.slug,
  });
}
