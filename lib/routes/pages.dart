import 'package:get/get_navigation/src/routes/get_route.dart';

import '../modules/favorites/favorites_page.dart';
import '../modules/feed/feed_page.dart';
import '../modules/login/login_page.dart';
import '../modules/main_app_page/main_app_page.dart';
import '../modules/search/search_page.dart';
import '../modules/splash_screen/splash_screen_page.dart';
import '../modules/user/user_page.dart';

List<GetPage<void>> getAppPages() {
  return <GetPage<void>>[
    GetPage(name: SplashScreenPage.route, page: SplashScreenPage.new),
    GetPage(name: LoginPage.route, page: () => const LoginPage()),
    GetPage(name: UserPage.route, page: () => const UserPage()),
    GetPage(
      name: MainAppPage.route,
      page: MainAppPage.new,
      children: [
        GetPage(name: FeedPage.route, page: () => const FeedPage()),
        GetPage(name: SearchPage.route, page: () => const SearchPage()),
        GetPage(name: FavoritesPage.route, page: () => const FavoritesPage()),
      ],
    ),
  ];
}
