import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:koopy/components/initial_setup/register/family/Family.dart';
import 'package:koopy/main.dart';

class ImageController extends GetxController {
  RxMap<String, double> animationOffsets = {
    "title": 500.0,
    "subtitle": 500.0,
    "takechoose": 500.0,
    "notnow": 500.0,
  }.obs;
  final ImagePicker imagePicker = ImagePicker();
  final storage = GetStorage();

  void next() async {
    Get.off(() => AddFamily());
  }

  @override
  void onReady() async {
    animationOffsets["title"] = 0;
    await Future.delayed(Duration(milliseconds: 100));
    animationOffsets["subtitle"] = 0;
    await Future.delayed(Duration(milliseconds: 50));
    animationOffsets["takechoose"] = 0;
    await Future.delayed(Duration(milliseconds: 100));
    animationOffsets["notnow"] = 0;

    super.onReady();
  }

  void fromCamera() async {
    final XFile? image =
        await imagePicker.pickImage(source: ImageSource.camera);
    if (image != null) {
      await http.post(
        Uri.parse(baseUrl + "image"),
        body: json.encode(
          {
            "user": storage.read("userID"),
            "file": image,
          },
        ),
      ).then((response) {
        if (response.statusCode == 200) {
          next();
        }
      });
    }
  }

  void fromGallery() async {
    final XFile? image =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      await http.post(
        Uri.parse(baseUrl + "image"),
        body: json.encode(
          {
            "user": storage.read("userID"),
            "file": image,
          },
        ),
      ).then((response) {
        if (response.statusCode == 200) {
          next();
        }
      });
    }
  }
}
