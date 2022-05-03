import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:koopy/components/global/Snackbar.dart';
import 'package:koopy/components/initial_setup/register/image/Image.dart' as i;
import 'package:koopy/components/theme.dart';
import 'package:password_strength/password_strength.dart';

class PasswordController extends GetxController {
  RxMap<String, double> animationOffsets = {
    "title": 500.0,
    "subtitle": 500.0,
    "input": 500.0,
    "input1": 500.0,
    "button": 500.0,
    "signIn": 500.0,
    "strength": 0.0,
  }.obs;
  RxDouble passwordStrength = 0.0.obs;
  RxString passwordStrengthString = "".obs;
  Rx<Color> strengthColor = light.error.obs;
  bool passwordOK = false;
  double strength = 0.0;

  TextEditingController password = TextEditingController();
  TextEditingController repeatedPass = TextEditingController();

  void next() async {
    if (password.text.isEmpty) {
      showSnackbar(title: "No password", message: "Please enter a password!");
      return;
    }

    if (strength < 0.3) {
      showSnackbar(title: "Too weak", message: "Password is too weak, please choose stronger one!");
      return;
    }

    comparePasswords(repeatedPass.text);

    if (!passwordOK) {
      showSnackbar(title: "No match", message: "Entered passwords do not match!");
      return;
    }

    animationOffsets["button"] = -500.0;
    await Future.delayed(Duration(milliseconds: 100));
    animationOffsets["input1"] = -500.0;
    await Future.delayed(Duration(milliseconds: 50));
    animationOffsets["strength"] = -500.0;
    await Future.delayed(Duration(milliseconds: 50));
    animationOffsets["input"] = -500.0;
    await Future.delayed(Duration(milliseconds: 50));
    animationOffsets["subtitle"] = -500.0;
    await Future.delayed(Duration(milliseconds: 100));
    animationOffsets["title"] = -500.0;
    await Future.delayed(Duration(milliseconds: 200));
    Get.to(() => i.Image());
  }

  void onChange(String password) {
    strength = estimatePasswordStrength(password);

    double maxWidth = MediaQuery.of(Get.context!).size.width - 44;
    passwordStrength.value = maxWidth * strength;

    if (strength < 0.3) {
      passwordStrengthString.value = "Really!?!";
      strengthColor.value = light.error;
    } else if (strength >= 0.3 && strength < 0.5) {
      passwordStrengthString.value = "I know you can do better!";
      strengthColor.value = light.secondary;
    } else if (strength >= 0.5 && strength < 0.8) {
      passwordStrengthString.value = "Just a little...";
      strengthColor.value = light.tertiary;
    } else {
      passwordStrengthString.value = "Respect.";
      strengthColor.value = light.primary;
    }
  }

  void comparePasswords(String repeat) {
    if (repeat != password.text) {
      passwordOK = false;
    } else if (!password.text.isEmpty) {
      if (strength >= 0.3) passwordOK = true;
    }
  }

  @override
  void onReady() async {
    animationOffsets["title"] = 0;
    await Future.delayed(Duration(milliseconds: 100));
    animationOffsets["subtitle"] = 0;
    await Future.delayed(Duration(milliseconds: 50));
    animationOffsets["input"] = 0;
    await Future.delayed(Duration(milliseconds: 50));
    animationOffsets["input1"] = 0;
    await Future.delayed(Duration(milliseconds: 100));
    animationOffsets["button"] = 0;

    super.onReady();
  }
}
