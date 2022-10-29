import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:koopy/components/global/Snackbar.dart';
import 'package:koopy/components/home/HomeController.dart';
import 'package:koopy/components/home/screen/HomeScreenController.dart';
import 'package:koopy/components/home/screen/header/HeaderController.dart';
import 'package:koopy/components/theme.dart';
import 'package:http/http.dart' as http;
import 'package:koopy/main.dart';

class AddList extends StatelessWidget {
  const AddList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RxString buttonText = "Choose family..".obs;
    int selectedID = 0;
    TextEditingController name = new TextEditingController();
    return Wrap(
      children: [
        Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                "Add list",
                style: subtitle,
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: name,
                decoration: InputDecoration(
                  labelText: "Name",
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Select family: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  TextButton(
                    child: Obx(
                      () => Text(
                        buttonText.value,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    onPressed: () {
                      HeaderController hc = Get.find();
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
                                      if (snapshot.connectionState ==
                                          ConnectionState.done) {
                                        if (snapshot.hasData) {
                                          var data = snapshot.data as Map;
                                          List<Widget> widgets = [];
                                          if (data.isEmpty) {
                                            widgets.add(
                                              Text(
                                                "You are not a member of any family.",
                                              ),
                                            );
                                          }

                                          for (String key
                                              in data.keys.toList()) {
                                            widgets.add(
                                              GestureDetector(
                                                onTap: () {
                                                  buttonText.value =
                                                      data[key]["name"];
                                                  selectedID = data[key]["id"];
                                                  Get.back();
                                                },
                                                child: Container(
                                                  color: Theme.of(Get.context!)
                                                      .colorScheme
                                                      .background,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 16.0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          data[key]["name"],
                                                          style: TextStyle(
                                                            color: Theme.of(Get
                                                                    .context!)
                                                                .colorScheme
                                                                .primary,
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                          ),
                                                        ),
                                                        Text(
                                                          data[key]["address"],
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w400,
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
                                                MediaQuery.of(Get.context!)
                                                        .size
                                                        .height /
                                                    3,
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
                                    future: hc.getFamilies(),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        backgroundColor:
                            Theme.of(Get.context!).colorScheme.background,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20)),
                        ),
                      );
                    },
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (name.value.text.isEmpty || selectedID == 0) {
                    showSnackbar(
                        title: "Error", message: "Please fill in all fields.");
                    return;
                  }
                  var storage = GetStorage();
                  await http.post(
                    Uri.parse(baseUrl + "list/new"),
                    body: json.encode({
                      "admin": storage.read("userID"),
                      "family_id": selectedID,
                      "name": name.value.text,
                    }),
                    headers: {
                      "Authorization": "Bearer " + storage.read("token"),
                    },
                  ).then(
                    (value) {
                      if (value.statusCode == 400) {
                        showSnackbar(
                          title: "Error",
                          message:
                              "List with that name in that family already exists.",
                        );
                      } else {
                        HomeScreenController hc = Get.find();
                        hc.getLists();
                        Get.back();
                        HomeController homec = Get.find();
                        homec.showItem.value = true;
                        showSnackbar(
                          title: "Success",
                          message: "List successfully created.",
                          color: Color(0xff88d840),
                        );
                      }
                    },
                  );
                },
                child: Text("CREATE"),
              ),
            ],
          ),
        )
      ],
    );
  }
}
