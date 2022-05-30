import 'package:flutter/material.dart';
import 'package:koopy/components/home/screen/filters/Filters.dart';
import 'package:koopy/components/home/screen/title/Title.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(40),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FamilyTitle(),
            Filters(),
          ],
        ),
      ),
    );
  }
}
