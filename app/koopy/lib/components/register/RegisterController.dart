import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:koopy/components/login/Login.dart';
import 'package:koopy/components/functions/registration.dart' as fun;

class RegisterController extends GetxController {
  RxMap<String, double> animationOffsetsMail = {"title": 500.0, "subtitle": 500.0, "input": 500.0, "button": 500.0, "signIn": 500.0}.obs;

  TextEditingController mail = TextEditingController();

  RxString mailError = "".obs;

  void checkMail(Widget whereTo) async {
    RegExp regex = RegExp(r"[a-zA-Z0-9.! #$%&'*+/=? ^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]{2,3})");

    if (!regex.hasMatch(mail.text)) {
      mailError.value = "Please enter valid email address.";
      return;
    }

    int status = await fun.checkMail(mail.text);
    if (status == 0) {
      mailError.value = "User with that email already exists.";
      animationOffsetsMail["signIn"] = 0;
    } else {
      await flyOffMail();
      Get.to(() => whereTo, transition: Transition.fadeIn);
    }
  }

  Future flyOffMail() async {
    animationOffsetsMail["button"] = -500.0;
    await Future.delayed(Duration(milliseconds: 100));
    animationOffsetsMail["input"] = -500.0;
    await Future.delayed(Duration(milliseconds: 50));
    animationOffsetsMail["subtitle"] = -500.0;
    await Future.delayed(Duration(milliseconds: 100));
    animationOffsetsMail["title"] = -500.0;
    await Future.delayed(Duration(milliseconds: 200));
  }

  void login() async {
    await flyOffMail();
    Get.off(() => new Login(), transition: Transition.fadeIn);
  }

  void clearErrors() {
    mailError.value = "";
  }

  @override
  void onReady() async {
    animationOffsetsMail["title"] = 0;
    await Future.delayed(Duration(milliseconds: 100));
    animationOffsetsMail["subtitle"] = 0;
    await Future.delayed(Duration(milliseconds: 50));
    animationOffsetsMail["input"] = 0;
    await Future.delayed(Duration(milliseconds: 100));
    animationOffsetsMail["button"] = 0;

    super.onReady();
  }
}