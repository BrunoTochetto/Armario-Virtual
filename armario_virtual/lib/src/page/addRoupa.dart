import 'package:armario_virtual/src/widgets/roupaCard.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import '../../model/roupa.dart';

const List<String> categorias = ['cabeca', 'tronco', 'pernas', 'pes'];

class adicionarRoupa extends StatefulWidget {
  const adicionarRoupa({super.key, this.categoria = 'cabeca'});

  final String categoria;

  @override
  State<adicionarRoupa> createState() => _adicionarRoupaState();
}

class _adicionarRoupaState extends State<adicionarRoupa> {
  late String categoria;
  Uint8List imagemBytes = Uint8List.fromList([]);

  @override
  void initState() {
    super.initState();
    categoria = widget.categoria;
  }

  void pedirRoupa() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      // Convert image into raw bytes (Uint8List)
      final bytes = await pickedFile.readAsBytes();
      setState(() {
        imagemBytes = bytes;
      });
    }
  }

  Future<bool> inserirRoupa() async {
    // Insert into SQLite database
    if (imagemBytes.isEmpty) {
      return false;
    }
    Roupa roupaAadicionar = Roupa(imagem: imagemBytes, categoria: categoria);
    await Roupa.inserir(roupaAadicionar);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Roupa'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Selecionador de categoria
          DropdownButton<String>(
            icon: const Icon(Icons.arrow_downward),
            elevation: 16,
            value: categoria,
            items: categorias.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(Roupa.categoriaBonito[value]!),
              );
            }).toList(),
            onChanged: (String? value) {
              setState(() {
                categoria = value!;
              });
            },
          ),

          const SizedBox(height: 24),
          // Adicionar foto
          SizedBox(
            width: 50,
            height: 50,
            child: IconButton(
              onPressed: pedirRoupa,
              icon: const Icon(Icons.add_a_photo_outlined),
            ),
          ),

          // Mostrar foto
          SizedBox(
            width: 50,
            height: 250,
            child: RoupaCard(
              roupa: Roupa(imagem: imagemBytes, categoria: categoria),
            ),
          ),

          // Enviar foto
          IconButton(
            onPressed: () async {
              bool deuBoa = await inserirRoupa();
              if (deuBoa) {
                Navigator.pop(context);
              }
            },
            icon: Icon(Icons.save),
          ),
        ],
      ),
    );
  }
}
