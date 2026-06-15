import 'package:armario_virtual/src/widgets/botao_papelao.dart';
import 'package:armario_virtual/src/widgets/decorators/container_foto.dart';
import 'package:armario_virtual/src/widgets/testes.dart';
import 'package:flutter/material.dart';
import './src/theme/tema.dart';
import 'src/page/inicial.dart';

void main() {
  runApp(MaterialApp(
        home: Scaffold(
          body: Center(
            child: PaginaInicial()
          ),
          bottomNavigationBar: 
            ContainerFoto(
              image: 'fundo/fundoTextoAm.png',
              height: 80,
              boxFit: BoxFit.contain,

              child: Expanded(
                child: Center(child: Text("ola"))),
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
                
              //           ),
            ),
      ),
      // theme: temaApp
  )
    ); // Função que chama o FLUTTER
}
