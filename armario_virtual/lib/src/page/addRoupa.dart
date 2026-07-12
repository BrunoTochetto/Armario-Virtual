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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/fundoTela/fundoVermPont.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Selecionador de categoria
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/fundo/fundoTextoAm.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Adicione sua\nroupa",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 28),
                  ),

                  const Divider(color: Colors.black, thickness: 2),

                  DropdownButton<String>(
                    value: categoria,
                    isExpanded: true,
                    underline: const SizedBox(), // remove a linha padrão

                    icon: const Icon(
                      Icons.arrow_drop_down,
                      size: 40,
                      color: Colors.black,
                    ),

                    items: categorias.map((value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(
                          Roupa.categoriaBonito[value]!,
                          style: const TextStyle(fontSize: 20),
                        ),
                      );
                    }).toList(),

                    onChanged: (value) {
                      setState(() {
                        categoria = value!;
                      });
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Mostrar foto
            SizedBox(
              width: 50,
              height: 280,
              child: RoupaCard(
                roupa: Roupa(imagem: imagemBytes, categoria: categoria),
              ),
            ),

            const SizedBox(height: 14),

            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: pedirRoupa,
                    child: Image.asset(
                      'assets/icon/iconCamera.png',
                      height: 100,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                const SizedBox(width: 16),

                Expanded(
                  child: InkWell(
                    onTap: () async {
                      bool deuBoa = await inserirRoupa();
                      if (deuBoa) {
                        Navigator.pop(context);
                      }
                    },
                    child: Image.asset(
                      'assets/botoes/botaoSalvar.png',
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
    );
  }
}
