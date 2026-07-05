//botão da tela inicial para mostrar e passar as roupas -> por enquanto estático

import 'package:flutter/material.dart';

class PassarRoupa extends StatefulWidget {
  final String fundo;
  final String iconePadrao;
  final String categoria;

  PassarRoupa({
    super.key,
    required this.fundo,
    required this.iconePadrao,
    required this.categoria,
  });

  int quantidadeDeItens = 0;

  @override
  State<PassarRoupa> createState() => _PassarRoupaState();
}

class _PassarRoupaState extends State<PassarRoupa> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              if (index <= 0) {
                index = widget.quantidadeDeItens;
              } else {
                index--;
              }
            });
          },
          child: Image.asset(
            'assets/botoes/setaEsquerda.png',
            width: 40,
          ),
        ),

        const SizedBox(width: 10),

        Stack( // Isso vai ter q mudar
          alignment: Alignment.center,
          children: [
            Image.asset(
              widget.fundo,
              width: 220,
            ),

            Image.asset(
              widget.iconePadrao,
              width: 70,
            ),
          ],
        ),

        const SizedBox(width: 10),

        GestureDetector(
          onTap: () {
            setState(() {
              if (index >= widget.quantidadeDeItens) {
                index = 0;
              } else {
                index++;
              }
            });
          },
          child: Image.asset(
            'assets/botoes/setaDireita.png',
            width: 40,
          ),
        ),
      ],
    );
  }
}