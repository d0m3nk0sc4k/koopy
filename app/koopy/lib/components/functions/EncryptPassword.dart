import 'dart:convert';

import 'package:encrypt/encrypt.dart';

final key = Key.fromUtf8("peePvDihmFSNBns&dSb*4mLn4TMH4&8EYrJ7CGic#iJ63EqY26*H7BGhS^#6rGYQ");
final iv = IV.fromUtf8("XkJ!D2Wn");
final encrypter = Encrypter(Salsa20(key));

String encryptPassword(String password) {
  var encrypted = encrypter.encrypt(password, iv: iv);
  return encrypted.base64;
}

String decryptPassword(String password) {
  var decrypted = encrypter.decrypt(Encrypted.fromBase64(password), iv: iv);
  return decrypted;
}
