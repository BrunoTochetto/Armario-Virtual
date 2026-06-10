import 'package:armario_virtual/src/widgets/testes.dart';
import 'package:flutter/material.dart';
import 'src/page/inicial.dart';

void main() {
  runApp(MaterialApp(
        home: Column(
          children: [
            ExplicitAnimationScreen(),
            ExplicitAnimationScreen(),
            ExplicitAnimationScreen(),
            ExplicitAnimationScreen()
          ],
        )
      )
    ); // Função que chama o FLUTTER
}
