import 'package:get_storage/get_storage.dart';
import 'package:koopy/components/functions/Login.dart';

Future<String> CheckToken() async {
  final storage = GetStorage();

  String? username = await storage.read("username");
  String? password = await storage.read("password");

  if (username == null || password == null) {
    return "";
  } else {
    var temp = await login(username, password).then((value) {
      if (value == "") {
        return "OK";
      } else {
        return "";
      }
    });
    return temp;
  }
}
