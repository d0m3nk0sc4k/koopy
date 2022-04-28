import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:koopy/components/functions/EncryptPassword.dart';
import 'package:koopy/components/home/Home.dart';
import 'package:koopy/components/initial_setup/register/mail/MailController.dart';
import 'package:koopy/components/initial_setup/register/name/NameController.dart';
import 'package:koopy/components/initial_setup/register/password/PasswordController.dart';
import 'package:koopy/main.dart';
import 'package:rive/rive.dart';
import 'package:http/http.dart' as http;

class AccountCreationController extends GetxController {
  RxString status = "Checking mail...".obs;
  RxDouble statusOpacity = 0.0.obs;
  RxDouble offset = (-500.0).obs;

  Future registerUser() async {
    MailController mc = Get.find();
    NameController nc = Get.find();
    PasswordController pc = Get.find();

    await http
        .post(
      Uri.parse(baseUrl + "user"),
      body: json.encode(
        {
          "mail": mc.mail.text,
          "name": nc.name.text,
          "password": encryptPassword(pc.password.text)
        },
      ),
    )
        .then(
      (response) {
        if (response.statusCode == 201) {
          final storage = GetStorage();
          storage.write('token', json.decode(response.body)["token"]);
        }
      },
    );
  }

  void onRiveInit(Artboard artboard) {
    final controller =
        StateMachineController.fromArtboard(artboard, "CreatingAccount");
    artboard.addController(controller!);
  }

  @override
  void onReady() async {
    offset.value = 0;
    await Future.delayed(Duration(milliseconds: 1200));
    statusOpacity.value = 1;
    await Future.delayed(Duration(milliseconds: 1000));
    statusOpacity.value = 0;
    await Future.delayed(Duration(milliseconds: 200));
    status.value = "Creating account...";
    statusOpacity.value = 1;
    await registerUser();
    await Future.delayed(Duration(milliseconds: 1500));
    statusOpacity.value = 0;
    await Future.delayed(Duration(milliseconds: 200));
    status.value = "Account created successfully!";
    statusOpacity.value = 1;
    await Future.delayed(Duration(milliseconds: 1000));
    statusOpacity.value = 0;
    offset.value = 500;
    await Future.delayed(Duration(milliseconds: 500));
    Get.to(() => Home());
    super.onReady();
  }
}