import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:viva_2024/firebase_options.dart';

import 'app.dart';
import 'audio/service_locator.dart';

FutureOr<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'viva-fm-smart-ced7c',
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //Just Audio y Audio Service
  await setupServiceLocator();
  runApp(const App());
}
