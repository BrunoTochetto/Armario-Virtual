import 'package:flutter/material.dart';
import '../widgets/roupaCard.dart';
import '../widgets/bottomNavigation.dart';
import '../../model/roupa.dart';
import '../widgets/decorators/animator.dart';

class ArmarioPadrao extends StatefulWidget {
  final String fundoTela;
  final String textoArmario;
  final String categoria;

  const ArmarioPadrao({
    super.key,
    required this.fundoTela,
    required this.textoArmario,
    required this.categoria,
  });

  @override
  State<ArmarioPadrao> createState() => _ArmarioPadraoState();
}

class _ArmarioPadraoState extends State<ArmarioPadrao> {
  Future<List<Map<String, dynamic>>> _carregarRoupas() async {
    // Simular carregamento de dados
    // return roupasMock;
    final dados = await Roupa.acharRoupaDeCategoria(widget.categoria);
    return dados;
  }

  void atualizar() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomBar(),
      body: Stack(
        children: [
          // Fundo
          Positioned.fill(
            child: Image.asset(
              'assets/fundoTela/${widget.fundoTela}.png',
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

                    Text(
                      'Armário \n${widget.textoArmario}',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 28),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Grid scrollável
                Expanded(
                  child: FutureBuilder<List<Map<String, dynamic>>>(
                    future: _carregarRoupas(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Erro: ${snapshot.error}'));
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(
                          child: Text('Nenhuma roupa encontrada'),
                        );
                      }

                      final roupas = snapshot.data!;
                      return GridView.builder(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        itemCount: roupas.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 24,
                              mainAxisSpacing: 24,
                              childAspectRatio: 1,
                            ),
                        itemBuilder: (context, index) {
                          return Animator(
                            offsetAnimation: index % 6,
                            child: RoupaCard(
                              atualizarPaginaQueEsta: atualizar,
                              roupa: Roupa.fromMap(roupas[index]),
                              // width: MediaQuery.of(context).size.width * 0.1,
                              // height: MediaQuery.of(context).size.width * 0.1,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      // Botão "+"
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            '/addRoupa',
            arguments: {'categoria': widget.categoria},
          ).then((onValue) => setState(() => {}));
        },
        backgroundColor: Colors.transparent,
        child: Image.asset('assets/botoes/botaoAdd.png', width: 80),
      ),
    );
  }
}
