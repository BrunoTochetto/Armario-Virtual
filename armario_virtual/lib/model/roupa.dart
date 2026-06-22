import '../dao/roupa.dart';

class Roupa {
  final int id;
  final String imagem;
  final String categoria;

  const Roupa({
    required this.id,
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
      imagem: map['imagem'] as String,
      categoria: map['categoria'] as String,
    );
  }

  @override
  String toString() {
    return "Roupa:(id: $id, imagem: $imagem, categoria: $categoria)";
  }
}