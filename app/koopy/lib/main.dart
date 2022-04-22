import 'package:flutter/material.dart';
import 'package:koopy/theme/theme.dart';
import 'components/splashscreen.dart';

String baseURL = "https://koopy.koscak.xyz/api/";

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const Scaffold(
        body: Splashscreen(),
      ),
    ),
  );
}
