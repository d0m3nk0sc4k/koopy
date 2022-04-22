import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {

}

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RegisterController registerController = Get.put(RegisterController());

    return Container();
  }
}