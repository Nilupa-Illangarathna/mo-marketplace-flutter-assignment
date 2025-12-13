import 'package:flutter/material.dart';
import 'dart:io';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final double height;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    this.height = 120.0,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: Platform.isIOS ? const EdgeInsets.only(bottom: 0) : EdgeInsets.zero,
      height: height,
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        boxShadow: Platform.isIOS
            ? []
            : [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        bottom: true,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: onTap,
          backgroundColor: theme.scaffoldBackgroundColor,
          selectedItemColor: theme.primaryColor,
          unselectedItemColor: colorScheme.onSurface.withOpacity(0.6),
          items: [
            BottomNavigationBarItem(
              icon: _buildIcon(Icons.home_outlined, 0, context),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: _buildIcon(Icons.category_outlined, 1, context),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: _buildIcon(Icons.add_circle_outline, 2, context),
              label: 'Add',
            ),
            BottomNavigationBarItem(
              icon: _buildIcon(Icons.chat_bubble_outline, 3, context),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: _buildIcon(Icons.person_outline, 4, context),
              label: 'Login',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(IconData iconData, int index, BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final bool isSelected = index == currentIndex;

    return Icon(
      iconData,
      size: 20.0,
      color: isSelected
          ? theme.primaryColor
          : colorScheme.onSurface.withOpacity(0.6),
    );
  }
}
