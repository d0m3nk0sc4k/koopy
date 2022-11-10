import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
              AnimatedContainer(
                duration: Duration(milliseconds: 200),
                transform: Matrix4.translationValues(
                    c.animationOffsets["input"]!, 0, 0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: c.joinKey,
                        decoration: InputDecoration(
                          label: Text("Join key"),
                          labelStyle: TextStyle(
                              color: Theme.of(Get.context!).colorScheme.primary),
                        ),
                      ),
                    ),
                    IconButton(
                      splashRadius: 2,
                      iconSize: 18,
                      onPressed: () async {
                        String barcodeScanRes =
                            await FlutterBarcodeScanner.scanBarcode(
                          "#000000",
                          "Cancel",
                          false,
                          ScanMode.QR,
                        );
                        c.joinKey.text = barcodeScanRes;
                      },
                      icon: FaIcon(FontAwesomeIcons.qrcode, color: Theme.of(Get.context!).colorScheme.onBackground,),
                    ),
                  ],
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
                      "JOIN",
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
                  c.animationOffsets["button"]!,
                  0,
                  0,
                ),
                child: TextButton(
                  onPressed: c.createNew,
                  child: Text(
                    "Create new",
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
