import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListsController extends GetxController {
  RxMap<String, double> transform = {
    'translateX': 0.0,
    'translateY': 0.0,
    'scale': 1.0,
    'radius': 0.0,
  }.obs;

  bool drawer = false;

  double width = MediaQuery.of(Get.context!).size.width;
  double height = MediaQuery.of(Get.context!).size.height;

  void controlDrawer() {
    if (drawer) {
      closeDrawer();
    } else {
      openDrawer();
    }
  }

  void openDrawer() {
    transform.value = {
      'translateX': width / 2,
      'translateY': (height * 0.3) / 2,
      'scale': 0.7,
      'radius': 12,
    };
  }

  void closeDrawer() {
    transform.value = {
      'translateX': 0.0,
      'translateY': 0.0,
      'scale': 1,
      'radius': 0,
    };
  }
}
