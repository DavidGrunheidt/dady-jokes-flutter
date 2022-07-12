import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../modules/favorites/favorites_page.dart';
import '../modules/feed/feed_page.dart';

GetPageRoute<dynamic> onGenerateTabsRoute(RouteSettings settings) {
  switch (settings.name) {
    case FeedPage.route:
      return GetPageRoute(settings: settings, page: FeedPage.new);
    case FavoritesPage.route:
      return GetPageRoute(settings: settings, page: () => const FavoritesPage());
  }

  return GetPageRoute(settings: settings, page: () => const SizedBox());
}
