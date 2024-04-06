// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../radio_screen.dart';

class RankingVivaWidget extends StatefulWidget {
  const RankingVivaWidget({Key? key}) : super(key: key);

  @override
  _RankingVivaWidgetState createState() => _RankingVivaWidgetState();
}

class _RankingVivaWidgetState extends State<RankingVivaWidget>
    with TickerProviderStateMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: Image.asset(
              'assets/bk-app-naranja.png',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          ListView(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(50, 200, 50, 0),
                child: Text(
                    'Somos Libres\n\nLas canciones más escuchadas y más votadas las encontrarás aquí.\n¡Oe pon Viva! \n\n\n\n\n\n\nPróximamente',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    )),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
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
                // ignore: unnecessary_const
                color: const Color(0x00FFFFFF),
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
        ],
      ),
    );
  }
}
