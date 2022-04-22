import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koopy/components/login/login.dart';
import 'package:koopy/components/theme.dart';

class LoginBackground extends StatelessWidget {
  const LoginBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.find();

    return Obx(
      () => Column(
        children: [
          Stack(
            children: [
              AnimatedContainer(
                curve: Curves.easeOutCubic,
                duration: const Duration(milliseconds: 300),
                transform: Matrix4.translationValues(
                    loginController.topLeft[0], loginController.topLeft[1], 1),
                child: Stack(
                  children: [
                    Container(
                      height: 250,
                      width: 250,
                      transform: Matrix4.skewX(-0.35),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary.withOpacity(0.8),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10,
                              spreadRadius: 10)
                        ],
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    Transform(
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      transform: Matrix4.translationValues(20, 100, 1),
                    ),
                  ],
                ),
              ),
              AnimatedContainer(
                curve: Curves.easeOutCubic,
                duration: const Duration(milliseconds: 300),
                transform: Matrix4.translationValues(
                    loginController.topMiddle[0],
                    loginController.topMiddle[1],
                    1),
                child: Container(
                  height: 250,
                  width: 50,
                  transform: Matrix4.rotationZ(126.01),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.background.withAlpha(200),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          spreadRadius: 10)
                    ],
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              AnimatedContainer(
                curve: Curves.easeOutCubic,
                duration: const Duration(milliseconds: 300),
                transform: Matrix4.translationValues(
                    loginController.topRight[0],
                    loginController.topRight[1],
                    1),
                child: Stack(
                  children: [
                    Container(
                      height: 300,
                      width: 200,
                      transform: Matrix4.skewX(-0.35),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10,
                              spreadRadius: 10)
                        ],
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                    ),
                    Transform(
                      child: Image.asset(
                        'assets/images/logo/logo-white.png',
                        height: 70,
                      ),
                      transform: Matrix4.translationValues(-40, 180, 1),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
