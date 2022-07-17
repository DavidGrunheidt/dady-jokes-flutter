import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/values/custom_constants.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.label,
    this.validator,
  });

  final String label;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(kGlobalBorderRadius)),
        label: Text(label, style: Get.textTheme.bodyText2),
      ),
      validator: validator,
    );
  }
}
