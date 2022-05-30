import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  Map<String, RxDouble> opacities = {"Home": 1.0.obs, "Lists": 0.3.obs, "Family": 0.3.obs, "Settings": 0.3.obs};

  void changePage(String opacity) {
    for (String key in opacities.keys) {
      opacities[key]!.value = 0.3;
    }
    opacities[opacity]!.value = 1;
  }
}