import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/routes.dart';
import 'splash_screen_controller.dart';

class SplashScreenPage extends GetView<SplashScreenController> {
  SplashScreenPage({
    super.key,
  }) {
    void onIsVisitor() => WidgetsBinding.instance.addPostFrameCallback((_) => Get.offAllNamed(Routes.login));
    void onIsUser() => WidgetsBinding.instance.addPostFrameCallback((_) => Get.offAllNamed(Routes.home));

    if (!Get.isRegistered<SplashScreenController>()) {
      Get.put<SplashScreenController>(
        SplashScreenController(onIsVisitor: onIsVisitor, onIsUser: onIsUser),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
