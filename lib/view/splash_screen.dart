import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    final height = MediaQuery.sizeOf(context).height * 0.5;
    final width = MediaQuery.sizeOf(context).width * 0.5;
    return Scaffold(
      body: Container(
          height: height * 9,
          width: width * 9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                  image: AssetImage('images/sust-2-sin.jpg'), fit: BoxFit.fill),
            ],
          )),
    );
  }
}
