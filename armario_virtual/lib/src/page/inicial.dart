import 'package:armario_virtual/src/widgets/botao_papelao.dart';
import 'package:flutter/material.dart';


class PaginaInicial extends StatelessWidget {
  const PaginaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        BotaoPapelao(onPressed: () {}, texto: "ola mundo",),
        BotaoPapelao(onPressed: () {}),
        BotaoPapelao(onPressed: () {}),
        BotaoPapelao(onPressed: () {})
      ]
      );
  }
}