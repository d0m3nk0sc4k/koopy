import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  Map<String, RxDouble> opacities = {"Home": 0.3.obs, "Lists": 0.0.obs, "Family": 0.0.obs, "Settings": 0.0.obs};

  void changePage(String opacity) {
    for (String key in opacities.keys) {
      opacities[key]!.value = 0.0;
    }
    opacities[opacity]!.value = 0.3;
  }
}