import 'package:flutter/material.dart';
import 'package:koopy/components/routes/fadePageRoute.dart';
import 'package:rive/rive.dart';
import 'login/login.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  SMIBool? _loaded;
  double opacity = 1;

  Future gotData() async {
    await Future.delayed(const Duration(seconds: 5));
    _loaded?.change(true);
    await Future.delayed(const Duration(milliseconds: 1000));
  }

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) async {
      await gotData();
      setState(() {
        opacity = 0;
      });
      Navigator.pushReplacement(
        context,
        FadePageRoute(
          const Scaffold(
            body: LoginScreen(),
          ),
        ),
      );
    });
    super.initState();
  }

  void _onInit(Artboard artboard) async {
    final controller =
        StateMachineController.fromArtboard(artboard, 'Splashscreen');
    artboard.addController(controller!);
    _loaded = controller.findInput<bool>('Loaded') as SMIBool;
    // load data from API
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedOpacity(
          opacity: opacity,
          duration: const Duration(milliseconds: 200),
          child: RiveAnimation.asset(
            'assets/animations/splashscreen.riv',
            fit: BoxFit.fitWidth,
            onInit: _onInit,
          ),
        ),
      ),
    );
  }
}
