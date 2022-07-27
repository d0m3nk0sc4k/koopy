import 'dart:convert';
import 'package:koopy/components/home/screen/list/List.dart' as myList;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:koopy/main.dart';

class HomeScreenController extends GetxController {
  GetStorage storage = GetStorage();
  var widgets = <Widget>[
    Center(
      child: CircularProgressIndicator(),
    )
  ].obs;

  @override
  void onReady() {
    getLists();
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

    var widgets = <Widget>[];

    for (var list in lists) {
      var temp = await http
          .get(Uri.parse(baseUrl + "list/info/" + list.toString()), headers: {
        'Authorization': "Bearer " + storage.read("token")
      }).then((value) {
        var data = json.decode(value.body);
        widgets.add(myList.List(listName: data["name"]));
      });
    }

    this.widgets.value = widgets;
  }
}
