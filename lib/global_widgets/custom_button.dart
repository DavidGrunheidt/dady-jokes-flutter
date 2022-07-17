import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/values/custom_constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton._({
    required this.content,
    this.icon,
    this.onPressed,
    required this.fillColor,
    required this.borderColor,
    required this.textColor,
    this.visualDensity = VisualDensity.standard,
    this.expandable = false,
  });

  const CustomButton.primary({
    required String content,
    Icon? icon,
    void Function()? onPressed,
    bool expandable = false,
  }) : this._(
          content: content,
          icon: icon,
          onPressed: onPressed,
          fillColor: Colors.blue,
          borderColor: Colors.blue,
          textColor: Colors.white,
          expandable: expandable,
        );

  const CustomButton.secondary({
    required String content,
    Icon? icon,
    void Function()? onPressed,
    bool expandable = false,
  }) : this._(
          content: content,
          icon: icon,
          onPressed: onPressed,
          fillColor: Colors.white,
          borderColor: Colors.blue,
          textColor: Colors.blue,
          expandable: expandable,
        );

  const CustomButton.text({
    required String child,
    Icon? icon,
    void Function()? onPressed,
    Color? textColor,
  }) : this._(
          content: child,
          icon: icon,
          onPressed: onPressed,
          fillColor: Colors.transparent,
          borderColor: Colors.transparent,
          textColor: textColor ?? Colors.blue,
          visualDensity: VisualDensity.compact,
        );

  final Color fillColor;
  final Color borderColor;
  final Color textColor;
  final void Function()? onPressed;
  final String content;
  final Icon? icon;
  final VisualDensity visualDensity;
  final bool expandable;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      splashColor: Colors.white.withOpacity(0.2),
      fillColor: fillColor,
      elevation: 0,
      focusElevation: 0,
      highlightElevation: 0,
      constraints: const BoxConstraints(minWidth: 0, minHeight: 0),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: borderColor),
        borderRadius: BorderRadius.circular(kGlobalBorderRadius),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: expandable ? MainAxisSize.max : MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon!.icon, size: icon!.size, color: textColor),
            const SizedBox(width: 8),
          ],
          Text(content, style: Get.textTheme.button?.copyWith(color: textColor)),
        ],
      ),
    );
  }
}
