import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koopy/components/home/screen/list/ListItem.dart';

class ListController extends GetxController {
  var items = [].obs();
  RxList<Widget> list = RxList<Widget>([]).obs();

  @override
  void onReady() async {
    
    populateList();
  }

  void pop(item) {
    items.remove(item);
  }

  void populateList() {
    list.clear();
    for (var item in items) {
      list.add(ListItem(title: item, producer: "Hofer", barcode: "000",));
    }
  }
}
