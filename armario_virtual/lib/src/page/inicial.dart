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
        child: ListView(
          children: [
            _compactFutureBuilderParaRoupas(
              future: Roupa.acharRoupaDeCategoria('cabeca'),
              // initialData:,
              iconePadrao: 'assets/icon/iconCabeca.png',
              fundo: 'fundoBotaoAm',

            ),
            
            SizedBox(height: 8),

            _compactFutureBuilderParaRoupas(
              future: Roupa.acharRoupaDeCategoria('tronco'),
              // initialData:,
              iconePadrao: 'assets/icon/iconTronco.png',
              fundo: 'fundoBotaoAz',
            ),
            
            SizedBox(height: 8),

            _compactFutureBuilderParaRoupas(
              future: Roupa.acharRoupaDeCategoria('pernas'),
              // initialData:,
              iconePadrao: 'assets/icon/iconPernas.png',
              fundo: 'fundoBotaoV',
            ),
            
            SizedBox(height: 8),

            _compactFutureBuilderParaRoupas(
              future: Roupa.acharRoupaDeCategoria('pes'),
              // initialData:,
              iconePadrao: 'assets/icon/iconPes.png',
              fundo: 'fundoBotaoAz',
            ),
            
            SizedBox(height: 8),
          ]
      )));
  }
}

class _compactFutureBuilderParaRoupas extends StatelessWidget {
  Future<List<Map<String, dynamic>>>? future;
  List<Map<String, dynamic>>? initialData;
  final String iconePadrao;
  final String fundo;

    _compactFutureBuilderParaRoupas({
      required this.future,
      this.initialData,
      this.iconePadrao = 'assets/icon/iconCabeca.png',
      this.fundo = 'fundoBotaoAm',
    });

    int valorAtual = 0;
    
    @override
    Widget build(BuildContext context) {
      return FutureBuilder(
      initialData: initialData,
      future: future,
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
              return Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              // Obter as informações do banco
              List<Map<String, dynamic>> valores = snapshot.data as List<Map<String, dynamic>>; // Casting, fazendo o snapshot ser forçadamente um Map
              
              
              return PassarRoupa(
                fundo: fundo,
                iconePadrao: iconePadrao,
                roupaLista: valores,
              );
          }
      },
      );
    }
    
  }
