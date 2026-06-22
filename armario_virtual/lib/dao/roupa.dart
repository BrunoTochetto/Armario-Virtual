//Arquivo para juntar tanto a estrutura do banco de dados como o banco em sí.
import 'package:sqflite/sqflite.dart';
// Pega todos os arquivos para integrar
import '../model/roupa.dart';
import '../database/db.dart';

const tabela = 'roupa';
  
Future<int> inserirDatabase(Roupa roupa) async {
	final Database db = await getDataBase();
	return db.insert(tabela, roupa.toMap()); // Basicamente um DB Insert de um JSON
}

// Get
Future<List<Map<String, dynamic>>> acharTodosDatabase() async {
	final Database db = await getDataBase();
	List<Map<String, dynamic>> result = await db.query(tabela);
	return result;
}

// Get
Future<List<Map<String, dynamic>>> acharRoupaDeCategoriaDatabase(String categoria) async {
	final Database db = await getDataBase();
	List<Map<String, dynamic>> result = await db.query(tabela, where: 'categoria = ?', whereArgs: [categoria]);
	return result;
}

Future<int> deletePorIdDatabase(int id) async{
	final Database db = await getDataBase();
	// Tratamento de dados necessário
	return db.delete(tabela, where: "id = ?", whereArgs: [id]);
}