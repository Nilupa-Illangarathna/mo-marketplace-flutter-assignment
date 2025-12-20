import 'package:flutter/material.dart';
import '../../core/layout/header_matrics.dart';
import '../../core/routes/home_tab_enums.dart';
import '../../core/theme/theme_controller.dart';
import '../../widgets/common/app_drawer.dart';
import '../../widgets/common/search_bar.dart';
import '../add_page/add_page.dart';
import '../auth/login.dart';
import '../categories/categories_page.dart';
import '../chat_page/chat_page.dart';
import '../dashboard/dashboard_screen.dart';
import 'custom_nav_bar.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  PageController _pageController = PageController();

  bool _isAnimating = false;


  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final tab = homeTabFromIndex(_selectedIndex);
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('MO Marketplace'),
          actions: [
            ValueListenableBuilder<ThemeMode>(
              valueListenable: ThemeController.themeMode,
              builder: (context, mode, _) {
                final isDark = mode == ThemeMode.dark;

                return IconButton(
                  icon: Icon(
                    isDark
                        ? Icons.light_mode_outlined
                        : Icons.dark_mode_outlined,
                    color: isDark ? Colors.amber : null,
                  ),
                  onPressed: ThemeController.toggleTheme,
                  tooltip:
                  isDark ? 'Switch to Light Mode' : 'Switch to Dark Mode',
                );
              },
            ),
          ],
        ),
        body: Stack(
          children: [
            PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() => _selectedIndex = index);
              },
              children: [
                DashboardPage(),
                CategoriesPage(),
                AddPage(),
                ChatPage(),
                LoginPage(),
              ],
            ),

            // if (_selectedIndex == 0 || _selectedIndex == 1 || _selectedIndex == 3) // Instead I am using this enum
            if (tab.showsSearchBar)
              Positioned(
                top: DashboardLayoutMetrics.searchBarTopOffset(),
                left: 16,
                right: 16,
                child: HomeSearchBar(
                  hintText: tab.searchHintText,
                ),

              ),
          ],
        ),

        drawer: const AppDrawer(),
        bottomNavigationBar: CustomBottomNavBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  void _onItemTapped(int pageIndex) {
    int transitionTimeInMilisec = 300;
    if (!_isAnimating) {
      _isAnimating = true;
      Future.delayed(Duration(milliseconds: transitionTimeInMilisec), () {
        setState(() {
          _selectedIndex = pageIndex;
        });
      });
      _animateToPage(pageIndex, transitionTimeInMilisec);
    }
  }

  void _animateToPage(int pageIndex, int transitionTimeInMilisec) {
    _pageController
        .animateToPage(
      pageIndex,
      duration: Duration(milliseconds: transitionTimeInMilisec),
      curve: Curves.easeInOut,
    )
        .then((value) {
      setState(() {
        _isAnimating = false;
      });
    });
  }
}

