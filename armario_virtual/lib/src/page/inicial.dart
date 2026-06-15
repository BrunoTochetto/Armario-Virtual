import 'package:armario_virtual/src/widgets/botao_papelao.dart';
import 'package:flutter/material.dart';


class PaginaInicial extends StatelessWidget {
  const PaginaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
            BotaoPapelao(
              onPressed: () {debugPrint("click");},
              height: 150,
              width: 1,
              child: Center(
                child: Text("Cabeça")
              ),
              
            ),
            BotaoPapelao(
              child: Text("Ombro"),
              onPressed: () {debugPrint("click");},
            ),
            BotaoPapelao(
              child: Text("Joelho"),
              onPressed: () {debugPrint("click");},
            ),
            BotaoPapelao(
              child: Text("Pé"),
              onPressed: () {debugPrint("click");},
            ),
            
          ],
      );
  }
}
