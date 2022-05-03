import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koopy/components/initial_setup/register/image/ImageController.dart';
import 'package:koopy/components/theme.dart';

class Image extends StatelessWidget {
  const Image({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ImageController c = Get.put(ImageController());

    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(Get.context!).size.height,
            width: MediaQuery.of(Get.context!).size.width,
            child: Padding(
              padding: EdgeInsets.all(22.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: SizedBox(),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    curve: Curves.easeInOutCubicEmphasized,
                    child: Text(
                      "Image?",
                      style: title,
                    ),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    curve: Curves.easeInOutCubicEmphasized,
                    child: Text(
                      "Add an image to be more recognizable.",
                      style: subtitle,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: c.fromGallery,
                        child: Text("From gallery"),
                      ),
                      TextButton(
                        onPressed: c.fromCamera,
                        child: Text("Take picture"),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
