import 'package:flutter/material.dart';
import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';

class Filters extends StatelessWidget {
  const Filters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 60,
      height: 60,
      child: Padding(
        padding: const EdgeInsets.only(top: 18.0),
        child: FadingEdgeScrollView.fromScrollView(
          gradientFractionOnStart: 0.15,
          gradientFractionOnEnd: 0.15,
          child: ListView(
            controller: ScrollController(),
            scrollDirection: Axis.horizontal,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: Chip(
                      label: Text("Hofer"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: Chip(
                      label: Text("Hofer"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: Chip(
                      label: Text("Hofer"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: Chip(
                      label: Text("Hofer"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: Chip(
                      label: Text("Hofer"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: Chip(
                      label: Text("Hofer"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
