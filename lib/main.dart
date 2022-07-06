import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'modules/splash_screen/splash_screen_page.dart';
import 'routes/pages.dart';

void main() {
  runApp(const DadyJokesApp());
}

class DadyJokesApp extends StatelessWidget {
  const DadyJokesApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Dady Jokes',
      theme: ThemeData(primarySwatch: Colors.blue),
      getPages: getAppPages(),
      initialRoute: SplashScreenPage.route,
    );
  }
}
