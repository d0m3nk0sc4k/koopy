import 'package:flutter/material.dart';
import 'package:koopy/components/register/Register.dart';
import 'package:koopy/components/theme.dart';
import 'package:rive/rive.dart';
import 'package:get/get.dart';

class SplashscreenController extends GetxController {
  RxDouble offset = 100.0.obs;
  RxDouble offsetLogo = 0.0.obs;

  SMIBool? _loaded;

  void _onInit(Artboard artboard) {
    final controller =
        StateMachineController.fromArtboard(artboard, "Splashscreen");
    artboard.addController(controller!);
    _loaded = controller.findInput<bool>("Loaded") as SMIBool;
  }

  void navigate() async {
    offsetLogo.value = -500.0;
    await Future.delayed(Duration(milliseconds: 150));
    offset.value = 100.0;
    await Future.delayed(Duration(milliseconds: 500));
    Get.off(() => Register(), transition: Transition.fadeIn);
  }

  void loaded() => _loaded?.change(true);

  @override
  void onReady() async {
    await Future.delayed(Duration(milliseconds: 3000));
    loaded();
    await Future.delayed(Duration(milliseconds: 1800));
    offset.value = 0;

    super.onReady();
  }
}

class Splash extends StatelessWidget {
  Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SplashscreenController c = Get.put(SplashscreenController());

    return Stack(
      children: [
        Obx(() => AnimatedContainer(
          duration: Duration(milliseconds: 600),
          curve: Curves.easeInCubic,
          transform: Matrix4.translationValues(c.offsetLogo.value, 0, 0),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: RiveAnimation.asset(
                "assets/animations/splashscreen.riv",
                fit: BoxFit.contain,
                onInit: c._onInit,
              ),
            ),
          ),
        ),),
        Obx(
          () => AnimatedContainer(
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
                        icon: Icon(Icons.navigate_next, color: light.primary,),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
