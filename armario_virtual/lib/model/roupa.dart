import '../dao/roupa.dart';
import 'dart:typed_data';

class Roupa {
  int? id;
  final Uint8List imagem; // Uma imagem é salva como um "binary data" ou BLOB, então é preciso utilizar um Unissigned Integer 8 List para pegar os dados da imagem, transformar em binário para armazrenar corretamente.
  final String categoria;

  Roupa({
    this.id,
    required this.imagem,
    required this.categoria,
  });

  Map<String, dynamic> toMap(){
     return {
      "id": id,
      "imagem": imagem,
      "categoria": categoria
     };
  }

  static Map<String, String> categoriaBonito = {
    "cabeca": "Cabeça",
    "tronco": "Tronco",
    "pernas": "Pernas",
    "pes": "Pés"
  };

  static Future<int> inserir(Roupa roupa) async {
    return await inserirDatabase(roupa);
  }

  static Future<List<Map<String, dynamic>>> acharTodos() async {
    return await acharTodosDatabase();
  }

  static Future<List<Map<String, dynamic>>> acharRoupaDeCategoria(String categoria) async {
    return await acharRoupaDeCategoriaDatabase(categoria);
  }

  static Future<int> deletePorId(int id) async {
    return await deletePorIdDatabase(id);
  }

  static Roupa fromMap(Map<String, dynamic> map) {
    return Roupa(
      id: map['id'] as int,
      imagem: map['imagem'] as Uint8List,
      categoria: map['categoria'] as String,
    );
  }

  @override
  String toString() {
    return "Roupa:(id: $id, imagem: $imagem, categoria: $categoria)";
  }
}