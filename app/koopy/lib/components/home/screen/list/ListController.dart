import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:koopy/components/home/screen/list/ListItem.dart';
import 'package:http/http.dart' as http;
import 'package:koopy/main.dart';

class ListController extends GetxController {
  var items = [].obs();
  RxList<Widget> list = RxList<Widget>([]).obs();

  void pop(item) {
    items.remove(item);
  }

  void populateList() async {
    list.clear();
    var storage = GetStorage();

    await http.get(
        Uri.parse(
          baseUrl + "user/families/" + storage.read("userID").toString(),
        ),
        headers: {
          "Authorization": "Bearer " + storage.read("token")
        }).then((value) {});

    await http.get(
        Uri.parse(baseUrl +
            "family/info/" +
            storage.read("selectedFamily").toString()),
        headers: {
          'Authorization': "Bearer " + storage.read("token")
        }).then((value) {
      var data = json.decode(value.body);
      items = data["lists"];
    });

    if (items.isEmpty) {
      list.add(Text("No products in this list."));
    }

    for (var item in items) {

    }
  }
}
