import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koopy/components/home/screen/HomeScreenController.dart';
import 'package:koopy/components/home/screen/list/ListItem.dart';

class ListController extends GetxController {
  ListController({required this.items});
  List items;
  RxList<Widget> list = RxList<Widget>([]).obs();

  HomeScreenController hsc = Get.find();

  @override
  void onReady() {
    populateList();
  }

  void pop(item) {
    items.remove(item);
  }

  void populateList() async {
    for (var item in items) {
      list.add(new ListItem(itemData: item));
    }
  }
}
