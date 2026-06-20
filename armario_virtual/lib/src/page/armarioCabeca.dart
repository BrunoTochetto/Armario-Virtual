import 'package:flutter/material.dart';
import '../widgets/roupaCard.dart';
import '../../mock/mock.dart';
import '../widgets/bottomNavigation.dart';

class ArmarioCabeca extends StatelessWidget {
  const ArmarioCabeca({super.key});

  @override
  Widget build(BuildContext context) {
    final roupas = roupasMock;

    return Scaffold(
      bottomNavigationBar: const BottomBar(),
      body: Stack(
        children: [
          // Fundo
          Positioned.fill(
            child: Image.asset(
              'assets/fundoTela/fundoAmarelo.png',
              fit: BoxFit.cover,
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 20),

                // Título
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset('assets/fundo/fundoTextoAm.png', width: 240),

                    const Text(
                      'Armário -\nCabeça',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 28),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Grid scrollável
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    itemCount: roupas.length, // mock por enquanto
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 24,
                          mainAxisSpacing: 24,
                          childAspectRatio: 1,
                        ),
                    itemBuilder: (context, index) {
                      return RoupaCard(roupa: roupas[index],);
                    },
                  ),
                ),
              ],
            ),
          ),

          // Botão "+"
          Positioned(
            bottom: 100,
            right: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/addRoupa');
              },
              child: Image.asset('assets/botoes/botaoAdd.png', width: 80),
            ),
          ),
        ],
      ),
    );
  }
}
