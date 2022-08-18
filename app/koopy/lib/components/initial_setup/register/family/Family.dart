import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koopy/components/initial_setup/register/family/FamilyController.dart';
import 'package:koopy/components/theme.dart';

class AddFamily extends StatelessWidget {
  const AddFamily({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FamilyController c = Get.put(new FamilyController());

    return Obx(
      () => Scaffold(
        body: ListView(
          children: [
            Container(
              height: MediaQuery.of(Get.context!).size.height,
              width: MediaQuery.of(Get.context!).size.width,
              child: Padding(
                padding: const EdgeInsets.all(22.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SizedBox(),
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      curve: Curves.easeInOutCubicEmphasized,
                      transform: Matrix4.translationValues(
                          c.animationOffsets["title"]!, 0, 0),
                      child: Text(
                        "Join a family?",
                        style: title,
                      ),
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      curve: Curves.easeInOutCubicEmphasized,
                      transform: Matrix4.translationValues(
                          c.animationOffsets["subtitle"]!, 0, 0),
                      child: Text(
                        "Families are a way to share your lists between users.",
                        style: subtitle,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: c.readQR,
                          icon: Icon(Icons.qr_code),
                        ),
                      ],
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      transform: Matrix4.translationValues(
                          c.animationOffsets["input"]!, 0, 0),
                      child: TextField(
                        controller: c.joinKey,
                        decoration: InputDecoration(
                          label: Text("Join key"),
                          isDense: true,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      curve: Curves.easeInOutCubicEmphasized,
                      transform: Matrix4.translationValues(
                          c.animationOffsets["button"]!, 0, 0),
                      child: Center(
                        child: ElevatedButton(
                          onPressed: c.disabled.value ? null : c.joinFam,
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            minimumSize: Size.fromHeight(50),
                          ),
                          child: Text(
                            "JOIN",
                            style: TextStyle(
                              color: Theme.of(Get.context!)
                                  .colorScheme
                                  .onBackground,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      curve: Curves.easeInOutCubicEmphasized,
                      transform: Matrix4.translationValues(
                        c.animationOffsets["button"]!,
                        0,
                        0,
                      ),
                      child: TextButton(
                        onPressed: c.createNew,
                        child: Text(
                          "Create new",
                          style: TextStyle(
                              color:
                                  Theme.of(Get.context!).colorScheme.primary),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
