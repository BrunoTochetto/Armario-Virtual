import 'package:armario_virtual/src/page/armarioPadrao.dart';
import 'package:armario_virtual/src/page/inicial.dart';
import 'package:flutter/material.dart';
import './popUpEscolher.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  void _abrirArmario(BuildContext context) {
    showDialog(context: context, builder: (_) => const PopUpEscolher());
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/fundo/fundoTextoAm.png'), fit: BoxFit.fill),
          color: Colors.transparent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
              child: Image.asset('assets/icon/iconCasa.png', height: 70),
            ),
            GestureDetector(
              onTap: () => _abrirArmario(context),
              child: Image.asset('assets/icon/iconArmario.png', height: 70),
            ),
          ],
        ),        
      ),
      // child: Stack(
      //   alignment: Alignment.center,
      //   children: [
      //     // Fundo da barra
      //     Positioned.fill(
      //       child: Image.asset(
      //         'assets/fundo/fundoTextoAm.png',
      //         fit: BoxFit.fill,
      //       ),
      //     ),

      //     // Botão casa
      //     Positioned(
      //       left: 60,
      //       child: GestureDetector(
      //         onTap: () {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(builder: (_) => const Inicial()),
      //           );
      //         },
      //         child: Image.asset('assets/icon/iconCasa.png', height: 70),
      //       ),
      //     ),

      //     // Botão armário
      //     Positioned(
      //       right: 60,
      //       child: GestureDetector(
      //         onTap: () => _abrirArmario(context),
      //         onLongPress: () => Navigator.push(
      //           context,
      //           MaterialPageRoute(builder: (context) => ArmarioPadrao(
      //             categoria: 'cabeca',
      //             fundoTela: 'fundoAmarelo',
      //             textoArmario: 'Cabeça',
      //           )),
      //         ),
      //         child: Image.asset('assets/icon/iconArmario.png', height: 70),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
