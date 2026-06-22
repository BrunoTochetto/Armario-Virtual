// import 'package:armario_virtual/src/widgets/botao_papelao.dart';
import 'package:flutter/material.dart';
import '../widgets/bottomNavigation.dart';
import '../widgets/passarRoupa.dart';

class Inicial extends StatelessWidget {
  const Inicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomBar(),

      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/fundo/fundoBranco.png',
              fit: BoxFit.cover,
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 10),

                // // Título
                // Align(
                //   alignment: Alignment.topRight,
                //   child: Image.asset(
                //     'assets/fundo/fundoTextoAm.png',
                //     width: 220,
                //   ),
                // ),

                const SizedBox(height: 15),

                // Área dos 4 seletores
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      PassarRoupa(
                        fundo: 'assets/fundo/fundoBotaoAm.png',
                        icone: 'assets/icon/iconCabeça.png',
                      ),
                      SizedBox(height: 8),

                      PassarRoupa(
                        fundo: 'assets/fundo/fundoBotaoAz.png',
                        icone: 'assets/icon/iconTronco.png',
                      ),
                      SizedBox(height: 8),

                      PassarRoupa(
                        fundo: 'assets/fundo/fundoBotaoV.png',
                        icone: 'assets/icon/iconPernas.png',
                      ),
                      SizedBox(height: 8),

                      PassarRoupa(
                        fundo: 'assets/fundo/fundoBotaoAz.png',
                        icone: 'assets/icon/iconPés.png',
                      ),
                      
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
// class PaginaInicial extends StatelessWidget {
//   const PaginaInicial({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       scrollDirection: Axis.vertical,
//       children: [
//             BotaoPapelao(
//               onPressed: () {debugPrint("click");},
//               height: 150,
//               width: 1,
//               child: Center(
//                 child: Text("Cabeça")
//               ),
              
//             ),
//             BotaoPapelao(
//               child: Text("Ombro"),
//               onPressed: () {debugPrint("click");},
//             ),
//             BotaoPapelao(
//               child: Text("Joelho"),
//               onPressed: () {debugPrint("click");},
//             ),
//             BotaoPapelao(
//               child: Text("Pé"),
//               onPressed: () {debugPrint("click");},
//             ),
            
//           ],
//       );
//   }
// }
