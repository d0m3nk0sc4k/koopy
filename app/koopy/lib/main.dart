import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:koopy/components/Home.dart';
import 'package:koopy/components/login/login.dart';
import 'package:koopy/components/theme.dart';

void main() => runApp(
      GetMaterialApp(
        home: const Login(),
        theme: theme,
      ),
    );
