import 'package:flutter/material.dart';

ColorScheme light = ColorScheme(
    primary: Color(0xFF4472CA),
    onPrimary: Color(0xFFa0cdff),
    secondary: Color(0xFFF86624),
    onSecondary: Color(0xFFFFB694),
    background: Color(0xFFfefcfb),
    onBackground: Color(0xFF2E2C2F),
    surface: Color(0xFFFEFCFB),
    onSurface: Color(0xFF2E2C2F),
    error: Color(0xFFF15152),
    onError: Color(0xFFFEFCFB),
    brightness: Brightness.light
  );

ThemeData theme = ThemeData(
  brightness: Brightness.light,
  colorScheme: light,
);