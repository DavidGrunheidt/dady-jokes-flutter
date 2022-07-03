import 'package:get/get_navigation/src/routes/get_route.dart';

import '../modules/home/home_page.dart';
import '../modules/splash_screen/splash_screen_page.dart';
import 'routes.dart';

final _splashPage = GetPage(name: Routes.splashScreen, page: SplashScreenPage.new);
final _loginPage = GetPage(name: Routes.login, page: () => const HomePage(title: 'Oi'));
final _userPage = GetPage(name: Routes.user, page: () => const HomePage(title: 'Oi'));

final _homePage = GetPage(name: Routes.home, page: () => const HomePage(title: 'Oi'));
final _searchPage = GetPage(name: Routes.search, page: () => const HomePage(title: 'Oi'));
final _favoritesPage = GetPage(name: Routes.favorites, page: () => const HomePage(title: 'Oi'));

List<GetPage<void>> getAppPages() {
  return <GetPage<void>>[
    _splashPage,
    _loginPage,
    _userPage,
    _homePage,
    _searchPage,
    _favoritesPage,
  ];
}
