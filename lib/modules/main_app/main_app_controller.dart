import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/utils/base_getx_controller.dart';

class MainAppController extends BaseGetxController with GetSingleTickerProviderStateMixin {
  MainAppController({
    required this.tabsLength,
  });

  final int tabsLength;
  late final TabController tabController = TabController(vsync: this, length: tabsLength);

  final RxInt bottomNavSelectedIndex = 0.obs;

  void onTabNavTap(int index) {
    bottomNavSelectedIndex.value = index;
    tabController.index = index;
  }
}
