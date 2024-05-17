import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class DbUtil {
  static const version = 1;
  static const dataBaseName = 'todoListApp';

  Future<Database> openConnection() async {
    final dbPath = await getDatabasesPath();
    String databaseFinalPath = path.join(dbPath, dataBaseName);
    final database = openDatabase(
      databaseFinalPath,
      onCreate: (db, version) {
        db.execute('''
  CREATE TABLE todo(
    id Integer primary key autoincrement,
    descricao varchar(500) not null,
    data_hora datetime,
    finalizado integer
  )
''');
      },
    );
    return database;
  }


  /* método para inserir os dados no sqflite */
  Future<void> insert(String table, Map<String, dynamic> data) async {
    final database = await DbUtil().openConnection();
    await database.insert(table, data);
  }

  /* método para obter os dados no sqflite */
    Future<List<Map<String, dynamic>>> getData(String table) async {
    final database = await DbUtil().openConnection();
    final responseTable = database.query(table);
    return responseTable;
  }

  /* método para deletar os dados no sqflite */
  Future<int> delete(String id) async {
    final database = await DbUtil().openConnection();
    return database.delete('table', where: 'id=?', whereArgs: [id]);
  }

}
