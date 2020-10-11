import 'package:sqflite/sqflite.dart';

abstract class IUnitOfWork {
  Database getDbClient();
  static Batch batch;
  static Transaction transaction;
}
