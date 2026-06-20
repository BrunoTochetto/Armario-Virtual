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
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Fundo da barra
          Positioned.fill(
            child: Image.asset(
              'assets/fundo/fundoTextoAm.png',
              fit: BoxFit.fill,
            ),
          ),

          // Botão casa
          Positioned(
            left: 60,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const Inicial(),
                          ),
                        );
              },
              child: Image.asset('assets/icon/iconCasa.png', height: 70),
            ),
          ),

          // Botão armário
          Positioned(
            right: 60,
            child: GestureDetector(
              onTap: () => _abrirArmario(context),
              child: Image.asset('assets/icon/iconArmario.png', height: 70),
            ),
          ),
        ],
      ),
    );
  }
}
