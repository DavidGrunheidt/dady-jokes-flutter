import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/utils/global_bindings.dart';
import 'modules/splash_screen/splash_screen_page.dart';
import 'routes/pages.dart';

class App extends StatelessWidget {
  static final navigationKey = GlobalKey<NavigatorState>();

  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Dady Jokes',
      theme: ThemeData(primarySwatch: Colors.blue),
      getPages: getAppPages(),
      initialRoute: SplashScreenPage.route,
      initialBinding: GlobalBindings(),
    );
  }
}
