import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koopy/components/home/screen/HomeScreen.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      backgroundColor: Theme.of(Get.context!).colorScheme.background,
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
