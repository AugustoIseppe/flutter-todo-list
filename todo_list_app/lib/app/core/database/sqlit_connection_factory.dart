import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:synchronized/synchronized.dart';
import 'package:todo_list_app/app/core/database/sqflite_migration_factory.dart';

class SqliteConnectionFactory {
  //Utilizando o padrao Singleton

  static const version = 1;
  static const dataBaseName = 'TODO_LIST_PROVIDER';
  static SqliteConnectionFactory? _instance;

  Database? _db;
  final _lock = Lock();

  SqliteConnectionFactory._();

  factory SqliteConnectionFactory() {
    _instance ??= SqliteConnectionFactory._();
    return _instance!;
  }

  Future<Database> openConnection() async {
    var databasePath = await getDatabasesPath();
    String databasePathFinal = join(databasePath, dataBaseName);
    if (_db == null) {
      await _lock.synchronized(() async {
        // ignore: prefer_conditional_assignment
        if (_db == null) {
          _db = await openDatabase(databasePathFinal,
              version: version,
              onConfigure: _onConfigure,
              onCreate: _onCreate,
              onUpgrade: _onUpgrade,
              onDowngrade: _onDowngrade);
        }
      });
    }

    return _db!;
  }

  void closeConnection() {
    _db?.close();
    _db = null;
  }

  Future<void> _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  Future<void> _onCreate(Database db, int version) async {
    final batch = db.batch();
    final migrations = SqfliteMigrationFactory().getCreateMigration();
    for (var migration in migrations) {
      migration.create(batch);
    }

    batch.commit();
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int version) async {
    final batch = db.batch();
    final migrations = SqfliteMigrationFactory().getUpgradeMigration(oldVersion);
    for (var migration in migrations) {
      migration.upgade(batch);
    }

    batch.commit();
  }

  Future<void> _onDowngrade(Database db, int oldVersion, int version) async {}
  
}
