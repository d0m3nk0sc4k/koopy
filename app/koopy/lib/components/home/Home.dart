import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:koopy/components/home/screen/HomeScreen.dart';
import 'package:koopy/components/home/screen/settings/Settings.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var storage = GetStorage();

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
            label: "Add item",
            onTap: () {},
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
      body: SafeArea(
        child: Stack(
          children: [
            HomeScreen(),
          ],
        ),
      ),
    ));
  }
}
