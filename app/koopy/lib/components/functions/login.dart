import 'package:get_storage/get_storage.dart';
import 'package:koopy/main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future login(String username, String password) async {
  final storage = GetStorage();

  return await http
      .post(Uri.parse(baseUrl + "user/login"),
          body: json.encode({"mail": username, "password": password}))
      .then((value) async {
    if (value.statusCode == 200) {
      String token = json.decode(value.body)['token'];
      storage.write('token', token);
      storage.write('username', username);
      storage.write('password', password);
      storage.write('name', json.decode(value.body)['name']);
      storage.write('userID', json.decode(value.body)['id']);
      storage.write('profile_img', json.decode(value.body)['profile_img']);
      storage.write("mail", json.decode(value.body)["mail"]);
      print(json.decode(value.body));
      return "";
    } else {
      return {
        "statusCode": value.statusCode,
        "message": json.decode(value.body)['message']
      };
    }
  });
}