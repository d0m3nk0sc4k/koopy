import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class SimpleStateMachine extends StatefulWidget {
  const SimpleStateMachine({Key? key}) : super(key: key);

  @override
  _SimpleStateMachineState createState() => _SimpleStateMachineState();
}

class _SimpleStateMachineState extends State<SimpleStateMachine> {
  SMIBool? _loaded;

  void _onInit(Artboard artboard) async {
    final controller =
        StateMachineController.fromArtboard(artboard, 'Splashscreen');
    artboard.addController(controller!);
    _loaded = controller.findInput<bool>('Loaded') as SMIBool;
    // load data from API
    //await Future.delayed(const Duration(seconds: 5));
    //_loaded?.change(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RiveAnimation.asset(
          'assets/animations/splashscreen.riv',
          fit: BoxFit.fitWidth,
          onInit: _onInit,
        ),
      ),
    );
  }
}
