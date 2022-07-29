import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:koopy/components/home/screen/HomeScreenController.dart';
import 'package:koopy/components/theme.dart' as t;

class ListItem extends StatelessWidget {
  const ListItem({Key? key, required this.itemData, this.striked = false})
      : super(key: key);
  final bool striked;
  final itemData;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        Get.bottomSheet(
          Wrap(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        itemData["id_p"]["name"],
                        style: TextStyle(
                          fontSize: 26,
                          color: Theme.of(Get.context!).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      child: Text(
                        itemData["id_p"]["producer"],
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    (itemData["id_p"]["barcode"] != null)
                        ? Container(
                            width: double.infinity,
                            child: Row(
                              children: [
                                Text(
                                  itemData["id_p"]["barcode"],
                                  style: TextStyle(fontSize: 16),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: FaIcon(FontAwesomeIcons.qrcode),
                                ),
                              ],
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            ),
                          )
                        : SizedBox(),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            style:
                                TextButton.styleFrom(padding: EdgeInsets.zero),
                            onPressed: () {
                              Navigator.pop(Get.context!);
                            },
                            child: Text(
                              "Kupljeno",
                              style: TextStyle(
                                color:
                                    Theme.of(Get.context!).colorScheme.primary,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(Get.context!);
                              HomeScreenController c = Get.find();
                              c.getLists();
                              
                            },
                            child: Text(
                              "Izbriši",
                              style: TextStyle(
                                color: t.error,
                                fontSize: 16,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        color: Theme.of(Get.context!).colorScheme.background,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Row(
          children: [
            Text(
              itemData["id_p"]["name"],
              style: TextStyle(
                color: (this.striked)
                    ? Theme.of(Get.context!)
                        .colorScheme
                        .onBackground
                        .withOpacity(0.4)
                    : Theme.of(Get.context!).colorScheme.onBackground,
                fontSize: 18,
                decoration: (this.striked)
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            )
          ],
        ),
      ),
    );
  }
}
