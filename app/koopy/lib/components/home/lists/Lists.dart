import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koopy/components/home/lists/ListsController.dart';

class Lists extends StatelessWidget {
  const Lists({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ListsController c = Get.put(ListsController());

    return Container(
      child: Center(
        child: Text("asd"),
      ),
    );
  }
}
