import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koopy/components/Home.dart';
import 'package:koopy/components/login/LoginDecoration.dart';
import 'package:koopy/components/login/loginForm.dart';

class LoginController extends GetxController {
  RxList<double> topLeft = <double>[100, -300].obs;
  RxList<double> topMiddle = <double>[335, -300].obs;
  RxList<double> topRight = <double>[370, -400].obs;
  void loadScreen() async {
    topLeft.value = [1, -20];
    await Future.delayed(const Duration(milliseconds: 150));
    topMiddle.value = [235, -50];
    await Future.delayed(const Duration(milliseconds: 100));
    topRight.value = [270, -20];
    await Future.delayed(const Duration(milliseconds: 300));
    emailField.value = [1, 1];
    await Future.delayed(const Duration(milliseconds: 100));
    nextButton.value = [1, 1];
    await Future.delayed(const Duration(milliseconds: 50));
    registerButton.value = [1, 1];
  }

  void unloadScreen() async {
    registerButton.value = [50, 0];
    await Future.delayed(const Duration(milliseconds: 50));
    nextButton.value = [50, 0];
    await Future.delayed(const Duration(milliseconds: 50));
    emailField.value = [50, 0];
    await Future.delayed(const Duration(milliseconds: 100));
    topRight.value = [370, -400];
    await Future.delayed(const Duration(milliseconds: 50));
    topMiddle.value = [335, -300];
    await Future.delayed(const Duration(milliseconds: 100));
    topLeft.value = [100, -300];
    await Future.delayed(const Duration(milliseconds: 200));
    Get.to(const Home(), transition: Transition.fadeIn);
  }

  TextEditingController email = TextEditingController();
  RxList<double> emailField = <double>[50, 0].obs;
  RxList<double> nextButton = <double>[50, 0].obs;
  RxList<double> registerButton = <double>[50, 0].obs;

  @override
  void onReady() async {
    loadScreen();
    super.onReady();
  }
}

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.put(LoginController());

    return Scaffold(
      body: Stack(
        children: [LoginBackground(), LoginForm()],
      ),
    );
  }
}
