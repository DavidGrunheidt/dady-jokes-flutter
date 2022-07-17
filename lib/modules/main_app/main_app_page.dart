import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/main_tab.dart';
import '../../routes/routes.dart';
import 'main_app_controller.dart';
import 'models/nav_tab_destinations.dart';

class MainAppPage extends GetView<MainAppController> {
  static const route = '/main_app';

  final _navTabs = <NavTabDestination>[
    NavTabDestination(
      label: 'Feed',
      icon: const Icon(Icons.feed_outlined),
      tab: MainTab.feed,
      navigatorKey: Get.nestedKey(MainTab.feed.routeNavTabNestedKey)!,
    ),
    NavTabDestination(
      label: 'Favorites',
      icon: const Icon(Icons.favorite_outline),
      tab: MainTab.favorites,
      navigatorKey: Get.nestedKey(MainTab.favorites.routeNavTabNestedKey)!,
    ),
  ];

  MainAppPage({
    super.key,
  }) {
    if (!Get.isRegistered<MainAppController>()) {
      Get.put<MainAppController>(MainAppController(tabsLength: _navTabs.length));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: controller.tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: _navTabs.map((navTab) {
          return Navigator(
            key: navTab.navigatorKey,
            initialRoute: navTab.tab.initialRoute,
            onGenerateRoute: onGenerateTabsRoute,
          );
        }).toList(),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          items: _navTabs.map((tab) => BottomNavigationBarItem(icon: tab.icon, label: tab.label)).toList(),
          currentIndex: controller.bottomNavSelectedIndex.value,
          onTap: controller.onTabNavTap,
        ),
      ),
    );
  }
}
