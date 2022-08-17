import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koopy/components/home/screen/settings/FamilyControllerDelete.dart';

class FamilyDelete extends StatelessWidget {
  const FamilyDelete({Key? key, required this.familyName, required this.familyId}) : super(key: key);

  final String familyName;
  final int familyId;

  @override
  Widget build(BuildContext context) {
    FamilyControllerDelete tc = Get.find();
    return TextButton(
      onPressed: () {
        Get.defaultDialog(
            title: "Are you sure you want to leave " + familyName + "?",
            middleText: "",
            actions: [
              TextButton(
                onPressed: () {
                  tc.getFamilies();
                  Navigator.pop(Get.context!);
                },
                child: Text(
                  "LEAVE",
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(Get.context!);
                },
                child: Text("CANCEL",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ]);
      },
      child: Text(
        familyName,
        style: TextStyle(
          fontSize: 14,
        ),
      ),
    );
  }
}
