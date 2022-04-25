import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:koopy/components/theme.dart';

void main() => runApp(
      GetMaterialApp(
        home: Scaffold(
          body: Center(
            child: Text("ADS"),
          ),
        ),
        theme: theme,
      ),
    );
