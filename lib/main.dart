import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Screens/SplashScreen.dart';
import 'Screens/HomePage.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

void main() => runApp(MyApp());
const MaterialColor myColor =
    const MaterialColor(0xFFF54D6E, const <int, Color>{
  50: const Color(0xFFF54D6E),
  100: const Color(0xFFF54D6E),
  200: const Color(0xFFF54D6E),
  300: const Color(0xFFF54D6E),
  400: const Color(0xFFF54D6E),
  500: const Color(0xFFF54D6E),
  600: const Color(0xFFF54D6E),
  700: const Color(0xFFF54D6E),
  800: const Color(0xFFF54D6E),
  900: const Color(0xFFF54D6E),
});

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light));

    FlutterStatusbarcolor.setNavigationBarColor(Colors.white);
    FlutterStatusbarcolor.setStatusBarColor(Colors.white);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "GoDelivery",
      theme: ThemeData(
        primarySwatch: myColor,
        accentColor: Color(0xFFF54D6E),
        primaryColor: Color(0xFFF54D6E),
      ),
      // home: SplashScreen(),
      home: HomePage(),
    );
  }
}
