import 'package:flutter/material.dart';
import 'package:koopy/components/home/screen/header/Header.dart';
import 'package:koopy/components/home/screen/list/List.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Header(),
          ),
          SizedBox(
            height: 10,
          ),
          List(),
        ],
      ),
    );
  }
}
