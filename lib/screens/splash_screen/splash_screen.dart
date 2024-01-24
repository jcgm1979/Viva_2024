import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';
import 'package:viva_2024/screens/login_screen.dart';
import 'package:viva_2024/screens/radio_screen.dart';

import '../../providers/signIn_provider.dart';
import '../../utils/next_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // init state
  @override
  void initState() {
    final sp = context.read<SignInProvider>();
    super.initState();
    // create a timer of 2 seconds
    Timer(const Duration(seconds: 2), () {
      sp.isSignedIn == false
          ? nextScreen(context, const LoginScreen())
          : nextScreen(context, const RadioScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Stack(children: [
      Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(color: Colors.black38),
        child: Image.asset(
          'assets/bk-login.png',
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: screenHeight * 0.15),
        child: Container(
          width: double.infinity,
          height: screenHeight * 0.15,
          decoration: const BoxDecoration(
            color: Color(0x00FFFFFF),
            shape: BoxShape.rectangle,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: double.infinity,
                height: screenHeight * 0.09,
                decoration: const BoxDecoration(
                  color: Color(0x00FFFFFF),
                ),
                child: Image.asset(
                  'assets/logo-horizontal-2023.png',
                  width: 150,
                  height: 10,
                  fit: BoxFit.contain,
                ),
              ),
              Container(
                width: double.infinity,
                height: screenHeight * 0.03,
                decoration: const BoxDecoration(
                  color: Color(0x00FFFFFF),
                ),
                child: Text('La primera radio smart del Perú',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    )),
              ),
            ],
          ),
        ),
      )
    ]));
  }
}
