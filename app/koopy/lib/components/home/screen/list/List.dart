import 'package:flutter/material.dart';
import 'dart:math';
import 'package:figma_squircle/figma_squircle.dart';

class List extends StatelessWidget {
  const List({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      decoration: ShapeDecoration(
        shape: SmoothRectangleBorder(
            borderRadius: SmoothBorderRadius(
          cornerRadius: 40,
          cornerSmoothing: 1,
        )),
        image: DecorationImage(
          image: AssetImage(
              "assets/images/cards/" + Random().nextInt(4).toString() + ".png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        margin: EdgeInsets.fromLTRB(15, 15, 0, 0),
        child: Text(
          "Zmrznjene jagode",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
