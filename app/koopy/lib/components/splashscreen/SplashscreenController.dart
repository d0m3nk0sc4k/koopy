import 'package:koopy/components/functions/CheckToken.dart';
import 'package:koopy/components/home/Home.dart';
import 'package:get/get.dart';
import 'package:koopy/components/initial_setup/register/family/Family.dart';
import 'package:koopy/components/initial_setup/register/family/FamilyController.dart';
import 'package:koopy/components/initial_setup/register/mail/Mail.dart';
import 'package:rive/rive.dart';

class SplashscreenController extends GetxController {
  RxDouble offset = 100.0.obs;
  RxDouble offsetLogo = 0.0.obs;

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
    Get.off(() => AddFamily());
  }

  // Run once, when widget is rendered
  @override
  void onReady() async {
    super.onReady();
    // check if token is in store
    await CheckToken().then((value) async {
      // wait for 2 more seconds
      await Future.delayed(Duration(milliseconds: 2000));
      _loaded?.change(true);
      // wait till animation is complete
      await Future.delayed(Duration(milliseconds: 2000));
      // if token is in store
      if (value != "") {
        offsetLogo.value = -500.0;
        await Future.delayed(Duration(milliseconds: 150));
        offset.value = 100.0;
        await Future.delayed(Duration(milliseconds: 500));
        Get.off(() => AddFamily());
      } else {
        offset.value = 0;
      }
    });
  }
}
