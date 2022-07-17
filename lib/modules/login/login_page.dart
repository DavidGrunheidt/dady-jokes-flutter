import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/utils/validator.dart';
import '../../global_widgets/custom_button.dart';
import '../../global_widgets/custom_text_form_field.dart';
import 'login_controller.dart';

class LoginPage extends GetView<LoginController> {
  static const route = '/login';

  LoginPage({
    super.key,
  }) {
    if (!Get.isRegistered<LoginController>()) {
      Get.put<LoginController>(LoginController());
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Login')),
        body: Container(
          padding: const EdgeInsets.all(18).copyWith(top: 48),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/logo.png', width: Get.width / 3),
                const SizedBox(height: 12),
                Text('Login to save, share and like some jokes', style: Get.textTheme.bodyText1),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        CustomTextFormField(
                          label: 'Email',
                          validator: (value) {
                            FocusScope.of(context).unfocus();
                            return validateEmail(value);
                          },
                        ),
                        const SizedBox(height: 12),
                        CustomTextFormField(
                          label: 'Password',
                          validator: (value) {
                            FocusScope.of(context).unfocus();
                            return validatePassword(value);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                CustomButton.primary(
                  content: 'Login',
                  icon: const Icon(Icons.login_outlined, color: Colors.white),
                  expandable: true,
                  onPressed: controller.onLoginPressed,
                ),
                const SizedBox(height: 12),
                CustomButton.secondary(
                  content: 'Sign up',
                  icon: const Icon(Icons.app_registration_outlined, color: Colors.white),
                  expandable: true,
                  onPressed: controller.onSignupPressed,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
