import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/login/login_form.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final Rx<LoginForm> form = const LoginForm.empty().obs;

  Future<void> onLoginPressed() async {
    if (!formKey.currentState!.validate()) return;
  }

  Future<void> onSignupPressed() async {
    if (!formKey.currentState!.validate()) return;
  }
}
