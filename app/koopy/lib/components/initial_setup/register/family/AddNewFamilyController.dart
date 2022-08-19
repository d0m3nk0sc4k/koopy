import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:koopy/components/global/Snackbar.dart';
import 'package:koopy/components/home/Home.dart';
import 'package:koopy/components/initial_setup/register/family/AddNewFamily.dart';
import 'package:koopy/components/initial_setup/register/family/Family.dart';
import 'package:koopy/main.dart';

class AddNewFamilyContoller extends GetxController {
  RxMap<String, double> animationOffsets = {
    "title": 500.0,
    "subtitle": 500.0,
    "input1": 500.0,
    "input2": 500.0,
    "button": 500.0,
  }.obs;

  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController joinKey = TextEditingController();

  void joinFam() async {
    final storage = GetStorage();
    await http.post(
      Uri.parse(baseUrl + "family/new"),
      body: json.encode(
        {"address": address.text, "admin": 3, "name": name.text},
      ),
      headers: {
        "Authorization": "Bearer " + storage.read("token"),
      }
    ).then((value) {
      if (value.statusCode == 201) {
        Get.deleteAll();
        Get.off(Home());
      } else if (value.statusCode == 400){
        showSnackbar(title: "Error", message: json.decode(value.body)["message"]);
      }
    });
  }

  void createNew() async {
    animationOffsets["button"] = -500;
    await Future.delayed(Duration(milliseconds: 100));
    animationOffsets["input2"] = -500;
    await Future.delayed(Duration(milliseconds: 50));
    animationOffsets["input1"] = -500;
    await Future.delayed(Duration(milliseconds: 50));
    animationOffsets["subtitle"] = -500;
    await Future.delayed(Duration(milliseconds: 100));
    animationOffsets["title"] = -500;
    Get.deleteAll();
    Get.off(AddFamily());
  }

  @override
  void onReady() async {
    animationOffsets["title"] = 0;
    await Future.delayed(Duration(milliseconds: 100));
    animationOffsets["subtitle"] = 0;
    await Future.delayed(Duration(milliseconds: 50));
    animationOffsets["input1"] = 0;
    await Future.delayed(Duration(milliseconds: 50));
    animationOffsets["input2"] = 0;
    await Future.delayed(Duration(milliseconds: 100));
    animationOffsets["button"] = 0;

    super.onReady();
  }
}
