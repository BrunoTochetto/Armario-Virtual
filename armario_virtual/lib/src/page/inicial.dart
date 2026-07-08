// import 'package:armario_virtual/src/widgets/botao_papelao.dart';
import 'package:flutter/material.dart';
import '../widgets/bottomNavigation.dart';
import '../widgets/passarRoupa.dart';
import '../../model/roupa.dart';
import '../widgets/roupaCard.dart';

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
        alignment: AlignmentGeometry.bottomRight,

        child: ListView(
          children: [
            _compactFutureBuilderParaRoupas(
              carregarRoupas: () => Roupa.acharRoupaDeCategoria('cabeca'),
              iconePadrao: 'assets/icon/iconCabeca.png',
              fundo: 'fundoBotaoAm',
            ),

            SizedBox(height: 8),

            _compactFutureBuilderParaRoupas(
              carregarRoupas: () => Roupa.acharRoupaDeCategoria('tronco'),
              iconePadrao: 'assets/icon/iconTronco.png',
              fundo: 'fundoBotaoAz',
            ),

            SizedBox(height: 8),

            _compactFutureBuilderParaRoupas(
              carregarRoupas: () => Roupa.acharRoupaDeCategoria('pernas'),
              iconePadrao: 'assets/icon/iconPernas.png',
              fundo: 'fundoBotaoV',
            ),

            SizedBox(height: 8),

            _compactFutureBuilderParaRoupas(
              carregarRoupas: () => Roupa.acharRoupaDeCategoria('pes'),
              iconePadrao: 'assets/icon/iconPes.png',
              fundo: 'fundoBotaoAz',
            ),
          ],
        ),
      ),
    );
  }
}

class _compactFutureBuilderParaRoupas extends StatefulWidget {
  final Future<List<Map<String, dynamic>>> Function() carregarRoupas;
  final String iconePadrao;
  final String fundo;

  const _compactFutureBuilderParaRoupas({
    super.key,
    required this.carregarRoupas,
    this.iconePadrao = 'assets/icon/iconCabeca.png',
    this.fundo = 'fundoBotaoAm',
  });

  @override
  State<_compactFutureBuilderParaRoupas> createState() =>
      _compactFutureBuilderParaRoupasState();
}

class _compactFutureBuilderParaRoupasState
    extends State<_compactFutureBuilderParaRoupas> {
  late Future<List<Map<String, dynamic>>> _future;

  @override
  void initState() {
    super.initState();
    _future = widget.carregarRoupas();
  }

  void atualizar() {
    setState(() {
      _future = widget.carregarRoupas();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      initialData: [
        // RoupaCard(
        //   papelFundo: widget.fundo,
        //   iconePadrao: widget.iconePadrao,
        //   navegar: false,
        //   roupa: null,
        // ),
        // PassarRoupa(
        //       fundo: widget.fundo,
        //       iconePadrao: widget.iconePadrao,
        //       atualizarPaginaQueEsta: atualizar,
        //       roupaLista: [],
        //     )
      ],
      future: _future,
      builder: (context, snapshot) {
        //Snapshot é a variável dos dados pegados.
        // Também deve-se tratar os estados de uma conexão.
        // Essa conexão é com o banco. Tanto externo como interno.
        // Esses estados são feitos no snapshot.
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Text("Erro de conexão com o banco de dados.");
          case ConnectionState.active:
          case ConnectionState.waiting:
            return RoupaCard(
                  papelFundo: widget.fundo,
                  iconePadrao: widget.iconePadrao,
                  navegar: false,
                  roupa: null,
                  width: MediaQuery.of(context).size.width * 0.48,
                );
            // return PassarRoupa(
            //   fundo: widget.fundo,
            //   iconePadrao: widget.iconePadrao,
            //   // atualizarPaginaQueEsta: atualizar,
            //   roupaLista: [],
            // );
            case ConnectionState.done:
            // Obter as informações do banco
            List<Map<String, dynamic>> valores =
                snapshot.data
                    as List<
                      Map<String, dynamic>
                    >; // Casting, fazendo o snapshot ser forçadamente um Map

            return PassarRoupa(
              fundo: widget.fundo,
              iconePadrao: widget.iconePadrao,
              roupaLista: valores,
              atualizarPaginaQueEsta: atualizar,
            );
        }
      },
    );
  }
}
