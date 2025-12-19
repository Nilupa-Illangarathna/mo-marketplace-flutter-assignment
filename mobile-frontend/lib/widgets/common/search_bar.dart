import 'package:flutter/material.dart';

class HomeSearchBar extends StatelessWidget {
  final String hintText;

  const HomeSearchBar({
    super.key,
    required this.hintText,
  });

  static const double height = 52;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      elevation: 0,
      shadowColor: Colors.black.withOpacity(0.15),
      borderRadius: BorderRadius.circular(30),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: const Icon(Icons.search),
          filled: true,
          fillColor: theme.cardColor,
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
