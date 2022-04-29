import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideBarItem extends StatelessWidget {
  String text;
  IconData icon;
  Widget whereTo;
  SideBarItem(
      {Key? key, required this.text, required this.icon, required this.whereTo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextButton(
        onPressed: () {
          Get.to(() => whereTo);
        },
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
