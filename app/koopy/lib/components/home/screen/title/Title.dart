import 'package:flutter/material.dart';

class FamilyTitle extends StatelessWidget {
  const FamilyTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Family:",
          textAlign: TextAlign.start,
          style: TextStyle(
            color: Color(0xFF8B8B8B),
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        Text(
          "Koscak",
          textAlign: TextAlign.start,
          style: TextStyle(
            color: Color(0xFF242424),
            fontWeight: FontWeight.w900,
            fontSize: 22,
          ),
        ),
      ],
    );
  }
}
