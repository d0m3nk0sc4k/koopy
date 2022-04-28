import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:koopy/components/initial_setup/register/password/Password.dart';

class NameController extends GetxController {
  RxMap<String, double> animationOffsets = {"title": 500.0, "subtitle": 500.0, "input": 500.0, "button": 500.0, "signIn": 500.0}.obs;

  TextEditingController name = TextEditingController();

  void next() async {
    animationOffsets["button"] = -500.0;
    await Future.delayed(Duration(milliseconds: 100));
    animationOffsets["input"] = -500.0;
    await Future.delayed(Duration(milliseconds: 50));
    animationOffsets["subtitle"] = -500.0;
    await Future.delayed(Duration(milliseconds: 100));
    animationOffsets["title"] = -500.0;
    await Future.delayed(Duration(milliseconds: 200));
    Get.to(() => Password());
  }

  @override
  void onReady() async {
    animationOffsets["title"] = 0;
    await Future.delayed(Duration(milliseconds: 100));
    animationOffsets["subtitle"] = 0;
    await Future.delayed(Duration(milliseconds: 50));
    animationOffsets["input"] = 0;
    await Future.delayed(Duration(milliseconds: 100));
    animationOffsets["button"] = 0;

    super.onReady();
  }
}