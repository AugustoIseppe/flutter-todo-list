
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class DbUtil {

static const version = 1;
  static const dataBaseName = 'TODO_LIST_PROVIDER';

  Future<Database> database() async {
    final dbPath = await getDatabasesPath();
    final database  = openDatabase(
      path.join(dbPath, "todolistapp.db"),
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
}