import 'dart:async';
import 'package:flutter/material.dart';
import '../HomePage/home_screen.dart';
import '../loginpage/login_screen.dart';
import '../resources/media_query.dart';
import '../resources/shared_pref.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigator();
  }

  navigator() {
    bool isLogin = SharedPref.getBool('ISLOGIN');
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                isLogin ? const HomeScreen() : const LoginScreen(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryUse.onInitMq(context);

    return Scaffold(
      body: Container(
        color: Colors.amber,
        child: Center(
            child: Icon(Icons.person_2_sharp, size: MediaQueryUse.height * .1)),
      ),
    );
  }
}
