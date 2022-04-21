import 'package:flutter/material.dart';
import 'package:koopy/theme/theme.dart';

class LoginBackscreen extends StatefulWidget {
  const LoginBackscreen({Key? key}) : super(key: key);

  @override
  State<LoginBackscreen> createState() => _LoginBackscreenState();
}

class _LoginBackscreenState extends State<LoginBackscreen> {
  static double offset1 = -300;
  static double offset2 = 100;
  static double offset3 = -300;
  static double offset4 = 335;
  static double offset5 = -300;
  static double offset6 = 370;

  void loadContainers() async {
    setState(() {
      offset1 = -20;
      offset2 = 1;
    });
    await Future.delayed(const Duration(milliseconds: 150));
    setState(() {
      offset3 = -50;
      offset4 = 235;
    });
    await Future.delayed(const Duration(milliseconds: 100));
    setState(() {
      offset5 = -20;
      offset6 = 270;
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      loadContainers();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedContainer(
          curve: Curves.easeOutCubic,
          duration: const Duration(milliseconds: 300),
          transform: Matrix4.translationValues(offset2, offset1, 1),
          child: Stack(
            children: [
              Container(
                height: 250,
                width: 250,
                transform: Matrix4.skewX(-0.35),
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black26, blurRadius: 10, spreadRadius: 10)
                  ],
                  borderRadius: BorderRadius.circular(20),
                  color: theme.colorScheme.primary.withOpacity(0.8),
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
          transform: Matrix4.translationValues(offset4, offset3, 1),
          child: Container(
            height: 250,
            width: 50,
            transform: Matrix4.rotationZ(126.01),
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                    color: Colors.black26, blurRadius: 10, spreadRadius: 10)
              ],
              borderRadius: BorderRadius.circular(50),
              color: theme.colorScheme.background.withAlpha(200),
            ),
          ),
        ),
        AnimatedContainer(
          curve: Curves.easeOutCubic,
          duration: const Duration(milliseconds: 300),
          transform: Matrix4.translationValues(offset6, offset5, 1),
          child: Stack(
            children: [
              Container(
                height: 300,
                width: 200,
                transform: Matrix4.skewX(-0.35),
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black26, blurRadius: 10, spreadRadius: 10)
                  ],
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(20),
                  ),
                  color: theme.colorScheme.primary,
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
    );
  }
}
