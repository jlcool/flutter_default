import '../../../model/db/member.dart';
import '../../../db/irepository/unit_of_work/iunit_of_work.dart';
import '../../../db/irepository/base/ibase_repository.dart';
import 'package:sqflite/sqflite.dart';

class BaseRepository<T> implements IBaseRepository<T> {
  Database get db => _db;
  Database _db;

  IUnitOfWork _unitOfWork;
  BaseRepository(IUnitOfWork unitOfWork) {
    _unitOfWork = unitOfWork;
    _db = unitOfWork.getDbClient();
  }

  @override
  Future<T> first([String where, String orderBy]) async {
    List<dynamic> _datas;
    List<dynamic> _list;
    if (IUnitOfWork.transaction != null) {
      _list = await IUnitOfWork.transaction
          .query(tableName<T>(), limit: 1, where: where, orderBy: orderBy);
    } else {
      _list = await _db.query(tableName<T>(),
          limit: 1, where: where, orderBy: orderBy);
    }

    _datas = _list.map<T>((c) {
      return fromJson<T>(c);
    }).toList();

    if (_datas != null && _datas.length > 0) {
      return _datas.first as T;
    }
    return null;
  }

  T fromJson<T>(Map map) {
    Type type = T;
    switch (type) {
      case Member:
        return Member.fromJson(map) as T;
      default:
        throw StateError('未知类型 \'$type\'');
    }
  }

  Map toJson(dynamic entity) {
    if (entity is Member) {
      return entity.toJson();
    }
    return entity.toJson();
  }

  String where(dynamic entity) {
    Type type = T;
    switch (type) {
      default:
        return "j_id='${entity.id}'";
    }
  }

  String tableName<T>() {
    Type type = T;
    switch (type) {
      case Member:
        return "t_member";
      default:
        throw StateError('未知类型 \'$type\'');
    }
  }

  @override
  Future<int> insert(T entity, {ConflictAlgorithm conflictAlgorithm}) async {
    if (IUnitOfWork.batch != null) {
      IUnitOfWork.batch.insert(tableName<T>(), toJson(entity),
          conflictAlgorithm: conflictAlgorithm);
      return 0;
    } else if (IUnitOfWork.transaction != null) {
      return await IUnitOfWork.transaction.insert(
          tableName<T>(), toJson(entity),
          conflictAlgorithm: conflictAlgorithm);
    } else {
      return await db.insert(tableName<T>(), toJson(entity),
          conflictAlgorithm: conflictAlgorithm);
    }
  }

  @override
  Future<int> insertAll(List<T> entitys,
      {ConflictAlgorithm conflictAlgorithm}) async {
    if (IUnitOfWork.batch != null) {
      for (var i = 0; i < entitys.length; i++) {
        IUnitOfWork.batch.insert(tableName<T>(), toJson(entitys[i]),
            conflictAlgorithm: conflictAlgorithm);
      }
    } else if (IUnitOfWork.transaction != null) {
      for (var i = 0; i < entitys.length; i++) {
        await IUnitOfWork.transaction.insert(tableName<T>(), toJson(entitys[i]),
            conflictAlgorithm: conflictAlgorithm);
      }
    } else {
      try{
      await db.transaction((txn) async {
        IUnitOfWork.transaction = txn;
        IUnitOfWork.batch = txn.batch();
        for (var i = 0; i < entitys.length; i++) {
          IUnitOfWork.batch.insert(tableName<T>(), toJson(entitys[i]),
              conflictAlgorithm: conflictAlgorithm??ConflictAlgorithm.replace);
        }
        await IUnitOfWork.batch.commit();
      });
      }catch(err){}finally{
        IUnitOfWork.transaction = null;
        IUnitOfWork.batch = null;
      }
    }
    return entitys.length;
  }

  @override
  Future<int> delete({String where, List<dynamic> whereArgs}) async {
    if (IUnitOfWork.batch != null) {
      IUnitOfWork.batch
          .delete(tableName<T>(), where: where, whereArgs: whereArgs);
      return 0;
    } else if (IUnitOfWork.transaction != null) {
      return await IUnitOfWork.transaction
          .delete(tableName<T>(), where: where, whereArgs: whereArgs);
    } else {
      return await db.delete(tableName<T>(),
          where: where, whereArgs: whereArgs);
    }
  }

