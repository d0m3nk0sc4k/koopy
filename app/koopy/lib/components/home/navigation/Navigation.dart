import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koopy/components/home/navigation/NavigationController.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Navigation extends StatelessWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NavigationController c = Get.put(NavigationController());

    return Obx(
      () => Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.all(26),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(Get.context!).colorScheme.surface,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ClipOval(
                    child: Material(
                      color: Theme.of(Get.context!).colorScheme.surface,
                      child: InkWell(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () {
                          c.changePage("Home");
                        },
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: SizedBox(
                            width: 26,
                            height: 26,
                            child: Center(
                              child: FaIcon(
                                FontAwesomeIcons.house,
                                color: Theme.of(Get.context!)
                                    .colorScheme
                                    .onSurface
                                    .withOpacity(c.opacities["Home"]!.value),
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  ClipOval(
                    child: Material(
                      color: Theme.of(Get.context!).colorScheme.surface,
                      child: InkWell(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () {
                          c.changePage("Lists");
                        },
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: SizedBox(
                            width: 26,
                            height: 26,
                            child: Center(
                              child: FaIcon(
                                FontAwesomeIcons.listCheck,
                                color: Theme.of(Get.context!)
                                    .colorScheme
                                    .onSurface
                                    .withOpacity(c.opacities["Lists"]!.value),
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  ClipOval(
                    child: Material(
                      color: Theme.of(Get.context!).colorScheme.surface,
                      child: InkWell(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () {
                          c.changePage("Family");
                        },
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: SizedBox(
                            width: 26,
                            height: 26,
                            child: Center(
                              child: FaIcon(
                                FontAwesomeIcons.peopleGroup,
                                color: Theme.of(Get.context!)
                                    .colorScheme
                                    .onSurface
                                    .withOpacity(c.opacities["Family"]!.value),
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  ClipOval(
                    child: Material(
                      color: Theme.of(Get.context!).colorScheme.surface,
                      child: InkWell(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () {
                          c.changePage("Settings");
                        },
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: SizedBox(
                            width: 26,
                            height: 26,
                            child: Center(
                              child: FaIcon(
                                FontAwesomeIcons.gears,
                                color: Theme.of(Get.context!)
                                    .colorScheme
                                    .onSurface
                                    .withOpacity(
                                        c.opacities["Settings"]!.value),
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
