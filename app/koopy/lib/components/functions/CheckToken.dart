import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import 'package:koopy/components/functions/Login.dart';
import 'package:koopy/main.dart';

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

  /*
  if (storage.read('token') != null) {
    return await http.get(
        Uri.parse(baseUrl + "user/" + storage.read('userID').toString()),
        headers: {
          'Authorization': "Bearer " + storage.read('token')
        }).then((response) async {
      if (response.statusCode == 401) {
        if (storage.read('username') != null &&
            storage.read('password') != null) {
          await login(storage.read('username'), storage.read('password'));
          await http.get(
              Uri.parse(baseUrl + "user/" + storage.read('userID').toString()),
              headers: {
                'Authorization': "Bearer " + storage.read('token')
              }).then((response) async {
            if (response.statusCode == 200) {
              storage.write('userData', json.decode(response.body));
            }
          });
          return storage.read('token');
        } else {
          return "";
        }
      } else {
        return storage.read('token');
      }
    });
  } else if (storage.read('username') != null &&
      storage.read('password') != null) {
    await login(storage.read('username'), storage.read('password'));
    await http.get(
        Uri.parse(baseUrl + "user/" + storage.read('userID').toString()),
        headers: {
          'Authorization': "Bearer " + storage.read('token')
        }).then((response) async {
      if (response.statusCode == 200) {
        storage.write('userData', json.decode(response.body));
      }
    });
    return storage.read('token');
  } else {
    return "";
  }*/
}
