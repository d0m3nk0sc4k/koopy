import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

ColorScheme light = ColorScheme(
  primary: Color(0xFF5570FF),
  onPrimary: Color(0xFFF9F9F9),
  secondary: Color(0xFFF9F9F9),
  onSecondary: Color(0xFF19171A),
  background: Color(0xFFF9F9F9),
  onBackground: Color(0xFF19171A),
  surface: Color(0xFF19171A),
  onSurface: Color(0xFFF9F9F9),
  error: Color(0xFFFF3333),
  onError: Color(0xFFF9F9F9),
  brightness: Brightness.light,
);

ColorScheme dark = ColorScheme(
  primary: Color(0xFF5570FF),
  onPrimary: Color(0xFFF9F9F9),
  secondary: Color(0xFFF9F9F9),
  onSecondary: Color(0xFF19171A),
  onBackground: Color(0xFFF9F9F9),
  background: Color(0xFF19171A),
  onSurface: Color(0xFF19171A),
  surface: Color(0xFFF9F9F9),
  error: Color(0xFFFF3333),
  onError: Color(0xFFF9F9F9),
  brightness: Brightness.dark,
);

Color success = Color(0xFF5AB53B);
Color warning = Color(0xFFF2C500);
Color error = Color(0xFFFF3333);

ThemeData themeLight = ThemeData(
  brightness: Brightness.light,
  colorScheme: light,
  backgroundColor: light.primary,
  scaffoldBackgroundColor: light.background,
  textTheme: GoogleFonts.nunitoTextTheme(),
  inputDecorationTheme: InputDecorationTheme(
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: light.primary,
      ),
    ),
  ),
);

ThemeData themeDark = ThemeData(
  brightness: Brightness.dark,
  colorScheme: dark,
  backgroundColor: dark.primary,
  scaffoldBackgroundColor: dark.background,
  textTheme: GoogleFonts.nunitoTextTheme(),
  inputDecorationTheme: InputDecorationTheme(
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: dark.primary,
      ),
    ),
  ),
);

TextStyle title = TextStyle(
  color: Theme.of(Get.context!).colorScheme.primary,
  fontSize: 38.0,
  fontWeight: FontWeight.w800,
);

TextStyle subtitle = TextStyle(
  color: Theme.of(Get.context!).colorScheme.onBackground,
  fontSize: 20.0,
  fontWeight: FontWeight.w900,
);
