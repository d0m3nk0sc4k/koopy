import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:koopy/components/global/Snackbar.dart';
import 'package:koopy/components/initial_setup/login/Login.dart';
import 'package:koopy/components/initial_setup/register/name/Name.dart';
import 'package:koopy/components/theme.dart';
import 'package:koopy/main.dart';

class MailController extends GetxController {
  RxMap<String, double> animationOffsets = {
    "title": 500.0,
    "subtitle": 500.0,
    "input": 500.0,
    "button": 500.0,
  }.obs;

  TextEditingController mail = TextEditingController();

  bool validMail() {
    RegExp regex = RegExp(
      r"[a-zA-Z0-9.! #$%&'*+/=? ^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]{2,3})",
    );

    return regex.hasMatch(mail.text);
  }

  Future<bool> existsMail() async {
    return await http
        .get(Uri.parse(baseUrl + "user/check/" + mail.text))
        .then((value) => (value.statusCode == 400));
  }

  void checkMail() async {
    if (!validMail()) {
      showSnackbar(
          title: "Invalid mail",
          message: "Please enter valid mail in format: name@example.com");
      return;
    }

    if (await existsMail()) {
      showSnackbar(
        title: "Existing user",
        message: "User with that email already exists. Want to sign in?",
        color: light.secondary,
        onTap: toLogin,
      );
      animationOffsets["signIn"] = 0;
    } else {
      next();
    }
  }

  void toLogin() async {
    Get.closeAllSnackbars();
    animationOffsets["button"] = -500.0;
    await Future.delayed(Duration(milliseconds: 100));
    animationOffsets["input"] = -500.0;
    await Future.delayed(Duration(milliseconds: 50));
    animationOffsets["subtitle"] = -500.0;
    await Future.delayed(Duration(milliseconds: 100));
    animationOffsets["title"] = -500.0;
    await Future.delayed(Duration(milliseconds: 200));
    Get.to(() => Login());
  }

  void next() async {
    animationOffsets["button"] = -500.0;
    await Future.delayed(Duration(milliseconds: 100));
    animationOffsets["input"] = -500.0;
    await Future.delayed(Duration(milliseconds: 50));
    animationOffsets["subtitle"] = -500.0;
    await Future.delayed(Duration(milliseconds: 100));
    animationOffsets["title"] = -500.0;
    await Future.delayed(Duration(milliseconds: 200));
    Get.to(() => Name());
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