import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  String imageUrl, name, mail;

  Avatar({Key? key, required this.imageUrl, required this.name, required this.mail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  blurRadius: 5,
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 5,
                )
              ]),
          child: CircleAvatar(
            radius: 22,
            backgroundImage: NetworkImage(
              imageUrl,
            ),
          ),
        ),
        SizedBox(
          width: 24,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            Text(
              mail,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
