import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koopy/components/register/Register.dart';
import 'package:koopy/components/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginController extends GetxController {
  RxDouble offsetTitle = 500.0.obs;
  RxDouble offsetUsername = 500.0.obs;
  RxDouble offsetPassword = 500.0.obs;
  RxDouble offsetButtons = 500.0.obs;

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  void register() async {
    offsetButtons.value = -500.0;
    await Future.delayed(Duration(milliseconds: 100));
    offsetPassword.value = -500.0;
    await Future.delayed(Duration(milliseconds: 50));
    offsetUsername.value = -500.0;
    await Future.delayed(Duration(milliseconds: 100));
    offsetTitle.value = -500.0;

    Get.off(() => new Register(), transition: Transition.fadeIn);
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

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginController c = Get.put(LoginController());
    RegisterController rc = Get.find();

    c.username.value = rc.username.value;

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
                  "Great to see you again!",
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
                  controller: c.password,
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
                      onPressed: c.register,
                      child: Text(
                        "Sign Up",
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
