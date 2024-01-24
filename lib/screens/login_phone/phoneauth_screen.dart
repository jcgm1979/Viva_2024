import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:viva_2024/screens/login_screen.dart';
import 'package:viva_2024/screens/radio_screen.dart';
import '../../../utils/next_screen.dart';
import '../../../utils/snack_bar.dart';
import '../../providers/internet_provider.dart';
import '../../providers/signIn_provider.dart';

class PhoneAuthScreen extends StatefulWidget {
  const PhoneAuthScreen({Key? key}) : super(key: key);

  @override
  State<PhoneAuthScreen> createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  final formKey = GlobalKey<FormState>();
  // controller -> phone, email, name, otp code
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController otpCodeController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Image.asset(
            'assets/bk-app-plomo.png',
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 60, 0, 0),
          child: Container(
            width: double.infinity,
            height: 50,
            decoration: const BoxDecoration(),
            child: Image.asset(
              'assets/logo-horizontal-2023.png',
              fit: BoxFit.contain,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
          child: Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              color: Color(0x00FFFFFF),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.white,
                size: 20,
              ),
              onPressed: () async {
                nextScreenReplace(context, const LoginScreen());
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 120, 0, 0),
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 30,
                      width: double.infinity,
                      color: Colors.transparent,
                      child: Text('Ingresa tus datos',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Ingresa tu Nombre";
                        }
                        return null;
                      },
                      controller: nameController,
                      textInputAction: TextInputAction.next,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.account_circle,
                            color: Colors.white,
                          ),
                          hintText: "Tu nombre",
                          hintStyle: (GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  color: Colors.white24, fontSize: 14))),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(color: Colors.red)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Colors.white)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Colors.white))),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Ingresa tu Email";
                        }
                        return null;
                      },
                      controller: emailController,
                      textInputAction: TextInputAction.next,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                          prefixIcon:
                              const Icon(Icons.email, color: Colors.white),
                          hintText: "Tu Email",
                          hintStyle: (GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  color: Colors.white24, fontSize: 14))),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(color: Colors.red)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Colors.white)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Colors.white))),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Ingresa tu número de teléfono";
                        }
                        return null;
                      },
                      controller: phoneController,
                      textInputAction: TextInputAction.next,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                          prefixIcon:
                              const Icon(Icons.phone, color: Colors.white),
                          hintText: "+51-123456789",
                          hintStyle: (GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  color: Colors.white24, fontSize: 14))),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(color: Colors.red)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Colors.white)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Colors.white))),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 40,
                      width: double.infinity,
                      color: Colors.transparent,
                      child: Text(
                          'Asegurate de ingresar +51-. Te enviaremos un código por SMS para confirmar tu número de teléfono ',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          )),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        login(context, phoneController.text.trim());
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          side:
                              const BorderSide(color: Colors.white, width: 1.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: Text("Siguiente",
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  color: Colors.white, fontSize: 12))),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ));
  }

  Future login(BuildContext context, String mobile) async {
    final sp = context.read<SignInProvider>();
    final ip = context.read<InternetProvider>();
    await ip.checkInternetConnection();

    if (ip.hasInternet == false) {
      // ignore: use_build_context_synchronously
      openSnackbar(context, "Revisa tu conección a internet", Colors.red);
    } else {
      if (formKey.currentState!.validate()) {
        FirebaseAuth.instance.verifyPhoneNumber(
            phoneNumber: mobile,
            verificationCompleted: (AuthCredential credential) async {
              await FirebaseAuth.instance.signInWithCredential(credential);
            },
            verificationFailed: (FirebaseAuthException e) {
              openSnackbar(context, e.toString(), Colors.red);
            },
            codeSent: (String verificationId, int? forceResendingToken) {
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Ingresa código"),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            controller: otpCodeController,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.code,
                                  color: Colors.orangeAccent,
                                ),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                        color: Colors.orangeAccent)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide:
                                        const BorderSide(color: Colors.grey)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide:
                                        const BorderSide(color: Colors.grey))),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                side: const BorderSide(
                                    color: Colors.white, width: 2.0),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            child: Text("Confirmar",
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        color: Colors.white, fontSize: 12))),
                            onPressed: () async {
                              final code = otpCodeController.text.trim();
                              AuthCredential authCredential =
                                  PhoneAuthProvider.credential(
                                      verificationId: verificationId,
                                      smsCode: code);
                              User user = (await FirebaseAuth.instance
                                      .signInWithCredential(authCredential))
                                  .user!;
                              // save the values
                              sp.phoneNumberUser(user, emailController.text,
                                  nameController.value.text);
                              // checking whether user exists,
                              sp.checkUserExists().then((value) async {
                                if (value == true) {
                                  // user exists
                                  await sp
                                      .getUserDataFromFirestore(sp.uid)
                                      .then((value) => sp
                                          .saveDataToSharedPreferences()
                                          .then((value) =>
                                              sp.setSignIn().then((value) {
                                                nextScreenReplace(context,
                                                    const RadioScreen());
                                              })));
                                } else {
                                  // user does not exist
                                  await sp.saveDataToFirestore().then((value) =>
                                      sp.saveDataToSharedPreferences().then(
                                          (value) =>
                                              sp.setSignIn().then((value) {
                                                nextScreenReplace(context,
                                                    const RadioScreen());
                                              })));
                                }
                              });
                            },
                          )
                        ],
                      ),
                    );
                  });
            },
            codeAutoRetrievalTimeout: (String verification) {});
      }
    }
  }
}
