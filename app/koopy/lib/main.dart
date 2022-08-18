import 'dart:io';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:koopy/components/initial_setup/register/family/Family.dart';
import 'package:koopy/components/splashscreen/Splashscreen.dart';
import 'package:koopy/components/theme.dart';
import 'package:get_storage/get_storage.dart';

String baseUrl = "https://koopy.koscak.xyz/api/";

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  await GetStorage.init();
  Get.config(
    defaultTransition: Transition.fadeIn,
  );
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: AddFamily(), //Splash(),
      theme: themeLight,
      //darkTheme: themeDark,
    ),
  );
}
