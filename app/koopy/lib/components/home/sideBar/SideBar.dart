import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:koopy/components/home/Home.dart';
import 'package:koopy/components/home/sideBar/SideBarController.dart';
import 'package:koopy/components/home/sideBar/components/Avatar.dart';
import 'package:koopy/components/home/sideBar/components/Logout.dart';
import 'package:koopy/components/home/sideBar/components/SideBarItem.dart';

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SideBarController c = Get.put(SideBarController());
    final storage = GetStorage();

    return Padding(
      padding: const EdgeInsets.all(22.0),
      child: Column(
        children: [
          Avatar(
            imageUrl: "https://avatars.githubusercontent.com/u/35147412?v=4",
            name: storage.read('userData')['name'],
            mail: storage.read('userData')['mail'],
          ),
          Expanded(
            child: Container(),
          ),
          SideBarItem(
            text: "Lists",
            icon: Icons.list,
            whereTo: Home(),
          ),
          SideBarItem(
            text: "Families",
            icon: Icons.family_restroom,
            whereTo: Home(),
          ),
          SideBarItem(
            text: "History",
            icon: Icons.history,
            whereTo: Home(),
          ),
          Expanded(
            child: Container(),
          ),
          Logout(),
        ],
      ),
    );
  }
}
