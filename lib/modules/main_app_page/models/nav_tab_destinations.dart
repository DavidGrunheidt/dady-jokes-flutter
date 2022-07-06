import 'package:flutter/widgets.dart';

import '../../../routes/main_tab.dart';

class NavTabDestination {
  final Widget icon;
  final String label;
  final GlobalKey<NavigatorState> navigatorKey;
  final MainTab tab;

  NavTabDestination({
    required this.icon,
    required this.label,
    required this.navigatorKey,
    required this.tab,
  });
}
