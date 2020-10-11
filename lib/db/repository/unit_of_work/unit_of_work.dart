import '../../../db/irepository/unit_of_work/iunit_of_work.dart';
import 'package:sqflite/sqflite.dart';

class UnitOfWork with IUnitOfWork {
  Database _sqlClient;
  static Database db;

  // UnitOfWork.web() {
  //   _sqlClient = SqliteConnection();
  // }
  UnitOfWork.mobile() {
    _sqlClient = db;
  }
  @override
  Database getDbClient() {
    return _sqlClient;
  }
 
}
