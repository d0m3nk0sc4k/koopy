import 'package:flutter/material.dart';
import 'package:koopy/components/login/loginForm.dart';

import 'loginBackscreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const LoginBackscreen(),
        LoginForm(),
      ],
    );
  }
}
