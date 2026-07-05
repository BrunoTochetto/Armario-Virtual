// icone de dentro dos armários para apresentar a roupa dentro.
import 'package:flutter/material.dart';
import '../../model/roupa.dart';

class RoupaCard extends StatelessWidget {
  final Roupa roupa;

  const RoupaCard({
    super.key,
    required this.roupa,
  });

  @override
  Widget build(BuildContext context) {
    Widget roupaWidget = SizedBox(width: 1, height: 1,);
    if (roupa.imagem.isEmpty) {
      // roupaWidget;
    } else {
      roupaWidget = Image.memory(roupa.imagem, fit: BoxFit.contain);
    }
    return SizedBox(
      width: 140,
      height: 140,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/fundo/fundoFotos.png',
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18),
            child: roupaWidget
          ),
        ],
      ),
    );
  }
}