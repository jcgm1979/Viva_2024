import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:viva_2024/providers/signIn_provider.dart';

import '../providers/internet_provider.dart';
import '../utils/button_widgets.dart';
import '../utils/next_screen.dart';
import '../utils/snack_bar.dart';
import 'login_phone/phoneauth_screen.dart';
import 'radio_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final RoundedLoadingButtonController googleController =
      RoundedLoadingButtonController();
  final RoundedLoadingButtonController phoneController =
      RoundedLoadingButtonController();

  bool isGoogleButtonLoading = false;
  bool isAppleButtonLoading = false;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Define el porcentaje de padding que deseas aplicar (ejemplo: 5%)
    double paddingPercentage = 0.05;

    // Calcula el valor de padding proporcional al tamaño de la pantalla
    double paddingValue = screenWidth * paddingPercentage;

    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Stack(
          children: [
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
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: paddingValue * 10),
              child: SizedBox(
                width: double.infinity,
                child: Center(
                  child: Container(
                    width: screenWidth * 1,
                    height: screenHeight * 0.2,
                    decoration: const BoxDecoration(
                        //color: Colors.white38,
                        ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0, 0),
                          child: ButtonWidget(
                            onPressed: () {
                              isGoogleButtonLoading
                                  ? null
                                  : handleGoogleSignIn();
                            },
                            text: 'Ingresa con Google',
                            icon: isGoogleButtonLoading
                                ? const SpinKitCircle(
                                    color: Colors.white,
                                    size: 25.0,
                                  )
                                : const Icon(
                                    FontAwesomeIcons.google,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                            options: const ButtonOptions(
                              iconPadding: EdgeInsets.only(left: 20),
                              width: 300,
                              height: 40,
                              color: Colors.white10,
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                              textStyle: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0, 0),
                          child: ButtonWidget(
                            onPressed: () {
                              isGoogleButtonLoading
                                  ? null
                                  : handleAppleSignIn();
                            },
                            text: 'Ingresa con Apple',
                            icon: const FaIcon(
                              FontAwesomeIcons.apple,
                              size: 26,
                              color: Colors.white,
                            ),
                            options: const ButtonOptions(
                              iconPadding: EdgeInsets.only(left: 20),
                              width: 300,
                              height: 40,
                              color: Colors.white10,
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                              textStyle: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0, 0),
                          child: ButtonWidget(
                            onPressed: () async {
                              nextScreenReplace(
                                  context, const PhoneAuthScreen());
                              phoneController.reset();
                            },
                            text: 'Ingresa con tu número',
                            icon: const Icon(
                              Icons.phone_iphone_sharp,
                              size: 26,
                              color: Colors.white,
                            ),
                            options: const ButtonOptions(
                              iconPadding: EdgeInsets.only(left: 20),
                              width: 300,
                              height: 40,
                              color: Colors.white10,
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                              textStyle: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // handling google sigin in
  Future handleGoogleSignIn() async {
    setState(() {
      isGoogleButtonLoading = true;
    });
    final sp = context.read<SignInProvider>();
    final ip = context.read<InternetProvider>();
    await ip.checkInternetConnection();

    if (ip.hasInternet == false) {
      // ignore: use_build_context_synchronously
      openSnackbar(context, "Check your Internet connection", Colors.red[300]);
      googleController.reset();
    } else {
      await sp.signInWithGoogle().then((value) {
        if (sp.hasError == true) {
          openSnackbar(context, sp.errorCode.toString(), Colors.red[300]);
          googleController.reset();
        } else {
          // checking whether user exists or not
          sp.checkUserExists().then((value) async {
            if (value == true) {
              // user exists
              await sp.getUserDataFromFirestore(sp.uid).then((value) => sp
                  .saveDataToSharedPreferences()
                  .then((value) => sp.setSignIn().then((value) {
                        googleController.success();
                        handleAfterSignIn();
                      })));
            } else {
              // user does not exist
              sp.saveDataToFirestore().then((value) => sp
                  .saveDataToSharedPreferences()
                  .then((value) => sp.setSignIn().then((value) {
                        googleController.success();
                        handleAfterSignIn();
                      })));
            }
            setState(() {
              isGoogleButtonLoading = false;
            });
          });
        }
      });
    }
  }

  // handling apple sigin in
  Future handleAppleSignIn() async {
    setState(() {
      isAppleButtonLoading = true;
    });
    final sp = context.read<SignInProvider>();
    final ip = context.read<InternetProvider>();
    await ip.checkInternetConnection();

    if (ip.hasInternet == false) {
      // ignore: use_build_context_synchronously
      openSnackbar(context, "Check your Internet connection", Colors.red[300]);
      googleController.reset();
    } else {
      await sp.signInWithApple().then((value) {
        if (sp.hasError == true) {
          openSnackbar(context, sp.errorCode.toString(), Colors.red[300]);
          googleController.reset();
        } else {
          // checking whether user exists or not
          sp.checkUserExists().then((value) async {
            if (value == true) {
              // user exists
              await sp.getUserDataFromFirestore(sp.uid).then((value) => sp
                  .saveDataToSharedPreferences()
                  .then((value) => sp.setSignIn().then((value) {
                        googleController.success();
                        handleAfterSignIn();
                      })));
            } else {
              // user does not exist
              sp.saveDataToFirestore().then((value) => sp
                  .saveDataToSharedPreferences()
                  .then((value) => sp.setSignIn().then((value) {
                        googleController.success();
                        handleAfterSignIn();
                      })));
            }
            setState(() {
              isAppleButtonLoading = false;
            });
          });
        }
      });
    }
  }

  // handle after signin
  handleAfterSignIn() {
    Future.delayed(const Duration(milliseconds: 1000)).then((value) {
      nextScreenReplace(context, const RadioScreen());
    });
  }
}
