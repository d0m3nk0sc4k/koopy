import 'dart:convert';
import 'dart:typed_data';
import 'package:encrypt/encrypt.dart' as e;

var key = e.Key.fromUtf8("2Fh@3XtKdnnrM7W#ZzX&6oGm^#A^rGs#");
var b64key = e.Key.fromBase64(base64Url.encode(key.bytes));
var fernet = e.Fernet(b64key);
var encrypter = e.Encrypter(fernet);

String encryptFernet(password) {
  var fernetEncrypted = encrypter.encrypt(password);
  return fernetEncrypted.base64;
}

String decryptFernet(password) {
  List<int> list = password.codeUnits;
  Uint8List bytes = Uint8List.fromList(list);
  var encrypted = e.Encrypted(bytes);
  var fernetDecrypted = encrypter.decrypt(encrypted);
  return fernetDecrypted;
}
