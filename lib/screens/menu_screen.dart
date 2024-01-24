import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:viva_2024/screens/login_screen.dart';

import '../audio/page_manager.dart';
import '../providers/signIn_provider.dart';
import '../utils/next_screen.dart';
import 'radio_screen.dart';

class MenuWidget extends StatefulWidget {
  const MenuWidget({Key? key}) : super(key: key);

  @override
  MenuWidgetState createState() => MenuWidgetState();
}

class MenuWidgetState extends State<MenuWidget> with TickerProviderStateMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final sp = context.watch<SignInProvider>();
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
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
          ListView(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            children: const [],
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
                color: Color(0x00FFFFFF),
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Colors.black54,
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
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                      child: Center(
                        child: Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.orange,
                              width: 1,
                            ),
                          ),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage: NetworkImage("${sp.imageUrl}"),
                            radius: 30,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Text("${sp.name}",
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              color: Colors.black54,
                              fontSize: 12,
                            ),
                          )),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10, 50, 10, 0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                        child: Text('Síguenos en:',
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: Colors.black54,
                                fontSize: 12,
                              ),
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40, right: 40),
                      child: ElevatedButton.icon(
                        // ignore: deprecated_member_use
                        onPressed: () => launch(
                            'https://www.tiktok.com/@vivafmperu?lang=es'),
                        icon: const Icon(FontAwesomeIcons.tiktok,
                            size: 20, color: Colors.black54),
                        label: Text("TikTok",
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: Colors.black54,
                                fontSize: 12,
                              ),
                            )),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      child: Container(
                        height: 1,
                        color: Colors.grey[800],
                      ),
                    ),
                    Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 40, right: 40),
                          child: ElevatedButton.icon(
                            onPressed: () =>
                                // ignore: deprecated_member_use
                                launch('https://www.instagram.com/vivafmperu/'),
                            icon: const Icon(FontAwesomeIcons.instagram,
                                size: 20, color: Colors.black54),
                            label: Text("Instagram",
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 12,
                                  ),
                                )),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                            ),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      child: Container(
                        height: 1,
                        color: Colors.grey[800],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40, right: 40),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 40, right: 40),
                        child: ElevatedButton.icon(
                          onPressed: () =>
                              // ignore: deprecated_member_use
                              launch('https://www.facebook.com/VivaFMFans'),
                          icon: const Icon(FontAwesomeIcons.facebook,
                              size: 20, color: Colors.black54),
                          label: Text("Facebook",
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 12,
                                ),
                              )),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      child: Container(
                        height: 1,
                        color: Colors.grey[800],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40, right: 40),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 40, right: 40),
                        child: ElevatedButton.icon(
                          // ignore: deprecated_member_use
                          onPressed: () => launch(
                              'https://www.youtube.com/channel/UC9zP8YvSo-7EwEX-mZnNMyA'),

                          icon: const Icon(FontAwesomeIcons.youtube,
                              size: 20, color: Colors.black54),
                          label: Text("YouTube",
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 12,
                                ),
                              )),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      child: Container(
                        height: 1,
                        color: Colors.grey[800],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40, right: 40),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 40, right: 40),
                        child: ElevatedButton.icon(
                          onPressed: () {
                            _launchURL();
                          },
                          icon: const Icon(FontAwesomeIcons.laptop,
                              size: 20, color: Colors.black54),
                          label: Text("Suscríbete",
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 12,
                                ),
                              )),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      child: Container(
                        height: 1,
                        color: Colors.grey[800],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10, 40, 10, 0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                        child: Text('Configuración:',
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: Colors.black54,
                                fontSize: 12,
                              ),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40, right: 40),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 40, right: 40),
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(FontAwesomeIcons.wallet,
                              size: 20, color: Colors.white24),
                          label: Text("Viva Premium",
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  color: Colors.white24,
                                  fontSize: 12,
                                ),
                              )),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      child: Container(
                        height: 1,
                        color: Colors.grey[800],
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 40, right: 40),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 40, right: 40),
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(FontAwesomeIcons.qrcode,
                                size: 20, color: Colors.white24),
                            label: Text("Codigo QR",
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                    color: Colors.white24,
                                    fontSize: 12,
                                  ),
                                )),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                            ),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      child: Container(
                        height: 1,
                        color: Colors.grey[800],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40, right: 40),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 40, right: 40),
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(FontAwesomeIcons.info,
                              size: 20, color: Colors.white24),
                          label: Text("Condiciones de uso",
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  color: Colors.white24,
                                  fontSize: 12,
                                ),
                              )),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      child: Container(
                        height: 1,
                        color: Colors.grey[800],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40, right: 40),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 40, right: 40),
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(FontAwesomeIcons.hireAHelper,
                              size: 20, color: Colors.white24),
                          label: Text("Ayuda",
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  color: Colors.white24,
                                  fontSize: 12,
                                ),
                              )),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      child: Container(
                        height: 1,
                        color: Colors.grey[800],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40, right: 40),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 40, right: 40),
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()));
                            PageManager().stop();
                            sp.userSignOut();
                            nextScreenReplace(context, const LoginScreen());
                          },
                          icon: const Icon(Icons.logout,
                              size: 20, color: Colors.black54),
                          label: Text("Salir",
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 12,
                                ),
                              )),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ]))
        ]));
  }

  _launchURL() async {
    const url = 'http://www.vivafm.club';
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw 'No se pudo abrir la URL: $url';
    }
  }
}
