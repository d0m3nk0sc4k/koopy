import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koopy/components/initial_setup/register/password/PasswordController.dart';
import 'package:koopy/components/theme.dart';

class Password extends StatelessWidget {
  const Password({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PasswordController c = Get.put(PasswordController());

    return Obx(
      () => Scaffold(
        body: Padding(
          padding: EdgeInsets.all(22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SizedBox(),
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 200),
                curve: Curves.easeInOutCubicEmphasized,
                transform: Matrix4.translationValues(
                    c.animationOffsets["title"]!, 0, 0),
                child: Text(
                  "Let's secure your account!",
                  style: title,
                ),
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 200),
                curve: Curves.easeInOutCubicEmphasized,
                transform: Matrix4.translationValues(
                    c.animationOffsets["subtitle"]!, 0, 0),
                child: Text(
                  "Choose a strong password",
                  style: subtitle,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              AnimatedContainer(
                curve: Curves.easeInOutCubic,
                duration: Duration(milliseconds: 200),
                transform: Matrix4.translationValues(
                    c.animationOffsets["input"]!, 0, 0),
                child: TextField(
                  obscureText: true,
                  controller: c.password,
                  style: TextStyle(
                      color: Theme.of(Get.context!).colorScheme.primary),
                  cursorColor: Theme.of(Get.context!).colorScheme.primary,
                  onChanged: (value) {
                    c.onChange(value);
                  },
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: TextStyle(
                        color: Theme.of(Get.context!).colorScheme.primary),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 200),
                curve: Curves.easeInOutCubic,
                height: 10,
                width: c.passwordStrength.value,
                transform: Matrix4.translationValues(
                    c.animationOffsets['strength']!, 0, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: c.strengthColor.value,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 200),
                transform: Matrix4.translationValues(
                    c.animationOffsets['strength']!, 0, 0),
                child: Text(
                  c.passwordStrengthString.value,
                  style: TextStyle(
                    color: c.strengthColor.value,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              AnimatedContainer(
                curve: Curves.easeInOutCubic,
                duration: Duration(milliseconds: 200),
                transform: Matrix4.translationValues(
                    c.animationOffsets["input1"]!, 0, 0),
                child: TextField(
                  obscureText: true,
                  style: TextStyle(
                      color: Theme.of(Get.context!).colorScheme.primary),
                  cursorColor: Theme.of(Get.context!).colorScheme.primary,
                  controller: c.repeatedPass,
                  decoration: InputDecoration(
                    labelText: "Repeat password",
                    labelStyle: TextStyle(
                      color: Theme.of(Get.context!).colorScheme.primary,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 200),
                curve: Curves.easeInOutCubicEmphasized,
                transform: Matrix4.translationValues(
                    c.animationOffsets["button"]!, 0, 0),
                child: Center(
                  child: ElevatedButton(
                    onPressed: c.next,
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      minimumSize: Size.fromHeight(50),
                    ),
                    child: Text(
                      "CREATE ACCOUNT",
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
