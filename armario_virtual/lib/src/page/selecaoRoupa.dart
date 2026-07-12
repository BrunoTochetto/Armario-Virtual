import 'package:armario_virtual/src/widgets/decorators/animator.dart';
import 'package:armario_virtual/src/widgets/decorators/container_foto.dart';
import 'package:flutter/material.dart';
import '../../model/roupa.dart';
import '../widgets/bottomNavigation.dart';

const List<String> fundos = [
  "fundoVermPont",
  "fundoBranco",
  "fundoVerm",
  "fundoAzul",
  "fundoAmarelo",
];

class SelecaoRoupa extends StatelessWidget {
  final Roupa roupa;
  const SelecaoRoupa({super.key, required this.roupa});

  void _deletar() {
    int id = roupa.id as int;
    Roupa.deletePorId(id);
  }

  @override
  Widget build(BuildContext context) {
    Widget roupaWidget = ContainerFoto(
      image: 'fundo/fundoBotPopup.png',
      boxFit: BoxFit.fitHeight,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Image.memory(roupa.imagem, fit: BoxFit.contain, height: 300),
      ),
    );

    int indexFundo = roupa.imagem.length % fundos.length;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/fundoTela/${fundos[indexFundo]}.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            roupaWidget,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Animator(
                  offsetAnimation: 1,
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Image.asset(
                      "assets/botoes/setaEsquerda.png",
                      width: 80,
                      height: 100,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Animator(
                  offsetAnimation: 4,
                  child: IconButton(
                    onPressed: () {
                      _deletar();
                      Navigator.pop(context);
                    },
                    icon: Image.asset(
                      "assets/icon/iconLixeira.png",
                      width: 80,
                      height: 100,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      // bottomNavigationBar: const BottomBar(),
    );
  }
}
