import 'package:flutter/material.dart';
import 'package:home/splash.dart';

void main() async{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HOME',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: screenSplash(),
    );
  }
}