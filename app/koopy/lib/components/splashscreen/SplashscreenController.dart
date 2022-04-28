import 'package:koopy/components/functions/checkForToken.dart';
import 'package:koopy/components/register/Register.dart';
import 'package:get/get.dart';
import 'package:koopy/components/register/mail/Mail.dart';
import 'package:rive/rive.dart';

class SplashscreenController extends GetxController {
  RxDouble offset =
      100.0.obs; // Bottom button to next page offset (it is hidden)
  RxDouble offsetLogo = 0.0.obs; // Var used for animation (fly from screen)

  SMIBool? _loaded; // Var for Rive State Machine

  void onRiveInit(Artboard artboard) {
    final controller =
        StateMachineController.fromArtboard(artboard, "Splashscreen");
    artboard.addController(controller!);
    _loaded = controller.findInput<bool>("Loaded") as SMIBool;
  }

  // Fly logo and button from screen and navigate to Registration page (onButtonPress)
  void navigate() async {
    offsetLogo.value = -500.0;
    await Future.delayed(Duration(milliseconds: 150));
    offset.value = 100.0;
    await Future.delayed(Duration(milliseconds: 500));
    Get.off(() => Mail(), transition: Transition.fadeIn);
  }

  // Run once, when widget is rendered
  @override
  void onReady() async {
    // check if token is in store
    await checkForToken().then((value) async {
      // wait for 2 more seconds
      await Future.delayed(Duration(milliseconds: 2000));
      _loaded?.change(true);
      // wait till animation is complete
      await Future.delayed(Duration(milliseconds: 2000));
      // if token is in store
      if (value != "") {
        Get.off(() => Register()); // TODO: Change with Homescreen()
      } else {
        offset.value = 0;
      }
    });

    super.onReady();
  }
}
