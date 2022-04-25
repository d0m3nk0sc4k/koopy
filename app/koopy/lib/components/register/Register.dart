import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koopy/components/login/Login.dart';
import 'package:koopy/components/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterController extends GetxController {
  RxDouble offsetTitle = 500.0.obs;
  RxDouble offsetUsername = 500.0.obs;
  RxDouble offsetPassword = 500.0.obs;
  RxDouble offsetButtons = 500.0.obs;

  TextEditingController username = TextEditingController();

  void login() async {
    offsetButtons.value = -500.0;
    await Future.delayed(Duration(milliseconds: 100));
    offsetPassword.value = -500.0;
    await Future.delayed(Duration(milliseconds: 50));
    offsetUsername.value = -500.0;
    await Future.delayed(Duration(milliseconds: 100));
    offsetTitle.value = -500.0;

    Get.off(() => new Login(), transition: Transition.fadeIn);
  }

  @override
  void onReady() async {
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

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RegisterController c = Get.put(RegisterController());
    try {
      LoginController rc = Get.find();
      c.username.value = rc.username.value;
    } catch (e) {}

    return Obx(
      () => Scaffold(
        backgroundColor: light.background,
        body: Padding(
          padding: EdgeInsets.all(22.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: SizedBox(),
              ),
              AnimatedContainer(
                curve: Curves.easeInOutCubic,
                duration: Duration(milliseconds: 200),
                transform: Matrix4.translationValues(c.offsetTitle.value, 0, 0),
                child: Text(
                  "Welcome!\nWe are glad you are joining us!",
                  style: GoogleFonts.nunito(textStyle: title),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              AnimatedContainer(
                curve: Curves.easeInOutCubic,
                duration: Duration(milliseconds: 200),
                transform:
                    Matrix4.translationValues(c.offsetUsername.value, 0, 0),
                child: TextField(
                  style: TextStyle(color: light.primary),
                  cursorColor: light.primary,
                  decoration: InputDecoration(
                    labelText: "Your name",
                    labelStyle: TextStyle(color: light.primary),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              AnimatedContainer(
                curve: Curves.easeInOutCubic,
                duration: Duration(milliseconds: 200),
                transform:
                    Matrix4.translationValues(c.offsetUsername.value, 0, 0),
                child: TextField(
                  controller: c.username,
                  style: TextStyle(color: light.primary),
                  cursorColor: light.primary,
                  decoration: InputDecoration(
                    labelText: "E-Mail",
                    labelStyle: TextStyle(color: light.primary),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              AnimatedContainer(
                curve: Curves.easeInOutCubic,
                duration: Duration(milliseconds: 200),
                transform:
                    Matrix4.translationValues(c.offsetPassword.value, 0, 0),
                child: TextField(
                  obscureText: true,
                  style: TextStyle(color: light.primary),
                  cursorColor: light.primary,
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: TextStyle(color: light.primary),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              AnimatedContainer(
                curve: Curves.easeInOutCubic,
                duration: Duration(milliseconds: 200),
                transform:
                    Matrix4.translationValues(c.offsetPassword.value, 0, 0),
                child: TextField(
                  obscureText: true,
                  style: TextStyle(color: light.primary),
                  cursorColor: light.primary,
                  decoration: InputDecoration(
                    labelText: "Repeat password",
                    labelStyle: TextStyle(color: light.primary),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              AnimatedContainer(
                curve: Curves.easeInOutCubic,
                duration: Duration(milliseconds: 200),
                transform:
                    Matrix4.translationValues(c.offsetUsername.value, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: c.login,
                      child: Text(
                        "Sign In",
                        style: subtitle,
                      ),
                    ),
                    Ink(
                      decoration: const ShapeDecoration(
                        shape: CircleBorder(),
                        color: Color(0xFF4472CA),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.navigate_next,
                            color: light.background,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
