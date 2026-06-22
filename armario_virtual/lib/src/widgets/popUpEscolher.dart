//popUp para escolher o armário, na página principal
import 'package:flutter/material.dart';
import '../page/armario/armarioCabeca.dart';
import '../page/armario/armarioTronco.dart';
import '../page/armario/armarioPernas.dart';
import '../page/armario/armarioPes.dart';

class PopUpEscolher extends StatelessWidget {
  const PopUpEscolher({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(10),
      child: SizedBox(
        width: 350,
        height: 600,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            // Fundo principal
            Positioned(
              top: 100,
              child: Image.asset('assets/fundo/fundoPopUp.png', width: 320),
            ),

            // Caixa de texto superior
            Positioned(
              top: 0,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset('assets/fundo/fundoTextoAm.png', width: 350),

                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      'Qual armário você\nquer ver?',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ],
              ),
            ),

            // Grade de botões
            Positioned(
              top: 200,
              child: SizedBox(
                width: 240,
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 0.8,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    _BotaoArmario(
                      imagem: 'assets/icon/iconCabeça.png',
                      texto: 'Cabeça',
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ArmarioCabeca(),
                          ),
                        );
                      },
                    ),

                    _BotaoArmario(
                      imagem: 'assets/icon/iconTronco.png',
                      texto: 'Tronco',
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ArmarioTronco(),
                          ),
                        );
                      },
                    ),

                    _BotaoArmario(
                      imagem: 'assets/icon/iconPernas.png',
                      texto: 'Pernas',
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ArmarioPernas(),
                          ),
                        );
                      },
                    ),

                    _BotaoArmario(
                      imagem: 'assets/icon/iconPés.png',
                      texto: 'Pés',
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const ArmarioPes()),
                        );
                        ;
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BotaoArmario extends StatelessWidget {
  final String imagem;
  final String texto;
  final VoidCallback onTap;

  const _BotaoArmario({
    required this.imagem,
    required this.texto,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Fundo do botão
          Positioned.fill(
            child: Image.asset(
              'assets/fundo/fundoBotPopup.png',
              fit: BoxFit.fill,
            ),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(imagem, height: 70),

              const SizedBox(height: 8),

              Text(texto, style: const TextStyle(fontSize: 18)),
            ],
          ),
        ],
      ),
    );
  }
}
