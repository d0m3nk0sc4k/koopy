import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:koopy/components/home/screen/header/HeaderController.dart';
import 'package:koopy/main.dart';

class HomeScreenController extends GetxController {
  GetStorage storage = GetStorage();

  @override
  void onReady() {
    HeaderController hc = Get.find();

    print(hc.id.value);
  }

  Future getFamilies() async {
    return await http.get(
        Uri.parse(
          baseUrl + "user/families/" + storage.read("userID").toString(),
        ),
        headers: {
          "Authorization": "Bearer " + storage.read("token")
        }).then((value) {
      return value.body;
    });
  }
}
