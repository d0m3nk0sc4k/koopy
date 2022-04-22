import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  var baseUrl = "https://koopy.koscak.xyz/api/".obs;
  change() => baseUrl.value = "Ne pa ne";
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Controller c = Get.put(Controller());

    return Scaffold(
      body: Center(
        child: Text("ASD"),
      ),
    );
  }
}
