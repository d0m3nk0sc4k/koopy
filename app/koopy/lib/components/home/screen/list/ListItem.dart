import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
          SlidableAction(
            onPressed: (temp) => print("ASD"),
            backgroundColor: Color(0xFF21B7CA),
            foregroundColor: Colors.white,
            icon: Icons.share,
            label: 'Share',
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: DrawerMotion(),
        children: [
          SlidableAction(
            flex: 2,
            onPressed: (temp) => print("ASD"),
            backgroundColor: Color(0xFF7BC043),
            foregroundColor: Colors.white,
            icon: Icons.archive,
            label: 'Archive',
          ),
          SlidableAction(
            onPressed: (temp) => print("ASD"),
            backgroundColor: Color(0xFF0392CF),
            foregroundColor: Colors.white,
            icon: Icons.save,
            label: 'Save',
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () => {},
        child: Container(
          color:
              Theme.of(Get.context!).colorScheme.onBackground.withOpacity(.2),
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          child: Row(children: [
            Text(
              "asd",
              style: TextStyle(
                color: Theme.of(Get.context!).colorScheme.onBackground,
                fontSize: 18,
              ),
            )
          ]),
        ),
      ),
    );
  }
}
