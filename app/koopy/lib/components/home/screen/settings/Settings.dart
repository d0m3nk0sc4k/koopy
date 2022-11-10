import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:koopy/components/global/Snackbar.dart';
import 'package:koopy/components/home/screen/HomeScreenController.dart';
import 'package:koopy/components/home/screen/header/HeaderController.dart';
import 'package:koopy/components/home/screen/settings/FamilyControllerDelete.dart';
import 'package:koopy/components/home/screen/settings/SettingsController.dart';
import 'package:koopy/components/initial_setup/register/Register.dart';
import 'package:koopy/main.dart';
import 'package:http/http.dart' as http;

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FamilyControllerDelete c = Get.put(FamilyControllerDelete());
    var storage = GetStorage();
    SettingsController sc = Get.put(SettingsController());
    return Obx(
      () => ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: (MediaQuery.of(Get.context!).size.height / 6) * 5,
        ),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
          child: Wrap(
            children: [
              Column(
                children: [
                  Text(
                    "Settings",
                    style: TextStyle(
                      color: Theme.of(Get.context!).colorScheme.primary,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Material(
                        elevation: 1,
                        shape: CircleBorder(),
                        clipBehavior: Clip.hardEdge,
                        color: Colors.transparent,
                        child: Ink.image(
                          image: NetworkImage(
                            baseUrl + "image/" + storage.read("profile_img"),
                          ),
                          fit: BoxFit.cover,
                          width: 100,
                          height: 100,
                          child: InkWell(
                            onTap: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Name:",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(storage.read("name")),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Email:",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(storage.read("mail")),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Divider(),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Families",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: double.infinity,
                      maxHeight: 100,
                    ),
                    child: ListView(
                      children: c.families,
                      shrinkWrap: true,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Divider(),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          storage.erase();
                          Get.deleteAll();
                          Get.off(Register());
                        },
                        child: Text(
                          "LOGOUT",
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      TextButton(
                        child: Text("Join a family"),
                        onPressed: () {
                          sc.te.clear();
                          sc.error.value = "";
                          Get.defaultDialog(
                            title: "Enter join key",
                            actions: [
                              TextButton(
                                onPressed: () async {
                                  if (sc.te.value.text == "") {
                                    sc.error.value =
                                        "Please enter the join key";
                                  } else {
                                    await http.put(
                                      Uri.parse(baseUrl + "family/join"),
                                      body: json.encode({
                                        "join_key": sc.te.value.text,
                                        "user": storage.read("userID")
                                      }),
                                      headers: {
                                        "Authorization":
                                            "Bearer " + storage.read("token")
                                      },
                                    ).then((value) {
                                      if (value.statusCode == 400) {
                                        sc.error.value =
                                            json.decode(value.body)["message"];
                                      } else if (value.statusCode == 201) {
                                        Get.closeAllSnackbars();
                                        while (Get.isDialogOpen! ||
                                            Get.isBottomSheetOpen!) {
                                          Get.back();
                                        }
                                        FamilyControllerDelete tc = Get.find();
                                        HomeScreenController hc = Get.find();
                                        HeaderController hec = Get.find();
                                        tc.onReady();
                                        hc.onReady();
                                        hec.onReady();
                                        showSnackbar(
                                            title: "Success",
                                            message:
                                                "You have successfully joined the " +
                                                    json.decode(
                                                        value.body)["family"] +
                                                    " family.",
                                            color: Color(0xff88d840));
                                      } else {
                                        // open snackbar
                                      }
                                    });
                                  }
                                },
                                child: Text("Join"),
                              ),
                            ],
                            content: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Obx(
                                      () => TextField(
                                        controller: sc.te,
                                        decoration: InputDecoration(
                                          contentPadding:
                                              EdgeInsets.only(bottom: 6),
                                          isDense: true,
                                          hintText: "Join key",
                                          errorText: (sc.error.value != "")
                                              ? sc.error.value
                                              : null,
                                        ),
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    splashRadius: 2,
                                    iconSize: 18,
                                    onPressed: () async {
                                      String barcodeScanRes =
                                          await FlutterBarcodeScanner
                                              .scanBarcode(
                                        "#000000",
                                        "Cancel",
                                        false,
                                        ScanMode.QR,
                                      );
                                      sc.te.text = barcodeScanRes;
                                    },
                                    icon: FaIcon(FontAwesomeIcons.qrcode),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
