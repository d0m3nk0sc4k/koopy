import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koopy/components/initial_setup/register/family/FamilyController.dart';
import 'package:koopy/components/theme.dart';

class AddFamily extends StatelessWidget {
  const AddFamily({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FamilyController c = Get.put(FamilyController());

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
                      child: TextField(
                        controller: c.name,
                        decoration: InputDecoration(
                          label: Text("Name"),
                          isDense: true,
                        ),
                      ),
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      child: TextField(
                        controller: c.address,
                        decoration: InputDecoration(
                          label: Text("Address"),
                          isDense: true,
                        ),
                      ),
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 200),
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
                              color: light.background,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      onPressed: c.notNow,
                      child: Text(
                        "Not now",
                        style: TextStyle(color: light.primary),
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
