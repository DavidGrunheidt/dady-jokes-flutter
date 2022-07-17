import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/utils/global_bindings.dart';
import 'modules/main_app/main_app_page.dart';
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
      initialRoute: MainAppPage.route,
      initialBinding: GlobalBindings(),
    );
  }
}
