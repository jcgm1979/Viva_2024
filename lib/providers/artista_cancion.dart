import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class ArtistaCancion extends StatefulWidget {
  const ArtistaCancion({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ArtistaCancionState createState() => _ArtistaCancionState();
}

class _ArtistaCancionState extends State<ArtistaCancion>
    with TickerProviderStateMixin {
  String _title = '';
  String _artist = '';
  bool _mounted = false;
  late Timer _timer;
  late AnimationController _controller;

  Future<String> _getNombre() async {
    try {
      final resp = await http.get(
        Uri.https('tupanel.info:8780', '/currentsong', {'sid': '1'}),
      );

      if (resp.statusCode == 200) {
        return resp.body;
      } else {
        throw Exception('Error en la petición HTTP');
      }
    } catch (e) {
      throw Exception('Error en la petición HTTP: $e');
    }
  }

  void _updateSongInfo() async {
    final String dataSong = await _getNombre();
    final List<String> dataSplit = dataSong.split(RegExp('-'));
    if (_mounted) {
      setState(() {
        _title = dataSplit[1];
        _artist = dataSplit[0];
        _controller.reset();
        _controller.forward();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _mounted = true;
    _timer = Timer.periodic(
      const Duration(seconds: 10),
      (Timer t) => _updateSongInfo(),
    );
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    );
  }

  @override
  void dispose() {
    _mounted = false;
    _timer.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: const Offset(0.0, 0.0),
          ).animate(
            CurvedAnimation(
              parent: _controller,
              curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
            ),
          ),
          child: Center(
            child: Text(
              _title,
              style: GoogleFonts.poppins(
                fontSize: 13.0,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(-1.0, 0.0),
            end: const Offset(0.0, 0.0),
          ).animate(
            CurvedAnimation(
              parent: _controller,
              curve: const Interval(0.5, 1.0, curve: Curves.easeIn),
            ),
          ),
          child: Center(
            child: Text(
              _artist,
              style: GoogleFonts.poppins(
                fontSize: 10.0,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
