import 'package:flutter/material.dart';

import '../main_app/main_app_page.dart';

class FavoritesPage extends StatelessWidget {
  static const route = '${MainAppPage.route}/favorites';

  const FavoritesPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Favorites'),
          automaticallyImplyLeading: false,
        ),
        body: Container(),
      ),
    );
  }
}
