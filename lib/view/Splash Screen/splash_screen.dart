// ignore_for_file: use_key_in_widget_constructors

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news_app/view/home%20screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image(
                image: AssetImage(
                  'images/7496275.jpg',
                ),
                fit: BoxFit.cover,
              ),
              SpinKitCircle(
                color: Colors.green,
                size: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
