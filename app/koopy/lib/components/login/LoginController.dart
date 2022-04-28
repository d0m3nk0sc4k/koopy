import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koopy/components/functions/EncryptPassword.dart';
import 'package:koopy/components/functions/login.dart' as fun;
import 'package:koopy/components/global/Snackbar.dart';
import 'package:koopy/components/home/Home.dart';
import 'package:koopy/components/register/mail/MailController.dart';

class LoginController extends GetxController {
  MailController mc = Get.find();

  RxDouble offsetTitle = 500.0.obs;
  RxDouble offsetUsername = 500.0.obs;
  RxDouble offsetPassword = 500.0.obs;
  RxDouble offsetButtons = 500.0.obs;

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  void login() async {
    RegExp regex = RegExp(
        r"[a-zA-Z0-9.! #$%&'*+/=? ^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]{2,3})");

    if (username.text.isEmpty || !regex.hasMatch(username.value.text)) {
      showSnackbar(
          title: "Invalid mail",
          message: "Please enter valid mail in format: name@example.com");
      return;
    }

    var status =
        await fun.login(username.text, encryptPassword(password.value.text));

    if (status.isEmpty) {
      offsetButtons.value = -500;
      await Future.delayed(Duration(milliseconds: 100));
      offsetPassword.value = -500;
      await Future.delayed(Duration(milliseconds: 50));
      offsetUsername.value = -500;

      await Future.delayed(Duration(milliseconds: 100));
      offsetTitle.value = -500;

      Get.off(() => Home());
    } else if (status['statusCode'] == 400) {
      showSnackbar(
          title: "No user",
          message:
              "No user was found with that email address. Please try again.");
    } else if (status['statusCode'] == 403) {
      showSnackbar(
          title: "Wrong password",
          message: "Password entered is wrong. Please try again.");
    } else {
      showSnackbar(
          title: "Error", message: "Something went wrong! Please try again.");
    }
  }

  @override
  void onReady() async {
    username.text = mc.mail.text;
    offsetTitle.value = 0;
    await Future.delayed(Duration(milliseconds: 100));
    offsetUsername.value = 0;
    await Future.delayed(Duration(milliseconds: 50));
    offsetPassword.value = 0;
    await Future.delayed(Duration(milliseconds: 100));
    offsetButtons.value = 0;

    super.onReady();
  }
}
