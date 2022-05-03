import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:koopy/components/initial_setup/register/family/Family.dart';
import 'package:koopy/main.dart';

class ImageController extends GetxController {
  final ImagePicker imagePicker = ImagePicker();
  final storage = GetStorage();

  void next() async {
    Get.off(() => AddFamily());
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
