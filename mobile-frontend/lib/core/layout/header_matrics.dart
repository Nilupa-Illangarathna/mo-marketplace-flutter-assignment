import '../../widgets/common/search_bar.dart';

class DashboardLayoutMetrics {
  static const double appBarHeight = 44;

  static double searchBarTopOffset() {
    return appBarHeight - (HomeSearchBar.height / 2);
  }
}