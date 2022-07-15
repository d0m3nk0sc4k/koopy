import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ListItem extends StatelessWidget {
  const ListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: const ValueKey(0),
      startActionPane: ActionPane(
        motion: const DrawerMotion(),
        dismissible: DismissiblePane(onDismissed: () {}),
        children: [
          SlidableAction(
            onPressed: (temp) => print("ASD"),
            backgroundColor: Theme.of(Get.context!).colorScheme.primary,
            foregroundColor: Colors.white,
            icon: FontAwesomeIcons.check,
            label: 'Bought',
          ),
          SlidableAction(
            onPressed: (temp) => print("ASD"),
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: FontAwesomeIcons.trashCan,
            label: 'Delete',
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: DrawerMotion(),
        children: [
          SlidableAction(
            onPressed: (temp) => print("ASD"),
            backgroundColor: Theme.of(Get.context!).colorScheme.primary,
            foregroundColor: Colors.white,
            icon: FontAwesomeIcons.check,
            label: 'Bought',
          ),
          SlidableAction(
            onPressed: (temp) => print("ASD"),
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: FontAwesomeIcons.trashCan,
            label: 'Delete',
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () => {},
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Text(
                "asd",
                style: TextStyle(
                  color: Theme.of(Get.context!).colorScheme.onBackground,
                  fontSize: 18,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
