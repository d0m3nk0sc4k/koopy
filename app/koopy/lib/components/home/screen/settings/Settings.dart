import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:koopy/components/home/screen/settings/FamilyControllerDelete.dart';
import 'package:koopy/main.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FamilyControllerDelete c = Get.put(FamilyControllerDelete());
    var storage = GetStorage();
    return Obx(
      () => ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: (MediaQuery.of(Get.context!).size.height / 6) * 5,
        ),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
          child: Wrap(
            children: [
              Column(
                children: [
                  Text(
                    "Settings",
                    style: TextStyle(
                      color: Theme.of(Get.context!).colorScheme.primary,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Material(
                        elevation: 1,
                        shape: CircleBorder(),
                        clipBehavior: Clip.hardEdge,
                        color: Colors.transparent,
                        child: Ink.image(
                          image: NetworkImage(
                            baseUrl + "image/" + storage.read("profile_img"),
                          ),
                          fit: BoxFit.cover,
                          width: 100,
                          height: 100,
                          child: InkWell(
                            onTap: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Name:",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(storage.read("name")),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Email:",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(storage.read("mail")),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  (c.families.length <= 1) ? SizedBox() : Text(
                    "Leave family",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  (c.families.length <= 1) ? SizedBox() : ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: double.infinity,
                      maxHeight: 100,
                    ),
                    child: ListView(
                      children: c.families,
                      shrinkWrap: true,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
