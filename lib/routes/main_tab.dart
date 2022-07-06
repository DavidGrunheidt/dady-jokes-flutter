import '../modules/favorites/favorites_page.dart';
import '../modules/feed/feed_page.dart';
import '../modules/search/search_page.dart';

enum MainTab {
  feed,
  search,
  favorites,
}

extension MainTabExtension on MainTab {
  String get initialRoute {
    switch (this) {
      case MainTab.feed:
        return FeedPage.route;
      case MainTab.search:
        return SearchPage.route;
      case MainTab.favorites:
        return FavoritesPage.route;
    }
  }

  String get routeNavTabNestedKey {
    switch (this) {
      case MainTab.feed:
        return 'feedNavKey';
      case MainTab.search:
        return 'searchNavKey';
      case MainTab.favorites:
        return 'favoritesNavKey';
    }
  }
}
