import 'package:flutter/material.dart';

import 'modules/home/home_page.dart';

void main() {
  runApp(const DadyJokesApp());
}

class DadyJokesApp extends StatelessWidget {
  const DadyJokesApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
