import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:koopy/components/home/screen/HomeScreenController.dart';
import 'package:koopy/components/home/screen/header/Header.dart';
import 'package:koopy/components/home/screen/header/HeaderController.dart';
import 'package:koopy/components/home/screen/list/List.dart' as myList;
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:koopy/main.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeScreenController c = Get.put(HomeScreenController());
    HeaderController hc = Get.put(HeaderController());

    return Obx(
      () => Container(
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
                    blurRadius: 10,
                  )
                ],
                color: Theme.of(Get.context!).colorScheme.background,
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 40.0,
                  right: 40.0,
                  bottom: 20.0,
                  top: 40.0,
                ),
                child: Header(),
              ),
            ),
            Expanded(
              child: ListView(
                children: c.widgets,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
