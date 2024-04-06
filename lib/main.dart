import 'dart:async';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:viva_2024/firebase_options_dev.dart';
import 'package:viva_2024/firebase_options_prod.dart';

import 'app.dart';
import 'audio/service_locator.dart';
import 'flavors.dart';

FutureOr<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (F.name == 'dev') {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptionsDev.currentPlatformDev,
    );
  } else {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptionsProd.currentPlatformProd,
    );
  }
  log(F.name);

  //Just Audio y Audio Service
  await setupServiceLocator();
  runApp(const App());
}
