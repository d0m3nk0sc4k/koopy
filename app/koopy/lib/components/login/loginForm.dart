import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koopy/components/login/login.dart';
import 'package:koopy/components/theme.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.find();

    return Obx(
      () => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(),
          ),
          const SizedBox(
            height: 150,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOutCubic,
                transform: Matrix4.translationValues(
                    1, loginController.emailField[0], 1),
                child: AnimatedOpacity(
                  opacity: loginController.emailField[1],
                  duration: const Duration(milliseconds: 200),
                  child: TextField(
                    controller: loginController.email,
                    cursorColor: theme.colorScheme.primary,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: theme.colorScheme.primary,
                    ),
                    decoration: InputDecoration(
                      isDense: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      hintText: "E-mail address",
                      hintStyle: TextStyle(
                        color: theme.colorScheme.primary.withAlpha(150),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOutCubic,
            transform:
                Matrix4.translationValues(1, loginController.nextButton[0], 1),
            child: AnimatedOpacity(
              opacity: loginController.nextButton[1],
              duration: const Duration(milliseconds: 200),
              child: ElevatedButton(
                onPressed: () {},
                child: const Padding(
                  child: Text(
                    "NEXT",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                ),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOutCubic,
            transform: Matrix4.translationValues(
                1, loginController.registerButton[0], 1),
            child: AnimatedOpacity(
              opacity: loginController.registerButton[1],
              duration: const Duration(milliseconds: 200),
              child: TextButton(
                onPressed: loginController.unloadScreen,
                child: const Padding(
                  child: Text(
                    "REGISTER",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                ),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
