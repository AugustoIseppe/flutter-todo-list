import 'package:todo_list_app/app/core/database/migrations/migration.dart';
import 'package:sqflite/sqflite.dart';

class MigrationV2 implements Migration {

  //AS MIGRATIONS SÃO AS QUERYS A SEREM EXECUTADAS
  @override
  void create(Batch batch) {
    batch.execute('''
  CREATE TABLE todoTeste(
    id Integer primary key autoincrement,
    descricao varchar(500) not null,
    data_hora datetime,
    finalizado integer
  )
''');
  }

  // A MIGRATION V1 NÃO TEM UM UPGRADE POR SER A VERSION 1
  @override
  void upgade(Batch batch) {
     batch.execute('''
  CREATE TABLE todoTeste(
    id Integer primary key autoincrement,
    descricao varchar(500) not null,
    data_hora datetime,
    finalizado integer
  )
''');
  }
}
