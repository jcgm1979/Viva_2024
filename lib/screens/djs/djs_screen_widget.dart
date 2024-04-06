import 'package:flutter/material.dart';

import '../radio_screen.dart';

class DjsScreenWidget extends StatefulWidget {
  const DjsScreenWidget({Key? key}) : super(key: key);

  @override
  DjsScreenWidgetState createState() => DjsScreenWidgetState();
}

class DjsScreenWidgetState extends State<DjsScreenWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: Stack(children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Image.asset(
            'assets/bk-app-naranja.png',
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 60, 0, 0),
          child: Container(
            width: double.infinity,
            height: 40,
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
              color: Color(0x00F8F3F3),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.black,
                size: 20,
              ),
              onPressed: () async {
                Navigator.push(context, MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const RadioScreen();
                  },
                ));
              },
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10, 120, 10, 10),
          child: Text(
            'Djs \n\nLos mejores djs del medio los podrás escuchar cuándo quieras y dónde quieras .\nArma tu tono estés dónde estés con tus patas y disfruta de los mejores mixes que solo Viva Fm lleva a tus oidos\n¡Oe pon Viva! \n\n\n\n\n\n\nPróximamente',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
        ),
      ]),
    );
  }
}
