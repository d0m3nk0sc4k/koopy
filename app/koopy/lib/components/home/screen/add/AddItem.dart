import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:koopy/components/global/Snackbar.dart';
import 'package:koopy/components/home/screen/HomeScreenController.dart';
import 'package:koopy/components/home/screen/add/AddItemController.dart';
import 'package:koopy/components/theme.dart';
import 'package:koopy/main.dart';

class AddItem extends StatelessWidget {
  final int list_id;
  final String placeholder;
  const AddItem({this.list_id: 0, this.placeholder: "Select..."});

  @override
  Widget build(BuildContext context) {
    TextEditingController name = new TextEditingController(),
        producer = new TextEditingController(),
        quantity = new TextEditingController();
    int listID = list_id;
    RxString buttonText = placeholder.obs;

    AddItemController c = Get.put(AddItemController());

    return Wrap(
      children: [
        Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                "Add item",
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
                  Expanded(
                    child: TextField(
                      controller: producer,
                      decoration: InputDecoration(
                        labelText: "Producer",
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 70,
                    child: TextField(
                      controller: quantity,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.end,
                      decoration: InputDecoration(
                        labelText: "Quantity",
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
                    "Select list: ",
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
                      Get.bottomSheet(
                        Wrap(
                          children: [
                            Container(
                              padding: EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  Text(
                                    "Select list:",
                                    style: subtitle,
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  ConstrainedBox(
                                    constraints: BoxConstraints(
                                      maxHeight: 200,
                                    ),
                                    child: Wrap(
                                      children: [
                                        ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: c.lists.length,
                                          itemBuilder: (context, i) {
                                            return TextButton(
                                              child: Text(
                                                c.lists[i]["name"],
                                                style: TextStyle(
                                                  fontSize: 18,
                                                ),
                                              ),
                                              onPressed: () {
                                                listID = c.lists[i]["id"];
                                                buttonText.value =
                                                    c.lists[i]["name"];
                                                Get.back();
                                              },
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        backgroundColor:
                            Theme.of(Get.context!).colorScheme.background,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        isScrollControlled: true,
                      );
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (name.value.text.isEmpty ||
                      producer.value.text.isEmpty ||
                      quantity.value.text.isEmpty ||
                      listID == 0) {
                    showSnackbar(
                        title: "Error", message: "Please fill in all fields.");
                    return;
                  }

                  var storage = GetStorage();
                  await http.post(Uri.parse(baseUrl + "product/new"),
                      body: json.encode({
                        "name": name.value.text,
                        "producer": producer.value.text
                      }),
                      headers: {
                        "Authorization": "Bearer " + storage.read("token")
                      }).then(
                    (value) {
                      if (value.statusCode == 500) {
                        showSnackbar(
                            title: "Error",
                            message:
                                "Something went wrong. Please try again later.");
                      } else {
                        print(json.decode(value.body));
                        http
                            .post(Uri.parse(baseUrl + "list/product/add"),
                                headers: {
                                  "Authorization":
                                      "Bearer " + storage.read("token")
                                },
                                body: json.encode({
                                  "id_p": json.decode(value.body)["id"],
                                  "id_l": listID,
                                  "user": storage.read("userID"),
                                  "quantity": quantity.value.text
                                }))
                            .then(
                          (value) {
                            if (value.statusCode == 400) {
                              showSnackbar(
                                  title: "Error",
                                  message: "Product is already on that list.");
                            }
                          },
                        );
                      }
                    },
                  );

                  HomeScreenController hc = Get.find();
                  hc.getLists();
                  Get.back();
                  showSnackbar(
                      title: "Success",
                      message: "Product successfully added to the list!",
                      color: Color(0xff88d840));
                },
                child: Text("ADD"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
