import 'package:armario_virtual/src/widgets/roupaCard.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import '../../model/roupa.dart';
import '../widgets/decorators/animator.dart';

const List<String> categorias = ['cabeca', 'tronco', 'pernas', 'pes'];

class adicionarRoupa extends StatefulWidget {
  const adicionarRoupa({super.key, this.categoria = 'cabeca'});

  final String categoria;

  @override
  State<adicionarRoupa> createState() => _adicionarRoupaState();
}

class _adicionarRoupaState extends State<adicionarRoupa> {
  late String categoria;
  late String categoriaBonito;
  Uint8List imagemBytes = Uint8List.fromList([]);
  bool isLoadingImagem = false;

  @override
  void initState() {
    super.initState();
    categoria = widget.categoria;
  }

  void pedirRoupa() async {
    final ImageSource? source = await showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt_outlined),
                title: const Text('Tirar uma foto'),
                onTap: () => Navigator.pop(context, ImageSource.camera),
              ),
              ListTile(
                leading: const Icon(Icons.photo_library_outlined),
                title: const Text('Buscar na galeria'),
                onTap: () => Navigator.pop(context, ImageSource.gallery),
              ),
            ],
          ),
        );
      },
    );

    if (source == null) {
      return;
    }

    setState(() {
      isLoadingImagem = true;
    });

    try {
      final ImagePicker picker = ImagePicker();
      final XFile? pickedFile = await picker.pickImage(source: source);

      if (pickedFile == null) {
        return;
      }

      final bytes = await pickedFile.readAsBytes();

      if (!mounted) {
        return;
      }

      setState(() {
        imagemBytes = bytes;
      });

      final image = img.decodeImage(bytes);

      if (image != null) {
        final resizedImage = img.copyResize(
          image,
          width: 640,
          height: 640,
          interpolation: img.Interpolation.cubic,
        );
        final compressedBytes = img.encodeJpg(resizedImage, quality: 85);

        if (!mounted) {
          return;
        }

        setState(() {
          imagemBytes = Uint8List.fromList(compressedBytes);
        });
      }
    } finally {
      if (mounted) {
        setState(() {
          isLoadingImagem = false;
        });
      }
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
              padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/fundo/fundoTextoAm.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Animator(
                        child: IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Image.asset("assets/botoes/setaEsquerda.png", width: MediaQuery.of(context).size.width * 0.1,),
                        ),
                      ),
                      Text(
                        "Adicione sua\nroupa",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 30),
                      ),
                      SizedBox(width: 50, height: 1,)
                    ],
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
                        child: Center(
                          // decoration: BoxDecoration(
                          //   image: DecorationImage(
                          //     image: AssetImage(
                          //       'assets/icon/iconItemCategoria.png',
                          //     ),
                          //     fit: BoxFit.fill,
                          //   ),
                          // ),
                          child: Text(
                            Roupa.categoriaBonito[value]!,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24,
                              // backgroundColor: Color(0xFFF9B52E),
                            ),
                          ),
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
            // Adicionar foto

            // Mostrar foto
            Animator(
              duration: Duration(seconds: 10),
              child: SizedBox(
                // width: 50,
                height: MediaQuery.of(context).size.height * 0.35,
                child: RoupaCard(
                  roupa: Roupa(imagem: imagemBytes, categoria: categoria),
                  iconePadrao:
                      'assets/icon/icon${categoria[0].toUpperCase()}${categoria.substring(1)}.png',
                  navegar: false,
                  funcaoOnTap: pedirRoupa,
                  isLoading: isLoadingImagem,
                ),
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: SafeArea(
        top: false,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/fundo/fundoBotaoV.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              spacing: 0,
              children: [
                Animator(
                  duration: Duration(seconds: 9),
                  child: Expanded(
                    child: GestureDetector(
                      onTap: pedirRoupa,
                      child: Image.asset(
                        'assets/icon/iconCamera.png',
                        height: 100,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
        
                // Enviar foto
                Animator(
                  offsetAnimation: 4,
                  child: Expanded(
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
