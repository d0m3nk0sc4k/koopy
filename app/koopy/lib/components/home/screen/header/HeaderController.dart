import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:koopy/components/home/screen/HomeScreenController.dart';
import 'package:koopy/main.dart';

class HeaderController extends GetxController {
  var name = "".obs;
  var id = 0.obs;
  var address = "".obs;
  HomeScreenController hc = Get.find();
  Map lists = {};

  final storage = GetStorage();

  @override
  void onReady() async {
    await hc.getFamilies().then((value) {
      Map<dynamic, dynamic> val = json.decode(json.encode(json.decode(value)));
      lists = val;
      name.value = val.keys.toList()[0];
      id.value = val[name.value]["id"];
      address.value = val[name.value]["address"];
    });
  }

  Future getFamilies() async {
    return await http.get(
        Uri.parse(
            baseUrl + "user/families/" + storage.read("userID").toString()),
        headers: {
          'Authorization': "Bearer " + storage.read("token")
        }).then((value) {
      var data = json.decode(value.body);
      return data;
    });
  }

  void openFamilyPicker() {
    Get.bottomSheet(
      Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Center(
                  child: Text(
                    'Izberi družino',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                FutureBuilder(
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        var data = snapshot.data as Map;
                        List<Widget> widgets = [];
                        if (data.isEmpty) {
                          widgets.add(Text("You are not a member of any family."));
                        }

                        for (String key in data.keys.toList()) {
                          widgets.add(
                            GestureDetector(
                              onTap: () {changeFamily(data[key]["id"], key);},
                              child: Container(
                                color: Theme.of(Get.context!).colorScheme.background,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 16.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        data[key]["name"],
                                        style: TextStyle(
                                          color: Theme.of(Get.context!)
                                              .colorScheme
                                              .primary,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        data[key]["address"],
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }

                        return LimitedBox(
                          maxHeight:
                              MediaQuery.of(Get.context!).size.height / 3,
                          child: ListView(
                            shrinkWrap: true,
                            children: widgets,
                          ),
                        );
                      }
                    }

                    return Center(
                      child: Padding(
                        padding: EdgeInsets.all(50),
                        child: CircularProgressIndicator(),
                      ),
                    );
                  },
                  future: getFamilies(),
                )
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Theme.of(Get.context!).colorScheme.background,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
    );
  }

  void changeFamily(int familyID, String familyName) {
    storage.write("selectedFamily", familyID);
    name.value = familyName;
    HomeScreenController hc = Get.find();
    hc.getLists();
    Navigator.pop(Get.context!);
  }
}
