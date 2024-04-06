// ignore_for_file: library_private_types_in_public_api

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:viva_2024/audio/play_button_notifier.dart';

import '../../audio/play_button.dart';
import '../radio_screen.dart';
//TODO: FILE ACTUALIZADO.
class SomosLibresWidget extends StatefulWidget {
  const SomosLibresWidget({Key? key}) : super(key: key);

  @override
  _SomosLibresWidgetState createState() => _SomosLibresWidgetState();
}

class _SomosLibresWidgetState extends State<SomosLibresWidget>
    with TickerProviderStateMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
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
              'assets/tec.png',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
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
                  color: Colors.white,
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
            padding: const EdgeInsetsDirectional.fromSTEB(10, 120, 10, 10),
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('somoslibres')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  );
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text('Error al obtener los datos'),
                  );
                } else {
                  List<Map<String, dynamic>> somoslibres = snapshot.data!.docs
                      .map((doc) => doc.data() as Map<String, dynamic>)
                      .toList();
                  return ListView.separated(
                    itemCount: somoslibres.length + 1,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 30),
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        // El primer elemento es el texto "Lo más nuevo"
                        return Text(
                            'Somos Libres\n\nUn programa que rompe cadenas y celebra la libertad en todas sus formas.\nLos esclavos Alonso, Gererdo, Abad, Joseph, Jose Daniel y Vinchenzo se liberan de la esclavitud y lo convencional para explorar una verdadera libertad de expresión.\n¡Oe pon Viva! \n\n\n\Próximamente',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    color: Colors.white, fontSize: 14)));
                      } else {
                        // Los siguientes elementos son los elementos del ingreso
                        Map<String, dynamic> somos = somoslibres[index - 1];
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              height: 120,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    width: screenWidth * .3,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          somos['cover'],
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 60,
                                    width: screenWidth * .6,
                                    decoration: BoxDecoration(
                                      color: Colors.white38,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 16.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                somos['programa'],
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                somos['titulo'],
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        PlayButton(
                                          ButtonPage.somosLibres
                                          ,
                                        id: 2)
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        );
                      }
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
