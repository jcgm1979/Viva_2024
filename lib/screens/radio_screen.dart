import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:viva_2024/screens/viva_tec/viva_tec_widget.dart';

import '../audio/page_manager.dart';
import '../audio/play_button.dart';
import '../audio/play_button_notifier.dart';
import '../audio/service_locator.dart';
import '../providers/artista_cancion.dart';
import 'SomosLibres/somos_libres_widget.dart';
import 'djs/djs_screen_widget.dart';
import 'entrevistas/entrevistas_widget.dart';
import 'fiesta_privada/fiesta_privada_widget.dart';
import 'lo_mas_nuevo/lo_mas_nuevo_widget.dart';
import 'menu_screen.dart';
import 'noticias/noticias_widget.dart';
import 'podcast/podcast_widget.dart';
import 'ranking/ranking_viva_widget.dart';
import 'ratas/ratas_widget.dart';
//TODO: FILE ACTUALIZADO.
class RadioScreen extends StatefulWidget {
  const RadioScreen({super.key});

  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  @override
  void initState() {
    super.initState();

    //Audio
    getIt<PageManager>().init();
  }

  @override
  void dispose() {
    getIt<PageManager>().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Stack(children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.transparent,
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
                height: 50,
                decoration: const BoxDecoration(),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        //color: Colors.white10,
                        child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 0, 60, 0),
                            child: IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const MenuWidget()));
                                },
                                icon: const Icon(
                                  Icons.menu,
                                  //color: Colors.grey[400],
                                  color: Colors.black,
                                ))),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 40,
                        //color: Colors.white10,
                        child: Center(
                          child: Image.asset(
                            'assets/logo-horizontal-2023.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                60, 0, 0, 0),
                            child: IconButton(
                                color: Colors.transparent,
                                onPressed: () {},
                                icon: const Icon(Icons.account_circle_sharp))),
                      ),
                    ),
                  ],
                )),
          ),
          //-----------------------------------------------Scrollview
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 120, 0, 200),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0x00F8F8F8),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 150,
                          height: 180,
                          decoration: BoxDecoration(
                            color: const Color(0x00FFFFFF),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              SizedBox(
                                width: 150,
                                height: 150,
                                child: InkWell(
                                  onTap: () async {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const FiestaPrivadaWidget()));
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: const Image(
                                        image: AssetImage(
                                            'assets/fiesta-privada.png')),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 5, 0, 0),
                                child: Text('Fiesta Privada',
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                        //color: Colors.grey[400],
                                        color: Colors.black,
                                        fontSize: 13,
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 150,
                          height: 180,
                          decoration: BoxDecoration(
                            color: const Color(0x00FFFFFF),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              SizedBox(
                                width: 150,
                                height: 150,
                                child: InkWell(
                                  onTap: () async {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const RatasWidget()));
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: const Image(
                                        image: AssetImage('assets/ratas.png')),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 5, 0, 0),
                                child: Text('Ratas',
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                        //color: Colors.grey[400],
                                        color: Colors.black,
                                        fontSize: 13,
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 150,
                          height: 180,
                          decoration: BoxDecoration(
                            color: const Color(0x00FFFFFF),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              SizedBox(
                                width: 150,
                                height: 150,
                                child: InkWell(
                                  onTap: () async {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const LoMasNuevo()));
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: const Image(
                                        image: AssetImage(
                                            'assets/lomasnuevo.png')),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 5, 0, 0),
                                child: Text('Lo más nuevo',
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                        //color: Colors.grey[400],
                                        color: Colors.black,
                                        fontSize: 13,
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 150,
                          height: 180,
                          decoration: BoxDecoration(
                            color: const Color(0x00FFFFFF),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              SizedBox(
                                width: 150,
                                height: 150,
                                child: InkWell(
                                  onTap: () async {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SomosLibresWidget()));
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: const Image(
                                        image: AssetImage(
                                            'assets/somoslibres.png')),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 5, 0, 0),
                                child: Text('Somos Libres',
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                        //color: Colors.grey[400],
                                        color: Colors.black,
                                        fontSize: 13,
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 150,
                          height: 180,
                          decoration: BoxDecoration(
                            color: const Color(0x00FFFFFF),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              SizedBox(
                                width: 150,
                                height: 150,
                                child: InkWell(
                                  onTap: () async {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const EntrevistasWidget()));
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: const Image(
                                        image: AssetImage(
                                            'assets/entrevistas.png')),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 5, 0, 0),
                                child: Text('Entrevistas',
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                        //color: Colors.grey[400],
                                        color: Colors.black,
                                        fontSize: 13,
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 150,
                          height: 180,
                          decoration: BoxDecoration(
                            color: const Color(0x00FFFFFF),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              SizedBox(
                                width: 150,
                                height: 150,
                                child: InkWell(
                                  onTap: () async {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const NoticiasWidget()));
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: const Image(
                                        image:
                                            AssetImage('assets/noticias.png')),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 5, 0, 0),
                                child: Text('Noticias',
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                        //color: Colors.grey[400],
                                        color: Colors.black,
                                        fontSize: 13,
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 150,
                          height: 180,
                          decoration: BoxDecoration(
                            color: const Color(0x00FFFFFF),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              SizedBox(
                                width: 150,
                                height: 150,
                                child: InkWell(
                                  onTap: () async {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const PodcastWidget()));
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: const Image(
                                        image:
                                            AssetImage('assets/podcast.png')),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 5, 0, 0),
                                child: Text('PodCast',
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                        //color: Colors.grey[400],
                                        color: Colors.black,
                                        fontSize: 13,
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 150,
                          height: 180,
                          decoration: BoxDecoration(
                            color: const Color(0x00FFFFFF),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              SizedBox(
                                width: 150,
                                height: 150,
                                child: InkWell(
                                  onTap: () async {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                (const DjsScreenWidget())));
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: const Image(
                                        image: AssetImage('assets/djs.png')),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 5, 0, 0),
                                child: Text('Djs',
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                        //color: Colors.grey[400],
                                        color: Colors.black,
                                        fontSize: 13,
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 150,
                          height: 180,
                          decoration: BoxDecoration(
                            color: const Color(0x00FFFFFF),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              SizedBox(
                                width: 150,
                                height: 150,
                                child: InkWell(
                                  onTap: () async {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const VivaTecWidget()));
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: const Image(
                                        image: AssetImage('assets/tec.png')),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 5, 0, 0),
                                child: Text('VivaTec',
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                        //color: Colors.grey[400],
                                        color: Colors.black,
                                        fontSize: 13,
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 150,
                          height: 180,
                          decoration: BoxDecoration(
                            color: const Color(0x00FFFFFF),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              SizedBox(
                                width: 150,
                                height: 150,
                                child: InkWell(
                                  onTap: () async {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const RankingVivaWidget()));
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: const Image(
                                        image:
                                            AssetImage('assets/ranking.png')),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 5, 0, 0),
                                child: Text('Ranking',
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                        //color: Colors.grey[400],
                                        color: Colors.black,
                                        fontSize: 13,
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),

          //------------------------------------------------------------Container general player
          Align(
              alignment: const AlignmentDirectional(0, 1),
              child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 15),
                  child: Container(
                      width: double.infinity,
                      height: 170,
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.rectangle,
                      ),
                      child: Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                    width: double.infinity,
                                    height: 50,
                                    decoration: const BoxDecoration(
                                        color: Colors.white38,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(0),
                                          bottomRight: Radius.circular(0),
                                          topLeft: Radius.circular(15),
                                          topRight: Radius.circular(15),
                                        )),
                                    child: const ArtistaCancion()),
                                Container(
                                  width: double.infinity,
                                  height: 50,
                                  decoration: const BoxDecoration(
                                      color: Colors.white38,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(15),
                                          bottomRight: Radius.circular(15),
                                          topLeft: Radius.circular(0),
                                          topRight: Radius.circular(0))),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            60, 0, 60, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        IconButton(
                                          icon: const Icon(
                                            Icons.thumb_up_alt_rounded,
                                            //color: Colors.white,
                                            color: Colors.black26,
                                            size: 20,
                                          ),
                                          onPressed: () {
                                            print('IconButton pressed ...');
                                          },
                                        ),
                                        const PlayButton(ButtonPage.radio,
                                            id: 1),
                                        IconButton(
                                          icon: const Icon(
                                            Icons.thumb_down_rounded,
                                            //color: Colors.white,
                                            color: Colors.black26,
                                            size: 20,
                                          ),
                                          onPressed: () {
                                            print('IconButton pressed ...');
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                // Barra Menu --------------------------------------------------------------
                                Container(
                                  width: double.infinity,
                                  height: 70,
                                  decoration: const BoxDecoration(
                                    color: Colors.transparent,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 100,
                                        height: 70,
                                        decoration: const BoxDecoration(
                                          color: Colors.transparent,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            IconButton(
                                              icon: const Icon(
                                                Icons.share_rounded,
                                                //color: Colors.grey[400],
                                                color: Colors.black,
                                                size: 20,
                                              ),
                                              onPressed: () async {
                                                //Share.share(
                                                //'Te comparto mi radio favorita para que te acompañe todos los dias ESTÉS DONDE ESTÉS. Descarga el app aqui: https://play.google.com/store/apps/details?id=com.crdappsperu.viva-fm-smart');
                                              },
                                            ),
                                            Text('Compárteme',
                                                style: GoogleFonts.poppins(
                                                  textStyle: const TextStyle(
                                                    //color: Colors.grey[400],
                                                    color: Colors.black,
                                                    fontSize: 10,
                                                  ),
                                                )),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: 100,
                                        height: 70,
                                        decoration: const BoxDecoration(
                                          color: Colors.transparent,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            IconButton(
                                              icon: const Icon(
                                                Icons.library_music_rounded,
                                                color: Colors.transparent,
                                                size: 20,
                                              ),
                                              onPressed: () {},
                                            ),
                                            Text(
                                              'Letras',
                                              style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(
                                                  color: Colors.transparent,
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: 100,
                                        height: 70,
                                        decoration: const BoxDecoration(
                                          color: Colors.transparent,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            IconButton(
                                              icon: const Icon(
                                                Icons.payment_outlined,
                                                //color: Colors.grey[400],
                                                color: Colors.black,
                                                size: 25,
                                              ),
                                              onPressed: () {
                                                //  _launchURL();
                                              },
                                            ),
                                            Text('Freemium',
                                                style: GoogleFonts.poppins(
                                                  textStyle: const TextStyle(
                                                    //color: Colors.grey[400],
                                                    color: Colors.black,
                                                    fontSize: 10,
                                                  ),
                                                )),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ])))))
        ]),
      ),
    );
  }

//  _launchURL() async {
//    const url = 'http://www.vivafm.club';
//    // ignore: deprecated_member_use
//    if (await canLaunch(url)) {
//      // ignore: deprecated_member_use
//      await launch(url);
//    } else {
//      throw 'No se pudo abrir la URL: $url';
//    }
//  }
}
