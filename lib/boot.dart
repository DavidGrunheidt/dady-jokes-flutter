import 'package:flutter/material.dart';

import 'app.dart';

Future<void> boot() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const App());
}
