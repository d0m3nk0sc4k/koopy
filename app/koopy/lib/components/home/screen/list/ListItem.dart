import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:koopy/components/home/screen/list/ListController.dart';
import 'package:koopy/components/theme.dart' as t;

class ListItem extends StatelessWidget {
  const ListItem({Key? key, required this.title, required this.producer, required this.barcode}) : super(key: key);

  final title, producer, barcode;

  @override
  Widget build(BuildContext context) {
    ListController lc = Get.find();

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
                        title,
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
                        producer,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      child: Row(
                        children: [
                          Text(
                            barcode,
                            style: TextStyle(fontSize: 16),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: FaIcon(FontAwesomeIcons.qrcode),
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            style: TextButton.styleFrom(padding: EdgeInsets.zero),
                            onPressed: () {
                              Navigator.pop(Get.context!);
                              lc.pop(title);
                              lc.populateList();
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
                              lc.pop(title);
                              lc.populateList();
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
              title,
              style: TextStyle(
                color: Theme.of(Get.context!).colorScheme.onBackground,
                fontSize: 18,
              ),
            )
          ],
        ),
      ),
    );
  }
}
