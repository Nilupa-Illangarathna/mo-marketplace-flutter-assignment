enum HomeTab {
  dashboard,
  categories,
  add,
  chat,
  login,
}

// Enum getter
HomeTab homeTabFromIndex(int index) {
  return HomeTab.values[index];
}


// This is for show search bar
extension HomeTabLayoutX on HomeTab {
  static const Map<HomeTab, String> _searchHintByTab = {
    HomeTab.dashboard: 'Search products',
    HomeTab.categories: 'Search categories',
    HomeTab.chat: 'Search chats',
  };

  bool get showsSearchBar => _searchHintByTab.containsKey(this);

  String get searchHintText => _searchHintByTab[this] ?? '';
}



