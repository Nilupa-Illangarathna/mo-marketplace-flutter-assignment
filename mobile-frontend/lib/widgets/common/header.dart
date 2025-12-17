import 'package:flutter/material.dart';

class PageHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onNavigate;

  const PageHeader({
    super.key,
    required this.title,
    this.onNavigate,
  });

  static const double height = 88;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: const EdgeInsets.fromLTRB(16, 44, 16, 16),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),

          const Spacer(),

          if (onNavigate != null)
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios, size: 18),
              onPressed: onNavigate,
            ),
        ],
      ),
    );
  }
}
