import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import 'package:koopy/main.dart';
import 'dart:convert';

class HomeController extends GetxController {
  RxBool showItem = true.obs;

  @override
  void onReady() async {
    List lists = await getLists();
    showItem.value = !lists.isEmpty;
  }

  Future getLists() async {
    var storage = GetStorage();
    if (storage.read("selectedFamily") == null) {
      var families = await http.get(
          Uri.parse(
              baseUrl + "user/families/" + storage.read("userID").toString()),
          headers: {
            'Authorization': "Bearer " + storage.read("token")
          }).then((value) {
        var data = json.decode(value.body);
        return data;
      });
      storage.write(
          'selectedFamily', families[families.keys.toList()[0]]['id']);
    }
    return await http.get(
      Uri.parse(baseUrl +
          "family/lists/" +
          storage.read("selectedFamily").toString()),
      headers: {"Authorization": "Bearer " + storage.read("token")},
    ).then(
      (value) {
        return json.decode(value.body);
      },
    );
  }
}
