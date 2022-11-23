import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koopy/components/initial_setup/register/family/AddNewFamilyController.dart';
import 'package:koopy/components/theme.dart';

class AddNewFamily extends StatelessWidget {
  const AddNewFamily({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AddNewFamilyContoller c = Get.put(new AddNewFamilyContoller());

    return Obx(
      () => Scaffold(
        body: Padding(
          padding: EdgeInsets.all(22),
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
                  "Create new family?",
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
              AnimatedContainer(
                duration: Duration(milliseconds: 200),
                curve: Curves.easeInOutCubicEmphasized,
                transform: Matrix4.translationValues(
                    c.animationOffsets["input1"]!, 0, 0),
                child: TextField(
                  controller: c.name,
                  decoration: InputDecoration(
                    label: Text("Name"),
                    labelStyle: TextStyle(
                              color: Theme.of(Get.context!).colorScheme.primary),
                  ),
                ),
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 200),
                curve: Curves.easeInOutCubicEmphasized,
                transform: Matrix4.translationValues(
                    c.animationOffsets["input2"]!, 0, 0),
                child: TextField(
                  controller: c.address,
                  decoration: InputDecoration(
                    label: Text("Address"),
                    labelStyle: TextStyle(
                              color: Theme.of(Get.context!).colorScheme.primary),
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
                    onPressed: c.joinFam,
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      minimumSize: Size.fromHeight(50),
                    ),
                    child: Text(
                      "CREATE",
                      style: TextStyle(
                        color: Theme.of(Get.context!).colorScheme.background,
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
                    c.animationOffsets["button"]!, 0, 0),
                child: TextButton(
                  onPressed: c.createNew,
                  child: Text(
                    "Join existing",
                    style: TextStyle(
                        color: Theme.of(Get.context!).colorScheme.primary),
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
    );
  }
}
