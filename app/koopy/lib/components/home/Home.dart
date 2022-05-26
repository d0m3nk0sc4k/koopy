import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koopy/components/home/lists/Lists.dart';
import 'package:koopy/components/home/navigation/Navigation.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(Get.context!).colorScheme.background,
        body: Stack(
          children: [
            Navigation(),
            Lists(),
          ],
        ),
      ),
    );
  }
}
