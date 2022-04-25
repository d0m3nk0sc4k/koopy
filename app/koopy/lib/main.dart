import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:koopy/components/login/Login.dart';
import 'package:koopy/components/splashscreen/Splashscreen.dart';
import 'package:koopy/components/theme.dart';

void main() => runApp(
      GetMaterialApp(
        home: Scaffold(
          body: Splash(),
        ),
        theme: theme,
      ),
    );
