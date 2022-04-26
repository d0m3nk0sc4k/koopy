import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:koopy/components/splashscreen/Splashscreen.dart';
import 'package:koopy/components/theme.dart';
import 'package:get_storage/get_storage.dart';

String baseUrl = "https://koopy.koscak.xyz/api/";

void main() async {
  await GetStorage.init();
  Get.config(
    defaultTransition: Transition.fadeIn,
  );
  runApp(
    GetMaterialApp(
      home: Splash(),
      theme: theme,
    ),
  );
}
