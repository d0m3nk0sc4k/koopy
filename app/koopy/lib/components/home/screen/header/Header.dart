import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:koopy/components/home/screen/header/HeaderController.dart';
import 'package:koopy/main.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HeaderController c = Get.find();

    return Obx(
      () => Container(
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Family",
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(Get.context!).colorScheme.primary,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      c.openFamilyPicker();
                    },
                    child: Row(
                      children: [
                        Text(
                          c.name.value,
                          style: TextStyle(
                            fontSize: 26,
                            color:
                                Theme.of(Get.context!).colorScheme.onBackground,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        FaIcon(
                          FontAwesomeIcons.caretDown,
                          color: Theme.of(Get.context!).colorScheme.primary,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            CircleAvatar(
              backgroundImage: NetworkImage(
                baseUrl + "image/" + c.storage.read("profile_img"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
