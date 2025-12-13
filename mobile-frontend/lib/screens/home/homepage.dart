import 'package:flutter/material.dart';
import '../../core/constants/app_config.dart';
import '../../theme/theme_controller.dart';
import '../../widgets/common/app_drawer.dart';
import '../dummy/dummy_ui.dart';
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
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false; // Prevent going back
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
                    isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
                    color: isDark ? Colors.amber : Colors.black,
                  ),
                  onPressed: ThemeController.toggleTheme,
                  tooltip: isDark ? 'Switch to Light Mode' : 'Switch to Dark Mode',
                );
              },
            ),
          ],
        ),
        body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _selectedIndex = index);
          },
          children: const [
            DummyPage(title: 'Home'),
            DummyPage(title: 'Categories'),
            DummyPage(title: 'Add'),
            DummyPage(title: 'Chat'),
            DummyPage(title: 'Login'),
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
    int currentPageIndex = _pageController.page!.round();
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

