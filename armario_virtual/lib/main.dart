import 'dart:io';

import 'package:armario_virtual/src/widgets/decorators/container_foto.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

// import './database/db.dart';
import 'src/page/inicial.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // <- Necessário na Web;
  // Isso basicamente adiciona o JS na web
  // também deve dar: dart run sqflite_common_ffi_web:setup
  if (kIsWeb) {
    databaseFactory = databaseFactoryFfiWeb;
  } else if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    //padrão para qualquer app
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi; //usa essa biblioteca
  } else {
    //de outro
    databaseFactory = databaseFactoryFfiWeb;
  }
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(child: PaginaInicial()),
        bottomNavigationBar: ContainerFoto(
          image: 'fundo/fundoTextoAm.png',
          height: 80,
          boxFit: BoxFit.contain,

          child: Expanded(
            // child: Center(child: Text("ola"))),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Image.asset('assets/icon/iconArmario.png'),
                ),
              ],
            ),

            // child: BottomNavigationBar(

            //   items: [
            //     BottomNavigationBarItem(
            //       icon: Image.asset(
            //         'assets/icon/iconArmario.png',
            //         height: 50,
            //         ),
            //       label: "Armario"
            //     ),
            //     BottomNavigationBarItem(
            //       icon: Image.asset(
            //         'assets/icon/iconCasa.png',
            //         height: 50,
            //       ),
            //       label: "Armario",

            //     ),
            //   ],
          ),
        ),
      ),
      // theme: temaApp
    ),
  ); // Função que chama o FLUTTER
}
