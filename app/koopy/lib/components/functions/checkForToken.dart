import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';

String baseUrl = "https://koopy.koscak.xyz/api/";

Future<String> checkForToken() async {
  final storage = GetStorage();
  if (storage.read('token') != null) {
    return storage.read('token');
  } else if (storage.read('username') != null && storage.read('password') != null) {
    String token = "";
    await http.get(Uri.parse(baseUrl+"user/"+storage.read('username'))).then((value) {
      if (value.statusCode == 200) {
        token = value.body;
      }
    });
    return token;
  } else {
    return "";
  }
}

Future login(String username, String password) async {
  final storage = GetStorage();

  return await http.post(Uri.parse(baseUrl+"user/login"), body: json.encode({
    "mail": username,
    "password": password
  })).then((value) {
    if (value.statusCode == 200) {
      String token = json.decode(value.body)['token'];
      storage.write('token', token);
      storage.write('username', username);
      storage.write('password', password);
      return {};
    } else {
      return {"statusCode": value.statusCode, "message": json.decode(value.body)['message']};
    }
  });
}