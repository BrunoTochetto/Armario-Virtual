import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

import 'src/page/inicial.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    databaseFactory = databaseFactoryFfiWeb;
  } else if (Platform.isWindows ||
      Platform.isLinux ||
      Platform.isMacOS) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  } else {
    databaseFactory = databaseFactoryFfiWeb;
  }

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Inicial(),
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => const Inicial()
      // }
    ),
  );
}