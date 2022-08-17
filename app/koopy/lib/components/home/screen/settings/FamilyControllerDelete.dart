import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:koopy/components/home/screen/settings/FamilyDelete.dart';
import 'package:koopy/main.dart';

class FamilyControllerDelete extends GetxController {
  var storage = GetStorage();

  RxList<Widget> families = <Widget>[].obs;

  @override
  void onReady() {
    getFamilies();
  }

  Future getFamilies() async {
    families.clear();
    return await http.get(
        Uri.parse(
            baseUrl + "user/families/" + storage.read("userID").toString()),
        headers: {
          'Authorization': "Bearer " + storage.read("token")
        }).then((value) {
      var data = json.decode(value.body);
      
      for (var key in data.keys) {
        families.add(FamilyDelete(familyName: key, familyId: data[key]["id"]));
      }

      return data;
    });
  }
}