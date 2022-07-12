import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../main_app_page/main_app_page.dart';
import 'splash_screen_controller.dart';

class SplashScreenPage extends GetView<SplashScreenController> {
  static const route = '/splash_screen';

  SplashScreenPage({
    super.key,
  }) {
    void onIsVisitor() => WidgetsBinding.instance.addPostFrameCallback((_) => Get.offAllNamed(MainAppPage.route));
    void onIsUser() => WidgetsBinding.instance.addPostFrameCallback((_) => Get.offAllNamed(MainAppPage.route));

    if (!Get.isRegistered<SplashScreenController>()) {
      Get.put<SplashScreenController>(
        SplashScreenController(onIsVisitor: onIsVisitor, onIsUser: onIsUser),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset('assets/images/logo.png', width: 200),
            CircularProgressIndicator(color: Colors.blueGrey.withOpacity(0.4)),
          ],
        ),
      ),
    );
  }
}
