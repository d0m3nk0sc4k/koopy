import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:koopy/components/home/HomeController.dart';
import 'package:koopy/components/home/screen/HomeScreen.dart';
import 'package:koopy/components/home/screen/add/AddItem.dart';
import 'package:koopy/components/home/screen/add/AddList.dart';
import 'package:koopy/components/home/screen/settings/Settings.dart';
import 'package:koopy/components/theme.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var storage = GetStorage();
    HomeController c = Get.put(HomeController());

    return (Scaffold(
      backgroundColor: Theme.of(Get.context!).colorScheme.background,
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: IconThemeData(
          color: Theme.of(Get.context!).colorScheme.background,
        ),
        backgroundColor: Theme.of(Get.context!).colorScheme.primary,
        childMargin: EdgeInsets.all(10),
        children: [
          SpeedDialChild(
            child: FaIcon(
              FontAwesomeIcons.plus,
              color: Theme.of(Get.context!).colorScheme.primary,
            ),
            backgroundColor: Theme.of(Get.context!).colorScheme.background,
            label: "Add item/list",
            onTap: () {
              Get.bottomSheet(
                Wrap(
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text(
                            "What would you like to add?",
                            style: subtitle,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: (c.showItem.value)
                                ? [
                                    TextButton(
                                      child: Text("Item"),
                                      onPressed: () {
                                        Get.back();
                                        Get.bottomSheet(
                                          AddItem(),
                                          backgroundColor:
                                              Theme.of(Get.context!)
                                                  .colorScheme
                                                  .background,
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
                                    TextButton(
                                      onPressed: () {
                                        Get.back();
                                        Get.bottomSheet(
                                          AddList(),
                                          backgroundColor:
                                              Theme.of(Get.context!)
                                                  .colorScheme
                                                  .background,
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(20),
                                            ),
                                          ),
                                          isScrollControlled: true,
                                        );
                                      },
                                      child: Text("List"),
                                    ),
                                  ]
                                : [
                                    TextButton(
                                      onPressed: () {
                                        Get.back();
                                        Get.bottomSheet(
                                          AddList(),
                                          backgroundColor:
                                              Theme.of(Get.context!)
                                                  .colorScheme
                                                  .background,
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(20),
                                            ),
                                          ),
                                          isScrollControlled: true,
                                        );
                                      },
                                      child: Text("List"),
                                    )
                                  ],
                          ),
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
                isScrollControlled: true,
              );
            },
          ),
          SpeedDialChild(
            child: FaIcon(
              FontAwesomeIcons.gear,
              color: Theme.of(Get.context!).colorScheme.primary,
            ),
            backgroundColor: Theme.of(Get.context!).colorScheme.background,
            label: "Settings",
            onTap: () {
              Get.bottomSheet(
                Settings(),
                backgroundColor: Theme.of(Get.context!).colorScheme.background,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                isScrollControlled: true,
              );
            },
          ),
        ],
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: SafeArea(
          child: Stack(
            children: [
              HomeScreen(),
            ],
          ),
        ),
      ),
    ));
  }
}
