import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koopy/components/initial_setup/register/mail/MailController.dart';
import 'package:koopy/components/theme.dart';

class Mail extends StatelessWidget {
  const Mail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MailController c = Get.put(MailController());

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
                        "Welcome!",
                        style: title,
                      ),
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      curve: Curves.easeInOutCubicEmphasized,
                      transform: Matrix4.translationValues(
                          c.animationOffsets["subtitle"]!, 0, 0),
                      child: Text(
                        "It is good to see you!",
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
                        c.animationOffsets["input"]!,
                        0,
                        0,
                      ),
                      child: TextField(
                        controller: c.mail,
                        style: TextStyle(
                          color: Theme.of(Get.context!).colorScheme.primary,
                        ),
                        cursorColor: Theme.of(Get.context!).colorScheme.primary,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: "E-Mail",
                          labelStyle: TextStyle(
                            color: Theme.of(Get.context!).colorScheme.primary,
                          ),
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
                          onPressed: () => c.checkMail(),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            minimumSize: Size.fromHeight(50),
                          ),
                          child: Text(
                            "NEXT",
                            style: TextStyle(
                              color:
                                  Theme.of(Get.context!).colorScheme.background,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
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
