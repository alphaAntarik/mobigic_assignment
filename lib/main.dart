import 'package:flutter/material.dart';
import 'package:mobigic_antarik/home_screens/home_screen.dart';
import 'package:mobigic_antarik/home_screens/providers/homescreen_provider.dart';
import 'package:mobigic_antarik/splash_screens/providers/splash_screen_provider.dart';
import 'package:mobigic_antarik/splash_screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => SplashScreenProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => HomeScreenProvider(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SplashScreenProvider splashScreenProvider =
        Provider.of<SplashScreenProvider>(context, listen: false);

    return FutureBuilder(
      future: splashScreenProvider.get_isplayed(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Mobigic',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            initialRoute: splashScreenProvider.isplayed!
                ? HomeScreen.homescreenroute
                : SplashScreen.splashscreenroute,
            routes: {
              SplashScreen.splashscreenroute: (context) => const SplashScreen(),
              HomeScreen.homescreenroute: (context) => const HomeScreen(),
            },
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
