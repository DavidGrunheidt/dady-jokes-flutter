import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app.dart';

// TODO(DavidGrunheidt): Replace path by each env option class
import 'firebase_options_dev.dart' as dev_fire_opt;
import 'firebase_options_dev.dart' as qa_fire_opt;
import 'firebase_options_dev.dart' as stg_fire_opt;
import 'firebase_options_dev.dart' as prod_fire_opt;

import 'flavors.dart';

Future<void> boot() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: _getFirebaseOptions());

  runApp(const App());
}

FirebaseOptions _getFirebaseOptions() {
  switch (appFlavor) {
    case Flavor.DEV:
      return dev_fire_opt.DefaultFirebaseOptions.currentPlatform;
    case Flavor.QA:
      return qa_fire_opt.DefaultFirebaseOptions.currentPlatform;
    case Flavor.STAGING:
      return stg_fire_opt.DefaultFirebaseOptions.currentPlatform;
    case Flavor.PROD:
      return prod_fire_opt.DefaultFirebaseOptions.currentPlatform;
  }
}
