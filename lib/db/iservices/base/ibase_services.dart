import 'package:sqflite/sqflite.dart';

abstract class IBaseServices<T>{
Future<T> first([String where,String orderBy]);
Future<int> delete({String where,List<dynamic> whereArgs});
Future<int> deleteUpdateAll(List<T> entitys);
Future<int> insert(T entity,{ConflictAlgorithm conflictAlgorithm});
insertMap(Map entity,{ConflictAlgorithm conflictAlgorithm});
Future<int> insertAll(List<T> entitys,{ConflictAlgorithm conflictAlgorithm});
Future<int> update(T entity);
Future<int> updateMap(Map entity,{String where,List<dynamic> whereArgs});
Future<int> deleteUpdateMap(String where,[List whereArgs]);
Future<List<T>> query({String where,List<dynamic> whereArgs,int limit,String orderBy});
Future<bool> exist(String where,[List<dynamic> whereArgs]);
Future<int> count(String where,[List<dynamic> whereArgs]);
Future<int> max(String field,String where, [List whereArgs]);
}