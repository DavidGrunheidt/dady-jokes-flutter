import 'package:flutter/material.dart';

void showSnackbar({
  required BuildContext context,
  required String content,
}) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(content)),
  );
}
