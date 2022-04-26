import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:koopy/components/register/name/Name.dart';
import 'package:koopy/components/register/password/Password.dart';
import 'package:koopy/main.dart';

class MailController extends GetxController {
  RxMap<String, double> animationOffsets = {
    "title": 500.0,
    "subtitle": 500.0,
    "input": 500.0,
    "button": 500.0,
    "signIn": 500.0
  }.obs;

  TextEditingController mail = TextEditingController();

  RxString mailError = "".obs;

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
      mailError.value = "Please enter valid email address!";
      return;
    }

    if (await existsMail()) {
      mailError.value = "User with that email already exists.";
      animationOffsets["signIn"] = 0;
    } else {
      next();
    }
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

  void clearErrors() {
    mailError.value = "";
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
