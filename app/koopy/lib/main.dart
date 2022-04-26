import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:koopy/components/splashscreen/Splashscreen.dart';
import 'package:koopy/components/theme.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(
    GetMaterialApp(
      home: Scaffold(
        body: Splash(),
      ),
      theme: theme,
    ),
  );
}
