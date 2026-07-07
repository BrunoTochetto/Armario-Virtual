import 'package:path/path.dart';
import "package:sqflite/sqflite.dart";


// função auxiliar ASSÍNCRONA para PEGAR as infos do banco;
// Também, a conexão do banco de dados;;
Future<Database> getDataBase() async {
  final String caminhoBanco = join(
    await getDatabasesPath(),
    'databaseArmario.db',
  ); // Variável do endereço padrão do armazenamento do banco de dados no dispositivo
  return openDatabase(
    caminhoBanco,
    onCreate: (db, version) {
      // Só executa isso se não existe o banco;
      db.execute('CREATE TABLE roupa (id INTEGER PRIMARY KEY AUTOINCREMENT, imagem BLOB, categoria TEXT)'); // Criação das tabelas
      print("database Criada");
    },
    version: 6,
  );
}
