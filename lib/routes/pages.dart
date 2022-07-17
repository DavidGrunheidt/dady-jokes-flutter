import 'package:get/get_navigation/src/routes/get_route.dart';

import '../modules/favorites/favorites_page.dart';
import '../modules/feed/feed_page.dart';
import '../modules/login/login_page.dart';
import '../modules/main_app/main_app_page.dart';
import '../modules/user/user_page.dart';

List<GetPage<void>> getAppPages() {
  return <GetPage<void>>[
    GetPage(name: LoginPage.route, page: LoginPage.new),
    GetPage(name: UserPage.route, page: () => const UserPage()),
    GetPage(
      name: MainAppPage.route,
      page: MainAppPage.new,
      children: [
        GetPage(name: FeedPage.route, page: FeedPage.new),
        GetPage(name: FavoritesPage.route, page: () => const FavoritesPage()),
      ],
    ),
  ];
}
