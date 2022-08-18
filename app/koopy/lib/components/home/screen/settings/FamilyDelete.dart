import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:koopy/components/home/screen/HomeScreenController.dart';
import 'package:koopy/components/home/screen/header/HeaderController.dart';
import 'package:koopy/components/home/screen/settings/FamilyControllerDelete.dart';
import 'package:koopy/main.dart';
import 'dart:convert';
import 'package:qr/qr.dart';
import 'package:qr_flutter/qr_flutter.dart';

class FamilyDelete extends StatelessWidget {
  const FamilyDelete(
      {Key? key, required this.familyName, required this.familyId})
      : super(key: key);

  final String familyName;
  final int familyId;

  @override
  Widget build(BuildContext context) {
    FamilyControllerDelete tc = Get.find();
    HomeScreenController hc = Get.find();
    HeaderController hec = Get.find();
    var storage = GetStorage();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: TextButton(
            onPressed: () {
              Get.defaultDialog(
                  title: "Are you sure you want to leave " + familyName + "?",
                  middleText: "",
                  actions: [
                    TextButton(
                      onPressed: () async {
                        await http.delete(
                          Uri.parse(baseUrl + "family/leave"),
                          body: json.encode(
                              {"uid": storage.read("userID"), "fid": familyId}),
                          headers: {
                            "Authorization": "Bearer " + storage.read("token")
                          },
                        ).then((response) {
                          print(response);
                        });
                        hc.onReady();
                        tc.getFamilies();
                        hec.onReady();
                        Navigator.pop(Get.context!);
                      },
                      child: Text(
                        "LEAVE",
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
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
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                familyName,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            Get.defaultDialog(
              title: "Scan to join",
              content: Container(
                height: 200,
                width: 200,
                child: QrImage(
                  data: "asdasdasd",
                  size: 200,
                  foregroundColor: Theme.of(Get.context!).colorScheme.primary,
                ),
              ),
            );
          },
          icon: FaIcon(
            FontAwesomeIcons.qrcode,
            size: 14,
          ),
        ),
      ],
    );
  }
}
