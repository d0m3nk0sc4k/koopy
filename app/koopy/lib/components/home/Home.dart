import 'package:flutter/material.dart';
import 'package:koopy/components/home/lists/Lists.dart';
import 'package:koopy/components/home/sideBar/SideBar.dart';
import 'package:koopy/components/theme.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: light.primary,
      body: Stack(
        children: [
          SideBar(),
          Lists(),
        ],
      ),
    );
  }
}