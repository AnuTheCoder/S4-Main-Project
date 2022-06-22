import 'package:flutter/material.dart';
import 'package:home/login.dart';
import 'dart:ui' as ui;
import 'package:animated_text_kit/animated_text_kit.dart';



class screenSplash extends StatefulWidget {
  const screenSplash({Key? key}) : super(key: key);

  @override
  State<screenSplash> createState() => _screenSplashState();
}

class _screenSplashState extends State<screenSplash> {
  @override
  void initState() {
    gotoLogin();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
        body: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(width: 20.0, height: 100.0),
              const Text(
                'Be',
                style: TextStyle(fontSize: 43.0),
              ),
              const SizedBox(width: 20.0, height: 100.0),
              DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 40.0,
                  fontFamily: 'Horizon',
                ),
                child: AnimatedTextKit(
                  animatedTexts: [
                    RotateAnimatedText('AWESOME'),
                    RotateAnimatedText('OPTIMISTIC'),
                    RotateAnimatedText('DIFFERENT'),
                  ],
                  onTap: () {
                    print("Tap Event");
                  },
                ),
              ),
            ],
          ),
        ),
          );

  }

  @override
  void dispose() {
  super.initState();
  }
  Future<void> gotoLogin() async {
    await Future.delayed(Duration(seconds: 10));

    Navigator.of(context).push(MaterialPageRoute
      (builder: (ctx) => screenLogin()));
  }
}