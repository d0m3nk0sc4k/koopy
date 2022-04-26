import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koopy/components/register/name/NameController.dart';
import 'package:koopy/components/theme.dart';

class Name extends StatelessWidget {
  const Name({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NameController c = Get.put(NameController());

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
                        "A little info about you!",
                        style: title,
                      ),
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      curve: Curves.easeInOutCubicEmphasized,
                      transform: Matrix4.translationValues(
                          c.animationOffsets["subtitle"]!, 0, 0),
                      child: Text(
                        "Can you tell me your name?",
                        style: subtitle,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    AnimatedContainer(
                      curve: Curves.easeInOutCubic,
                      duration: Duration(milliseconds: 200),
                      transform: Matrix4.translationValues(
                          c.animationOffsets["input"]!, 0, 0),
                      child: TextField(
                        controller: c.name,
                        style: TextStyle(color: light.primary),
                        cursorColor: light.primary,
                        decoration: InputDecoration(
                          labelText: "Name",
                          labelStyle: TextStyle(color: light.primary),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      curve: Curves.easeInOutCubicEmphasized,
                      transform: Matrix4.translationValues(
                          c.animationOffsets["button"]!, 0, 0),
                      child: Center(
                        child: ElevatedButton(
                          onPressed: c.next,
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            minimumSize: Size.fromHeight(50),
                          ),
                          child: Text(
                            "NEXT",
                            style: TextStyle(
                              color: light.background,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(),
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      curve: Curves.easeInOutCubic,
                      transform: Matrix4.translationValues(
                          c.animationOffsets["signIn"]!, 0, 0),
                      child: TextButton(
                        onPressed: c.next,
                        child: Text(
                          "Want to sign in?",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
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
