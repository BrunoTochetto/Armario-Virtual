import 'dart:io';

import 'package:armario_virtual/src/page/addRoupa.dart';
import 'package:armario_virtual/src/page/armarioPadrao.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

import 'src/page/inicial.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized(); // <- Necessário na Web;
  // também deve dar: dart run sqflite_common_ffi_web:setup

  if (kIsWeb) {
    databaseFactory = databaseFactoryFfiWeb;
  } else if(Platform.isWindows || Platform.isLinux || Platform.isMacOS ) { //padrão para qualquer app
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  } 
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: const Inicial(),
      initialRoute: '/',
      routes: {
        '/': (context) => Inicial(),
        '/addRoupa': (context) {
          final Map<String, dynamic>? args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
          final String categoria = args?['categoria'] as String? ?? 'cabeca';
          return adicionarRoupa(categoria: categoria);
        },
        '/armario/cabeca': (context) => ArmarioPadrao(
          fundoTela: 'fundoAmarelo',
          textoArmario: 'cabeça',
          categoria: 'cabeca'
        ),
        '/armario/tronco': (context) => ArmarioPadrao(
          fundoTela: 'fundoAzul',
          textoArmario: 'peitoral',
          categoria: 'tronco'
        ),
        '/armario/pernas': (context) => ArmarioPadrao(
          fundoTela: 'fundoVerm',
          textoArmario: 'pernas',
          categoria: 'pernas'
        ),
        '/armario/pes': (context) => ArmarioPadrao(
          fundoTela: 'fundoAzul',
          textoArmario: 'pés',
          categoria: 'pes'
        ),
      },
    ),
  );
}