import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:koopy/components/home/screen/HomeScreenController.dart';
import 'package:koopy/components/home/screen/add/AddItem.dart';
import 'package:koopy/components/home/screen/list/ListItem.dart';
import 'package:http/http.dart' as http;
import 'package:koopy/main.dart';

class ListWidget extends StatelessWidget {
  const ListWidget(
      {Key? key,
      required this.listName,
      required this.id,
      required this.children,
      required this.admin})
      : super(key: key);
  final String listName;
  final id;
  final bool admin;

  final List children;

  @override
  Widget build(BuildContext context) {
    var storage = GetStorage();
    return Container(
      margin: EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: Theme.of(Get.context!).colorScheme.primary,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Theme.of(Get.context!)
                .colorScheme
                .onBackground
                .withOpacity(0.4),
            blurRadius: 16,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20, left: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  listName.toUpperCase(),
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Theme.of(Get.context!).colorScheme.background,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      padding: EdgeInsets.only(right: 10),
                      constraints: BoxConstraints(),
                      onPressed: () async {
                        Get.bottomSheet(
                          AddItem(
                            list_id: this.id,
                            placeholder: this.listName,
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
                      icon: FaIcon(
                        FontAwesomeIcons.plus,
                        color: Theme.of(Get.context!).colorScheme.background,
                        size: 20,
                      ),
                    ),
                    (admin)
                        ? IconButton(
                            padding: EdgeInsets.only(right: 20),
                            constraints: BoxConstraints(),
                            onPressed: () async {
                              // list/delete
                              await http.delete(
                                Uri.parse(baseUrl + "list/delete"),
                                body: json.encode({"id": this.id}),
                                headers: {
                                  'Authorization':
                                      "Bearer " + storage.read("token")
                                },
                              ).then(
                                (value) {
                                  if (value.statusCode == 204) {
                                    HomeScreenController hcc = Get.find();
                                    hcc.getLists();
                                  }
                                },
                              );
                            },
                            icon: FaIcon(
                              FontAwesomeIcons.trashCan,
                              color:
                                  Theme.of(Get.context!).colorScheme.background,
                              size: 20,
                            ),
                          )
                        : Container(),
                  ],
                ),
              ],
            ),
          ),
          Container(
            constraints: BoxConstraints(
              minHeight: 50,
              maxHeight: 400,
            ),
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Theme.of(Get.context!).colorScheme.background,
              borderRadius: BorderRadius.circular(10),
            ),
            child: (children.isEmpty)
                ? ListView(
                    children: [
                      Container(
                          height: 50,
                          child: Center(
                              child: Text(
                            "No products in this list!",
                            style: TextStyle(fontSize: 16),
                          )))
                    ],
                    shrinkWrap: true,
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: children.length,
                    itemBuilder: ((context, index) {
                      return ListItem(itemData: children[index]);
                    }),
                  ),
          ),
        ],
      ),
    );
  }
}
