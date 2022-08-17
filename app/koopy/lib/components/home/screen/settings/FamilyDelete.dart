import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:koopy/components/home/screen/settings/FamilyControllerDelete.dart';
import 'package:koopy/main.dart';

class FamilyDelete extends StatelessWidget {
  const FamilyDelete({Key? key, required this.familyName, required this.familyId}) : super(key: key);

  final String familyName;
  final int familyId;

  @override
  Widget build(BuildContext context) {
    FamilyControllerDelete tc = Get.find();
    var storage = GetStorage();
    return TextButton(
      onPressed: () {
        Get.defaultDialog(
            title: "Are you sure you want to leave " + familyName + "?",
            middleText: "",
            actions: [
              TextButton(
                onPressed: () async {
                  await http.delete(Uri.parse(baseUrl + "family/leave"), body: {"uid": storage.read("userID"), "fid": familyId});
                  tc.getFamilies();
                  Navigator.pop(Get.context!);
                },
                child: Text(
                  "LEAVE",
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(Get.context!);
                },
                child: Text("CANCEL",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ]);
      },
      child: Text(
        familyName,
        style: TextStyle(
          fontSize: 14,
        ),
      ),
    );
  }
}
