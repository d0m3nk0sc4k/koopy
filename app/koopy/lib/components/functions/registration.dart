import 'package:http/http.dart' as http;
import 'package:koopy/components/variables.dart';

Future<int> checkMail(String mail) async {
  return await http.get(Uri.parse(baseUrl+"user/check/"+mail)).then((value) {
    if (value.statusCode == 200) {
      return 1;
    } else {
      return 0;
    }
  });
}

Future register(String name, String username, String password) async {

}