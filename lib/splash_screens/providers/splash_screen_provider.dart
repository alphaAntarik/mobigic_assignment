import 'package:flutter/material.dart';
import 'package:mobigic_antarik/home_screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenProvider extends ChangeNotifier {
  bool? _isplayed = false;
  bool? get isplayed => _isplayed;

  void set_isplayed() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isplayed', true);
    _isplayed = prefs.getBool('isplayed');
    notifyListeners();
  }

  Future<void> get_isplayed() async {
    final prefs = await SharedPreferences.getInstance();

    _isplayed = prefs.getBool('isplayed') ?? false;
    notifyListeners();
  }

  void gotoHomeCSreen(BuildContext context) async {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, HomeScreen.homescreenroute);
    });
  }
}
