import 'package:flutter/material.dart';
import 'package:paysmartchallenge/splash_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(
        title: '',
      ),
      theme:
          ThemeData(brightness: Brightness.dark, primaryColor: Colors.yellow),
      debugShowCheckedModeBanner: false,
    );
  }
}
