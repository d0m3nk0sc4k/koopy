import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koopy/components/theme.dart';

void showSnackbar({required String title, required String message, color, onTap}) {
  Get.snackbar(
        title,
        message,
        backgroundColor: (color == null || color.runtimeType != Color) ? light.error : color,
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 14),
        colorText: light.onError,
        animationDuration: Duration(milliseconds: 200),
        onTap: (_) {onTap();}
      );
}