import 'package:flutter/material.dart';
import 'package:mobigic_antarik/splash_screens/providers/splash_screen_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  static String splashscreenroute = '/splashscreenroute';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SplashScreenProvider splashScreenProvider =
        Provider.of(context, listen: false);
    splashScreenProvider.set_isplayed();
  }

  @override
  Widget build(BuildContext context) {
    SplashScreenProvider splashScreenProvider =
        Provider.of(context, listen: false);
    splashScreenProvider.gotoHomeCSreen(context);
    return Scaffold(
      body: Center(child: Text('splash screen')),
    );
  }
}
