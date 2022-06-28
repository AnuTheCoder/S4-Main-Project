
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pop(context);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color:  Colors.white,
      child: AnimatedTextKit(
        animatedTexts: [
          WavyAnimatedText('SMART HOME'
            , textStyle: const TextStyle(
              fontSize: 32.0,
                decoration: TextDecoration.none,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontFamily: 'RobotoSlab'
            ),
          ),
          WavyAnimatedText('SMART LIFE'
            , textStyle: const TextStyle(
              fontSize: 32.0,
                decoration: TextDecoration.none,
              fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: 'RobotoSlab'
            ),
          ),
        ],
        isRepeatingAnimation: true,
        onTap: () {
          print("Tap Event");
        },
      ),




      /*const Text('ENERGY PROJECT',
        style: TextStyle(
          decoration: TextDecoration.none,
          fontSize: 40,
          fontFamily: 'RobotoSlab',
          color: Colors.white,
        ),
      ),*/
    );
  }
}
