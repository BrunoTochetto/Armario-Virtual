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

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/fundo/fundoBranco.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: [Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PassarRoupa(
                fundo: 'assets/fundo/fundoBotaoAm.png',
                iconePadrao: 'assets/icon/iconCabeça.png',
                categoria: 'cabeca',
              ),
              SizedBox(height: 8),
                          
              PassarRoupa(
                fundo: 'assets/fundo/fundoBotaoAz.png',
                iconePadrao: 'assets/icon/iconTronco.png',
                categoria: 'tronco',
              ),
              SizedBox(height: 8),
                          
              PassarRoupa(
                fundo: 'assets/fundo/fundoBotaoV.png',
                iconePadrao: 'assets/icon/iconPernas.png',
               categoria: 'pernas', 
              ),
              SizedBox(height: 8),
                          
              PassarRoupa(
                fundo: 'assets/fundo/fundoBotaoAz.png',
                iconePadrao: 'assets/icon/iconPés.png',
                categoria: 'pes',
              ),
            ],
          ),
        ]),
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
