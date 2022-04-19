import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        TextField(
          autofocus: true,
          decoration: InputDecoration(
            helperText: "Uporabnisko ime"
          ),
        )
      ],
    );
  }
}
