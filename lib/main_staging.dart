import 'package:flutter/material.dart';
import 'app.dart';
import 'flavors.dart';

void main() {
  appFlavor = Flavor.STAGING;
  runApp(const App());
}
