import 'package:flutter/material.dart';
import 'package:koopy/components/login/login.dart';
import 'package:koopy/theme/theme.dart';
import 'components/splashscreen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const Scaffold(
        body: LoginScreen(),
      ),
    ),
  );
}
