import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koopy/components/theme.dart';

void showSnackbar(
    {required String title, required String message, color, onTap}) {
  Get.snackbar(title, message,
      backgroundColor:
          (color == null || color.runtimeType != Color) ? error : color,
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 14),
      colorText: Theme.of(Get.context!).colorScheme.background,
      animationDuration: Duration(milliseconds: 200), onTap: (_) {
    if (onTap != null) {
      onTap();
    } else {
      return;
    }
  });
}
