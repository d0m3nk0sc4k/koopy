import 'dart:convert';
import 'package:koopy/components/home/screen/list/List.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:koopy/main.dart';

class HomeScreenController extends GetxController {
  GetStorage storage = GetStorage();
  var widgets = <Widget>[
    Expanded(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    )
  ].obs;

  var list = <Widget>[].obs();

  @override
  void onReady() async {
    await getFamilies();
    await getLists();
  }

  Future getFamilies() async {
    return await http.get(
        Uri.parse(
          baseUrl + "user/families/" + storage.read("userID").toString(),
        ),
        headers: {
          "Authorization": "Bearer " + storage.read("token")
        }).then((value) {
      var response = json.decode(json.encode(json.decode(value.body)));
      storage.write(
          "selectedFamily", response[response.keys.toList()[0]]["id"]);
      return value.body;
    });
  }

  Future getLists() async {
    var storage = GetStorage();
    var lists = await http.get(
        Uri.parse(baseUrl +
            "family/info/" +
            storage.read("selectedFamily").toString()),
        headers: {
          'Authorization': "Bearer " + storage.read("token")
        }).then((value) {
      var data = json.decode(value.body);
      return data["lists"];
    });

    if (lists.length == 0) {
      this.widgets.value = [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Text("No lists in this family."),
          ),
        ),
      ];
      return;
    }

    var widgets = <Widget>[];

    for (var list in lists) {
      var temp = await http.get(
          Uri.parse(baseUrl + "list/" + list.toString() + "/products"),
          headers: {
            'Authorization': "Bearer " + storage.read("token")
          }).then((value) {
        var data = json.decode(value.body);
        widgets.add(new ListWidget(
          listName: data.keys.toList()[0],
          id: list,
          children: data[data.keys.toList()[0]]["data"],
          admin: (data[data.keys.toList()[0]]["admin"] ==
              storage.read("userID").toString()),
        ));
      });
    }

    this.widgets.value = widgets;
  }
}
