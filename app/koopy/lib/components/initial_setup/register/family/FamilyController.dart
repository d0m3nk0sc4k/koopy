import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:koopy/main.dart';

class FamilyController extends GetxController {
  RxMap<String, double> animationOffsets = {
    "title": 500.0,
    "subtitle": 500.0,
    "input": 500.0,
    "button": 500.0,
  }.obs;

  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController joinKey = TextEditingController();
  RxBool disabled = true.obs;

  void readQR() async {
    String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
      "000000",
      "Cancel",
      false,
      ScanMode.QR,
    );
    final data = json.decode(barcodeScanRes);
    name.text = data["name"];
    address.text = data["address"];
    joinKey.text = data["joinKey"];
    disabled.value = false;
  }

  void joinFam() async {
    final storage = GetStorage();
    await http.put(Uri.parse(baseUrl+"family"), body: json.encode({"join_key": joinKey.text, "user": storage.read("userID")}));
  }

  void notNow() async {}

  @override
  void onReady() async {
    animationOffsets["title"] = 0;
    await Future.delayed(Duration(milliseconds: 100));
    animationOffsets["subtitle"] = 0;
    await Future.delayed(Duration(milliseconds: 50));
    animationOffsets["input"] = 0;
    await Future.delayed(Duration(milliseconds: 100));
    animationOffsets["button"] = 0;

    super.onReady();
  }
}
