import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koopy/components/register/password/PasswordController.dart';
import 'package:koopy/components/theme.dart';

class Password extends StatelessWidget {
  const Password({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PasswordController c = Get.put(PasswordController());

    return Obx(
      () => Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(22.0),
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
                  style: TextStyle(color: light.primary),
                  cursorColor: light.primary,
                  onChanged: (value) {
                    c.onChange(value);
                  },
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
                duration: Duration(milliseconds: 200),
                curve: Curves.easeInOutCubic,
                height: 10,
                width: c.passwordStrength.value,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: c.strengthColor.value,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                c.passwordStrengthString.value,
                style: TextStyle(
                  color: c.strengthColor.value,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              AnimatedContainer(
                curve: Curves.easeInOutCubic,
                duration: Duration(milliseconds: 200),
                transform: Matrix4.translationValues(
                    c.animationOffsets["input1"]!, 0, 0),
                child: TextField(
                  obscureText: true,
                  controller: c.repeatPassword,
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
                      "NEXT",
                      style: TextStyle(
                        color: light.background,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(),
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 200),
                curve: Curves.easeInOutCubic,
                transform: Matrix4.translationValues(
                    c.animationOffsets["signIn"]!, 0, 0),
                child: TextButton(
                  onPressed: c.next,
                  child: Text(
                    "Want to sign in?",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
