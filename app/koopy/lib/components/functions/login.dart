import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import 'package:koopy/components/functions/Fernet.dart';
import 'package:koopy/components/variables.dart';

Future login(String username, String password) async {
  final storage = GetStorage();

  String temp = encryptFernet("Danes je lep dan");
  String decrypted = decryptFernet(temp);

  print(temp);
  print(decrypted);

  return await http
      .post(Uri.parse(baseUrl + "user/login"),
          body: json.encode({"mail": username, "password": password}))
      .then((value) {
    if (value.statusCode == 200) {
      String token = json.decode(value.body)['token'];
      storage.write('token', token);
      storage.write('username', username);
      storage.write('password', password);
      return {};
    } else {
      return {
        "statusCode": value.statusCode,
        "message": json.decode(value.body)['message']
      };
    }
  });
}
