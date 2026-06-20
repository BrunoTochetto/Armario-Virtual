//botão da tela inicial para mostrar e passar as roupas -> por enquanto estático

import 'package:flutter/material.dart';

class PassarRoupa extends StatelessWidget {
  final String fundo;
  final String icone;

  const PassarRoupa({
    super.key,
    required this.fundo,
    required this.icone,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {},
          child: Image.asset(
            'assets/botoes/setaEsquerda.png',
            width: 40,
          ),
        ),

        const SizedBox(width: 10),

        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              fundo,
              width: 220,
            ),

            Image.asset(
              icone,
              width: 70,
            ),
          ],
        ),

        const SizedBox(width: 10),

        GestureDetector(
          onTap: () {},
          child: Image.asset(
            'assets/botoes/setaDireita.png',
            width: 40,
          ),
        ),
      ],
    );
  }
}