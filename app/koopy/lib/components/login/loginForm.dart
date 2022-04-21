import 'package:flutter/material.dart';
import 'package:koopy/theme/theme.dart';

class LoginForm extends StatefulWidget {
  LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  static double offset1 = 50;
  static double offset2 = 50;
  static double opacity1 = 0;
  static double opacity2 = 0;

  void loadFields() async {
    await Future.delayed(const Duration(milliseconds: 300));
    setState(() {
      offset1 = 1;
      opacity1 = 1;
    });
    await Future.delayed(const Duration(milliseconds: 100));
    setState(() {
      offset2 = 1;
      opacity2 = 1;
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) async {
      await Future.delayed(const Duration(milliseconds: 200));
      loadFields();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 150,
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOutCubic,
              transform: Matrix4.translationValues(1, offset1, 1),
              child: AnimatedOpacity(
                opacity: opacity1,
                duration: const Duration(milliseconds: 200),
                child: TextField(
                  cursorColor: theme.colorScheme.primary,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: theme.colorScheme.primary,
                  ),
                  decoration: InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    hintText: "E-poštni naslov",
                    hintStyle: TextStyle(
                      color: theme.colorScheme.primary.withAlpha(150),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOutCubic,
          transform: Matrix4.translationValues(1, offset2, 1),
          child: AnimatedOpacity(
            opacity: opacity2,
            duration: const Duration(milliseconds: 200),
            child: ElevatedButton(
              onPressed: () {},
              child: const Padding(
                child: Text(
                  "NEXT",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              ),
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
