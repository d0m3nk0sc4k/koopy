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
      storage.write('userID', json.decode(value.body)['id']);
      await http.get(Uri.parse(baseUrl + "user/" + storage.read('userID').toString()), headers: {
        'Authorization': "Bearer " + token
      }).then((value) {
        if (value.statusCode == 200) {
          storage.write('userData', jsonDecode(value.body));
        }
        print(value.body);
      });
      return {};
    } else {
      return {
        "statusCode": value.statusCode,
        "message": json.decode(value.body)['message']
      };
    }
  });
}