import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:koopy/components/home/screen/header/HeaderController.dart';
import 'package:koopy/components/theme.dart';

class AddItem extends StatelessWidget {
  const AddItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController name = new TextEditingController(),
        producer = new TextEditingController(),
        quantity = new TextEditingController();
    int listID;
    RxString buttonText = "Select...".obs;

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
                    child: Obx(() => Text(buttonText.value, style: TextStyle(fontSize: 16),)),
                    onPressed: () {
                      HeaderController hc = Get.find();
                      var keys = hc.lists.keys.toList();
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
                                          itemCount: keys.length,
                                          itemBuilder: (context, i) {
                                            return TextButton(
                                              child: Text(
                                                keys[i],
                                                style: TextStyle(
                                                  fontSize: 18,
                                                ),
                                              ),
                                              onPressed: () {
                                                listID =
                                                    hc.lists[keys[i]]["id"];
                                                buttonText.value = keys[i];
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
            ],
          ),
        ),
      ],
    );
  }
}
