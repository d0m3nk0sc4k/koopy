import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koopy/components/initial_setup/login/LoginController.dart';
import 'package:koopy/components/theme.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginController c = Get.put(LoginController());

    return Obx(
      () => Scaffold(
        backgroundColor: Theme.of(Get.context!).colorScheme.background,
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
                  style: title,
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
                  style: TextStyle(color: Theme.of(Get.context!).colorScheme.primary),
                  cursorColor: Theme.of(Get.context!).colorScheme.primary,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "E-Mail",
                    labelStyle: TextStyle(color: Theme.of(Get.context!).colorScheme.primary),
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
                  style: TextStyle(color: Theme.of(Get.context!).colorScheme.primary),
                  cursorColor: Theme.of(Get.context!).colorScheme.primary,
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: TextStyle(color: Theme.of(Get.context!).colorScheme.primary),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 200),
                curve: Curves.easeInOutCubicEmphasized,
                transform:
                    Matrix4.translationValues(c.offsetUsername.value, 0, 0),
                child: Center(
                  child: ElevatedButton(
                    onPressed: c.login,
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      minimumSize: Size.fromHeight(50),
                    ),
                    child: Text(
                      "LOGIN",
                      style: TextStyle(
                        color: Theme.of(Get.context!).colorScheme.background,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
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
