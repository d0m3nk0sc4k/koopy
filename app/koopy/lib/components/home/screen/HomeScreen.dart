import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:koopy/components/home/screen/HomeScreenController.dart';
import 'package:koopy/components/home/screen/header/Header.dart';
import 'package:koopy/components/home/screen/header/HeaderController.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeScreenController c = Get.put(HomeScreenController());
    HeaderController hc = Get.put(HeaderController());

    return Obx(
      () => Container(
        height: MediaQuery.of(Get.context!).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Theme.of(Get.context!)
                          .colorScheme
                          .onBackground
                          .withOpacity(.2),
                      blurRadius: 4,
                      offset: Offset(0, 4))
                ],
                color: Theme.of(Get.context!).colorScheme.background,
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 40.0,
                  right: 40.0,
                  bottom: 20.0,
                  top: 10.0,
                ),
                child: Header(),
              ),
            ),
            Expanded(
              child: RefreshIndicator(
                backgroundColor: Theme.of(Get.context!).colorScheme.background,
                child: ListView(
                  children: c.widgets,
                ),
                onRefresh: () {
                  c.getLists();
                  return Future(
                    () {},
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
