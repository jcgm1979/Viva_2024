// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../radio_screen.dart';

class NoticiasWidget extends StatefulWidget {
  const NoticiasWidget({Key? key}) : super(key: key);

  @override
  _NoticiasWidgetState createState() => _NoticiasWidgetState();
}

class _NoticiasWidgetState extends State<NoticiasWidget>
    with TickerProviderStateMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: Stack(
        children: [
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
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 120, 0, 0),
            child: ListView(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(50, 30, 50, 0),
                  child: Text(
                      'Noticias\n\nTe traeremos todas las novedades del mundo de la música, tus artistas favoritos, tus conciertos, los mejores eventos, fiestas y todo lo que te puedas imaginar. \n¡Oe pon Viva! \n\n\n\n\n\n\nPróximamente',
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
          ),
        ],
      ),
    );
  }
}
