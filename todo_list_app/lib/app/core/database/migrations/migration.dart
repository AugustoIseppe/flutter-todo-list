import 'package:sqflite/sqflite.dart';

abstract class Migration {
  void create(Batch batch){}
  void upgade(Batch batch){}
}