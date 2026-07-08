import 'package:armario_virtual/src/widgets/roupaCard.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import '../../model/roupa.dart';
import '../widgets/bottomNavigation.dart';

class SelecaoRoupa extends StatelessWidget {
  final Roupa roupa;
  const SelecaoRoupa({super.key, required this.roupa});

  void _deletar() {
    int id = roupa.id as int;
    Roupa.deletePorId(id);
  }

  @override
  Widget build(BuildContext context) {
    Widget roupaWidget = Image.memory(roupa.imagem, fit: BoxFit.contain);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Esta roupa'),
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back_ios_new_outlined),
        //   onPressed: () => Navigator.pop(context),
        // ),
      ),

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/fundo/fundoBranco.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            roupaWidget,
            IconButton(
              onPressed: () {
                _deletar();
                Navigator.pop(context);
              },
              icon: Icon(Icons.delete_forever),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }
}