  @override
  Future<List<T>> query({String where, List<dynamic> whereArgs,int limit,String orderBy}) async {
    List<Map<String, dynamic>> _map;
    if (IUnitOfWork.transaction != null) {
      _map = await IUnitOfWork.transaction
          .query(tableName<T>(), where: where, whereArgs: whereArgs,orderBy: orderBy,limit: limit);
    } else {
      _map = await db.query(tableName<T>(), where: where, whereArgs: whereArgs,orderBy: orderBy,limit: limit);
    }
    if (_map == null) {
      return null;
    } else {
      return _map.map<T>((m) {
        return fromJson(m);
      }).toList();
    }
  }

  @override
  insertMap(Map entity, {ConflictAlgorithm conflictAlgorithm}) async {
    dynamic _db = IUnitOfWork.batch ?? IUnitOfWork.transaction ?? db;
    await _db.insert(tableName<T>(), entity,
        conflictAlgorithm: conflictAlgorithm);
  }

  @override
  Future<int> update(T entity) async {
    if (IUnitOfWork.batch != null) {
      IUnitOfWork.batch
          .update(tableName<T>(), toJson(entity), where: where(entity));
      return 0;
    } else if (IUnitOfWork.transaction != null) {
      return await IUnitOfWork.transaction
          .update(tableName<T>(), toJson(entity), where: where(entity));
    } else {
      return await db.update(tableName<T>(), toJson(entity),
          where: where(entity));
    }
  }

  @override
  Future<int> updateMap(Map entity, {String where, List whereArgs}) async {
    if (IUnitOfWork.batch != null) {
      IUnitOfWork.batch
          .update(tableName<T>(), entity, where: where, whereArgs: whereArgs);
      return 0;
    } else if (IUnitOfWork.transaction != null) {
      return await IUnitOfWork.transaction
          .update(tableName<T>(), entity, where: where, whereArgs: whereArgs);
    } else {
      return await db.update(tableName<T>(), entity,
          where: where, whereArgs: whereArgs);
    }
  }

  @override
  Future<int> count(String where, [List whereArgs]) async {
    var db = IUnitOfWork.transaction ?? _db;
    List<Map<String, dynamic>> list = [];
    list = await db.rawQuery(
        'SELECT count(*) FROM ${tableName<T>()} where $where', whereArgs);
    if (list != null && list.length > 0) {
      return Sqflite.firstIntValue(list);
    }
    return 0;
  }

  @override
  Future<int> max(String field, String where, [List whereArgs]) async {
    var db = IUnitOfWork.transaction ?? _db;
    List<Map<String, dynamic>> list = [];
    list = await db.rawQuery(
        'SELECT max($field) FROM ${tableName<T>()} where $where', whereArgs);

    if (list != null && list.length > 0) {
      return Sqflite.firstIntValue(list);
    }
    return 0;
  }

  @override
  Future<bool> exist(String where, [List whereArgs]) async {
    List<Map<String, dynamic>> list = [];
    if (IUnitOfWork.transaction != null) {
      list = await IUnitOfWork.transaction.rawQuery(
          'SELECT count(*) FROM ${tableName<T>()} where $where', whereArgs);
    } else {
      list = await db.rawQuery(
          'SELECT count(*) FROM ${tableName<T>()} where $where', whereArgs);
    }
    if (list != null && list.length > 0) {
      return Sqflite.firstIntValue(list) > 0;
    }
    return false;
  }

  @override
  Future<int> deleteUpdateMap(String where, [List whereArgs]) async {
    dynamic _db = IUnitOfWork.batch ?? IUnitOfWork.transaction ?? db;
    Map<String, dynamic> _map = Map<String, dynamic>();
    _map["j_deleted"] = 1;
    _map["j_update_time"] = DateTime.now().millisecondsSinceEpoch;
    int count = await _db.update(tableName<T>(), _map,
        where: where, whereArgs: whereArgs);
    return count;
  }

  @override
  Future<int> deleteUpdateAll(List<T> entitys) async {
    Map<String, dynamic> _map = Map<String, dynamic>();
    _map["j_deleted"] = 1;
    _map["j_update_time"] = DateTime.now().millisecondsSinceEpoch;

    if (IUnitOfWork.batch != null) {
      for (var i = 0; i < entitys.length; i++) {
        IUnitOfWork.batch
            .update(tableName<T>(), _map, where: where(entitys[i]));
      }
    } else if (IUnitOfWork.transaction != null) {
      for (var i = 0; i < entitys.length; i++) {
        await IUnitOfWork.transaction
            .update(tableName<T>(), _map, where: where(entitys[i]));
      }
    } else {
      for (var i = 0; i < entitys.length; i++) {
        await db.update(tableName<T>(), _map, where: where(entitys[i]));
      }
    }
    return entitys.length;
  }
}
