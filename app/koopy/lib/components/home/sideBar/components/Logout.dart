import 'package:flutter/material.dart';

class Logout extends StatelessWidget {
  const Logout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.settings,
          color: Colors.white,
        ),
        SizedBox(
          width: 10,
        ),
        TextButton(
          child: Text(
            "Settings",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          onPressed: () {},
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          "|",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        TextButton(
          child: Text(
            "Log Out",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
