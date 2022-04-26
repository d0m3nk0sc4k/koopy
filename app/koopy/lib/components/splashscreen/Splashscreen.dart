import 'package:flutter/material.dart';
import 'package:koopy/components/splashscreen/SplashscreenController.dart';

import 'package:koopy/components/theme.dart';
import 'package:rive/rive.dart';
import 'package:get/get.dart';

class Splash extends StatelessWidget {
  Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SplashscreenController c = Get.put(SplashscreenController());

    return Obx(
      () => Scaffold(
        backgroundColor: light.primary,
        body: Stack(
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 600),
              curve: Curves.easeInCubic,
              transform: Matrix4.translationValues(c.offsetLogo.value, 0, 0),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: RiveAnimation.asset(
                    "assets/animations/splashscreen.riv",
                    fit: BoxFit.contain,
                    onInit: c.onRiveInit,
                  ),
                ),
              ),
            ),
            AnimatedContainer(
              curve: Curves.easeOutCubic,
              duration: Duration(milliseconds: 200),
              transform: Matrix4.translationValues(0, c.offset.value, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Ink(
                        decoration: const ShapeDecoration(
                          shape: CircleBorder(),
                          color: Colors.white,
                        ),
                        child: IconButton(
                          onPressed: c.navigate,
                          icon: Icon(
                            Icons.navigate_next,
                            color: light.primary,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
