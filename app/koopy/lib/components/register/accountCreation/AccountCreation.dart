import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koopy/components/register/accountCreation/AccountCreationController.dart';
import 'package:rive/rive.dart';

class AccountCreation extends StatelessWidget {
  const AccountCreation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final c = Get.put(AccountCreationController());

    return Obx(
      () => Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              transform: Matrix4.translationValues(c.offset.value, 0, 0),
              height: 200,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: RiveAnimation.asset(
                  "assets/animations/accountCreation.riv",
                  fit: BoxFit.contain,
                  onInit: c.onRiveInit,
                ),
              ),
            ),
            AnimatedOpacity(
              opacity: c.statusOpacity.value,
              duration: Duration(
                milliseconds: 200,
              ),
              child: Text(c.status.value),
            ),
          ],
        ),
      ),
    );
  }
}
