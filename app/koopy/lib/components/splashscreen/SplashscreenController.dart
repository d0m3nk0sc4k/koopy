import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:koopy/components/functions/CheckToken.dart';
import 'package:koopy/components/home/Home.dart';
import 'package:get/get.dart';
import 'package:koopy/components/initial_setup/register/Register.dart';
import 'package:koopy/components/initial_setup/register/family/Family.dart';
import 'package:koopy/main.dart';
import 'package:rive/rive.dart';
import 'package:http/http.dart' as http;

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
    Get.deleteAll();
    Get.off(() => Register());
  }

  Future CheckFamilies() async {
    var storage = GetStorage();
    return await http.get(
        Uri.parse(
            baseUrl + "user/families/" + storage.read("userID").toString()),
        headers: {
          'Authorization': "Bearer " + storage.read("token")
        }).then((value) {
      return value.statusCode;
    });
  }

  // Run once, when widget is rendered
  @override
  void onReady() async {
    var temp = false;
    super.onReady();
    // check if token is in store
    await CheckToken().then((value) async {
      await CheckFamilies().then((value) async {
        if (value == 400) {
          temp = true;
        }
      });
      // wait for 2 more seconds
      await Future.delayed(Duration(milliseconds: 1000));
      _loaded?.change(true);
      // wait till animation is complete
      await Future.delayed(Duration(milliseconds: 2000));
      // if token is in store
      if (value == "OK") {
        offsetLogo.value = -500.0;
        await Future.delayed(Duration(milliseconds: 150));
        offset.value = 100.0;
        await Future.delayed(Duration(milliseconds: 500));
        if (temp) {
          Get.deleteAll();
          Get.off(() => AddFamily());
        } else {
          Get.deleteAll();
          Get.off(() => Home());
        }
      } else {
        offset.value = 0;
      }
    });
  }
}
