import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:viva_2024/screens/radio_screen.dart';

class LoMasNuevo extends StatefulWidget {
  const LoMasNuevo({Key? key}) : super(key: key);

  @override
  LoMasNuevoWidgetState createState() => LoMasNuevoWidgetState();
}

class LoMasNuevoWidgetState extends State<LoMasNuevo> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

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
                color: Color(0x00F8F3F3),
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Colors.black,
                  size: 20,
                ),
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const RadioScreen();
                      },
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10, 120, 10, 10),
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('ingresosnuevos')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.black54,
                    ),
                  );
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text('Error al obtener los datos'),
                  );
                } else {
                  List<Map<String, dynamic>> ingresosnuevos = snapshot
                      .data!.docs
                      .map((doc) => doc.data() as Map<String, dynamic>)
                      .toList();
                  return ListView.separated(
                    itemCount: ingresosnuevos.length + 1,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 30),
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        // El primer elemento es el texto "Lo más nuevo"
                        return Text(
                            'Lo más nuevo\n\nLos más recientes éxitos los podrás escuchar como siempre primero aquí, Lo más nuevo del Latin Pop, Latin Urban, Reggaeton y lo mejor de la música en ingles en un solo lugar. \n¡Oe pon Viva!',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    color: Colors.black, fontSize: 14)));
                      } else {
                        // Los siguientes elementos son los elementos del ingreso
                        Map<String, dynamic> nuevo = ingresosnuevos[index - 1];
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
                                          nuevo['cover'],
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
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Center(
                                            child: Text(nuevo['cancion'],
                                                style: GoogleFonts.poppins(
                                                  textStyle: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ))),
                                        Center(
                                            child: Text(nuevo['artista'],
                                                style: GoogleFonts.poppins(
                                                  textStyle: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                  ),
                                                ))),
                                      ],
                                    ),
                                  ),
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
