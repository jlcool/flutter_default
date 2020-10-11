 

import '../../../db/irepository/base/ibase_repository.dart';
import '../../../db/iservices/base/ibase_services.dart';
import 'package:sqflite/sqflite.dart';

class BaseServices<T> implements IBaseServices<T> {

  IBaseRepository<T> baseDal;
  Future<T> first([String where,String orderBy]) {
    return baseDal.first(where,orderBy);
  }

  @override
  Future<int> insert(T entity,{ConflictAlgorithm conflictAlgorithm}) {
    return baseDal.insert(entity,conflictAlgorithm: conflictAlgorithm);
  }

  @override
  Future<int> delete({String where, List whereArgs}) {
    return baseDal.delete(where:where,whereArgs:whereArgs);
  }

  @override
  Future<List<T>> query({String where,List whereArgs,int limit,String orderBy}) async {
    return await baseDal.query(where:where,whereArgs:whereArgs,limit:limit,orderBy:orderBy);
  }

  @override
  Future<int> update(T entity) {
    return baseDal.update(entity);
  }

  @override
  Future<int> count(String where, [List whereArgs]) {
    return baseDal.count(where,whereArgs);
  }

  @override
  Future<bool> exist(String where, [List whereArgs]) {
    return baseDal.exist(where,whereArgs);
  }

  @override
  Future<int> deleteUpdateMap(String where,[List whereArgs]) {
    return baseDal.deleteUpdateMap(where,whereArgs);
  }

  @override
  Future<int> updateMap(Map entity, {String where, List whereArgs}) {
    return baseDal.updateMap(entity,where:where,whereArgs:whereArgs);
  }

  @override
  Future<int> deleteUpdateAll(List<T> entitys) {
    return baseDal.deleteUpdateAll(entitys);
  }

  @override
  Future<int> max(String field, String where, [List whereArgs]) {
    return baseDal.max(field,where,whereArgs);
  }

  @override
  insertMap(Map entity, {ConflictAlgorithm conflictAlgorithm}) async {
    await baseDal.insertMap(entity,conflictAlgorithm:conflictAlgorithm);
  }

  @override
  Future<int> insertAll(List<T> entitys, {ConflictAlgorithm conflictAlgorithm}) async {
    return await baseDal.insertAll(entitys,conflictAlgorithm:conflictAlgorithm);
  }
}
