// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// SqfEntityGenerator
// **************************************************************************

//  These classes was generated by SqfEntity
//  Copyright (c) 2019, All rights reserved. Use of this source code is governed by a
//  Apache license that can be found in the LICENSE file.

//  To use these SqfEntity classes do following:
//  - import model.dart into where to use
//  - start typing ex:Wfjl.select()... (add a few filters with fluent methods)...(add orderBy/orderBydesc if you want)...
//  - and then just put end of filters / or end of only select()  toSingle() / or toList()
//  - you can select one or return List<yourObject> by your filters and orders
//  - also you can batch update or batch delete by using delete/update methods instead of tosingle/tolist methods
//    Enjoy.. Huseyin Tokpunar

// BEGIN TABLES
// Wfjl TABLE
class TableWfjl extends SqfEntityTableBase {
  TableWfjl() {
    // declare properties of EntityTable
    tableName = 'wfjl';
    primaryKeyName = 'id';
    primaryKeyType = PrimaryKeyType.integer_auto_incremental;
    useSoftDeleting = false;
    // when useSoftDeleting is true, creates a field named 'isDeleted' on the table, and set to '1' this field when item deleted (does not hard delete)

    // declare fields
    fields = [
      SqfEntityFieldBase('jsons', DbType.text,
          isUnique: false, isNotNull: false, isIndex: false),
      SqfEntityFieldBase('photos', DbType.text,
          isUnique: false, isNotNull: false, isIndex: false),
      SqfEntityFieldBase('submit', DbType.bool,
          isUnique: false, isNotNull: false, isIndex: false),
      SqfEntityFieldBase('photo1', DbType.blob,
          isUnique: false, isNotNull: false, isIndex: false),
      SqfEntityFieldBase('photo2', DbType.blob,
          isUnique: false, isNotNull: false, isIndex: false),
      SqfEntityFieldBase('photo3', DbType.blob,
          isUnique: false, isNotNull: false, isIndex: false),
      SqfEntityFieldBase('running', DbType.bool,
          isUnique: false, isNotNull: false, isIndex: false),
      SqfEntityFieldBase('msg', DbType.text,
          isUnique: false, isNotNull: false, isIndex: false),
    ];
    super.init();
  }
  static SqfEntityTableBase? _instance;
  static SqfEntityTableBase get getInstance {
    return _instance = _instance ?? TableWfjl();
  }
}
// END TABLES

// BEGIN DATABASE MODEL
class Srwzdb extends SqfEntityModelProvider {
  Srwzdb() {
    databaseName = srwzdb.databaseName;
    password = srwzdb.password;
    dbVersion = srwzdb.dbVersion;
    databaseTables = [
      TableWfjl.getInstance,
    ];

    bundledDatabasePath = srwzdb
        .bundledDatabasePath; //'assets/sample.db'; // This value is optional. When bundledDatabasePath is empty then EntityBase creats a new database when initializing the database
  }
}
// END DATABASE MODEL

// BEGIN ENTITIES
// region Wfjl
class Wfjl {
  Wfjl(
      {this.id,
      this.jsons,
      this.photos,
      this.submit,
      this.photo1,
      this.photo2,
      this.photo3,
      this.running,
      this.msg}) {
    _setDefaultValues();
  }
  Wfjl.withFields(this.jsons, this.photos, this.submit, this.photo1,
      this.photo2, this.photo3, this.running, this.msg) {
    _setDefaultValues();
  }
  Wfjl.withId(this.id, this.jsons, this.photos, this.submit, this.photo1,
      this.photo2, this.photo3, this.running, this.msg) {
    _setDefaultValues();
  }
  // fromMap v2.0
  Wfjl.fromMap(Map<String, dynamic> o, {bool setDefaultValues = true}) {
    if (setDefaultValues) {
      _setDefaultValues();
    }
    id = int.tryParse(o['id'].toString());
    if (o['jsons'] != null) {
      jsons = o['jsons'].toString();
    }
    if (o['photos'] != null) {
      photos = o['photos'].toString();
    }
    if (o['submit'] != null) {
      submit =
          o['submit'].toString() == '1' || o['submit'].toString() == 'true';
    }
    if (o['photo1'] != null) {
      photo1 = o['photo1'] as Uint8List;
    }
    if (o['photo2'] != null) {
      photo2 = o['photo2'] as Uint8List;
    }
    if (o['photo3'] != null) {
      photo3 = o['photo3'] as Uint8List;
    }
    if (o['running'] != null) {
      running =
          o['running'].toString() == '1' || o['running'].toString() == 'true';
    }
    if (o['msg'] != null) {
      msg = o['msg'].toString();
    }
  }
  // FIELDS (Wfjl)
  int? id;
  String? jsons;
  String? photos;
  bool? submit;
  Uint8List? photo1;
  Uint8List? photo2;
  Uint8List? photo3;
  bool? running;
  String? msg;

  BoolResult? saveResult;
  // end FIELDS (Wfjl)

  static const bool _softDeleteActivated = false;
  WfjlManager? __mnWfjl;

  WfjlManager get _mnWfjl {
    return __mnWfjl = __mnWfjl ?? WfjlManager();
  }

  // METHODS
  Map<String, dynamic> toMap(
      {bool forQuery = false, bool forJson = false, bool forView = false}) {
    final map = <String, dynamic>{};
    if (id != null) {
      map['id'] = id;
    }
    if (jsons != null) {
      map['jsons'] = jsons;
    }

    if (photos != null) {
      map['photos'] = photos;
    }

    if (submit != null) {
      map['submit'] = forQuery ? (submit! ? 1 : 0) : submit;
    }

    if (photo1 != null) {
      map['photo1'] = photo1;
    }

    if (photo2 != null) {
      map['photo2'] = photo2;
    }

    if (photo3 != null) {
      map['photo3'] = photo3;
    }

    if (running != null) {
      map['running'] = forQuery ? (running! ? 1 : 0) : running;
    }

    if (msg != null) {
      map['msg'] = msg;
    }

    return map;
  }

  Future<Map<String, dynamic>> toMapWithChildren(
      [bool forQuery = false,
      bool forJson = false,
      bool forView = false]) async {
    final map = <String, dynamic>{};
    if (id != null) {
      map['id'] = id;
    }
    if (jsons != null) {
      map['jsons'] = jsons;
    }

    if (photos != null) {
      map['photos'] = photos;
    }

    if (submit != null) {
      map['submit'] = forQuery ? (submit! ? 1 : 0) : submit;
    }

    if (photo1 != null) {
      map['photo1'] = photo1;
    }

    if (photo2 != null) {
      map['photo2'] = photo2;
    }

    if (photo3 != null) {
      map['photo3'] = photo3;
    }

    if (running != null) {
      map['running'] = forQuery ? (running! ? 1 : 0) : running;
    }

    if (msg != null) {
      map['msg'] = msg;
    }

    return map;
  }

  /// This method returns Json String [Wfjl]
  String toJson() {
    return json.encode(toMap(forJson: true));
  }

  /// This method returns Json String [Wfjl]
  Future<String> toJsonWithChilds() async {
    return json.encode(await toMapWithChildren(false, true));
  }

  List<dynamic> toArgs() {
    return [jsons, photos, submit, photo1, photo2, photo3, running, msg];
  }

  List<dynamic> toArgsWithIds() {
    return [id, jsons, photos, submit, photo1, photo2, photo3, running, msg];
  }

  static Future<List<Wfjl>?> fromWebUrl(Uri uri,
      {Map<String, String>? headers}) async {
    try {
      final response = await http.get(uri, headers: headers);
      return await fromJson(response.body);
    } catch (e) {
      print('SQFENTITY ERROR Wfjl.fromWebUrl: ErrorMessage: ${e.toString()}');
      return null;
    }
  }

  Future<http.Response> postUrl(Uri uri, {Map<String, String>? headers}) {
    return http.post(uri, headers: headers, body: toJson());
  }

  static Future<List<Wfjl>> fromJson(String jsonBody) async {
    final Iterable list = await json.decode(jsonBody) as Iterable;
    var objList = <Wfjl>[];
    try {
      objList = list
          .map((wfjl) => Wfjl.fromMap(wfjl as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('SQFENTITY ERROR Wfjl.fromJson: ErrorMessage: ${e.toString()}');
    }
    return objList;
  }

  static Future<List<Wfjl>> fromMapList(List<dynamic> data,
      {bool preload = false,
      List<String>? preloadFields,
      bool loadParents = false,
      List<String>? loadedFields,
      bool setDefaultValues = true}) async {
    final List<Wfjl> objList = <Wfjl>[];
    loadedFields = loadedFields ?? [];
    for (final map in data) {
      final obj = Wfjl.fromMap(map as Map<String, dynamic>,
          setDefaultValues: setDefaultValues);

      objList.add(obj);
    }
    return objList;
  }

  /// returns Wfjl by ID if exist, otherwise returns null
  ///
  /// Primary Keys: int? id
  ///
  /// bool preload: if true, loads all related child objects (Set preload to true if you want to load all fields related to child or parent)
  ///
  /// ex: getById(preload:true) -> Loads all related objects
  ///
  /// List<String> preloadFields: specify the fields you want to preload (preload parameter's value should also be "true")
  ///
  /// ex: getById(preload:true, preloadFields:['plField1','plField2'... etc])  -> Loads only certain fields what you specified
  ///
  /// bool loadParents: if true, loads all parent objects until the object has no parent

  ///
  /// <returns>returns Wfjl if exist, otherwise returns null
  Future<Wfjl?> getById(int? id,
      {bool preload = false,
      List<String>? preloadFields,
      bool loadParents = false,
      List<String>? loadedFields}) async {
    if (id == null) {
      return null;
    }
    Wfjl? obj;
    final data = await _mnWfjl.getById([id]);
    if (data.length != 0) {
      obj = Wfjl.fromMap(data[0] as Map<String, dynamic>);
    } else {
      obj = null;
    }
    return obj;
  }

  /// Saves the (Wfjl) object. If the id field is null, saves as a new record and returns new id, if id is not null then updates record

  /// <returns>Returns id
  Future<int?> save() async {
    if (id == null || id == 0) {
      id = await _mnWfjl.insert(this);
    } else {
      // id= await _upsert(); // removed in sqfentity_gen 1.3.0+6
      await _mnWfjl.update(this);
    }

    return id;
  }

  /// saveAs Wfjl. Returns a new Primary Key value of Wfjl

  /// <returns>Returns a new Primary Key value of Wfjl
  Future<int?> saveAs() async {
    id = null;

    return save();
  }

  /// saveAll method saves the sent List<Wfjl> as a bulk in one transaction
  ///
  /// Returns a <List<BoolResult>>
  static Future<List<dynamic>> saveAll(List<Wfjl> wfjls) async {
    // final results = _mnWfjl.saveAll('INSERT OR REPLACE INTO wfjl (id,jsons, photos, submit, photo1, photo2, photo3, running, msg)  VALUES (?,?,?,?,?,?,?,?,?)',wfjls);
    // return results; removed in sqfentity_gen 1.3.0+6
    await Srwzdb().batchStart();
    for (final obj in wfjls) {
      await obj.save();
    }
    //    return Srwzdb().batchCommit();
    final result = await Srwzdb().batchCommit();
    for (int i = 0; i < wfjls.length; i++) {
      if (wfjls[i].id == null) {
        wfjls[i].id = result![i] as int;
      }
    }

    return result!;
  }

  /// Updates if the record exists, otherwise adds a new row

  /// <returns>Returns id

  Future<int?> upsert() async {
    try {
      final result = await _mnWfjl.rawInsert(
          'INSERT OR REPLACE INTO wfjl (id,jsons, photos, submit, photo1, photo2, photo3, running, msg)  VALUES (?,?,?,?,?,?,?,?,?)',
          [id, jsons, photos, submit, photo1, photo2, photo3, running, msg]);
      if (result! > 0) {
        saveResult = BoolResult(
            success: true, successMessage: 'Wfjl id=$id updated successfully');
      } else {
        saveResult = BoolResult(
            success: false, errorMessage: 'Wfjl id=$id did not update');
      }
      return id;
    } catch (e) {
      saveResult = BoolResult(
          success: false,
          errorMessage: 'Wfjl Save failed. Error: ${e.toString()}');
      return null;
    }
  }

  /// inserts or replaces the sent List<<Wfjl>> as a bulk in one transaction.
  ///
  /// upsertAll() method is faster then saveAll() method. upsertAll() should be used when you are sure that the primary key is greater than zero
  ///
  /// Returns a BoolCommitResult
  Future<BoolCommitResult> upsertAll(List<Wfjl> wfjls) async {
    final results = await _mnWfjl.rawInsertAll(
        'INSERT OR REPLACE INTO wfjl (id,jsons, photos, submit, photo1, photo2, photo3, running, msg)  VALUES (?,?,?,?,?,?,?,?,?)',
        wfjls);
    return results;
  }

  /// Deletes Wfjl

  /// <returns>BoolResult res.success=Deleted, not res.success=Can not deleted

  Future<BoolResult> delete([bool hardDelete = false]) async {
    print('SQFENTITIY: delete Wfjl invoked (id=$id)');
    if (!_softDeleteActivated || hardDelete) {
      return _mnWfjl
          .delete(QueryParams(whereString: 'id=?', whereArguments: [id]));
    } else {
      return _mnWfjl.updateBatch(
          QueryParams(whereString: 'id=?', whereArguments: [id]),
          {'isDeleted': 1});
    }
  }

  WfjlFilterBuilder select(
      {List<String>? columnsToSelect, bool? getIsDeleted}) {
    return WfjlFilterBuilder(this)
      .._getIsDeleted = getIsDeleted == true
      ..qparams.selectColumns = columnsToSelect;
  }

  WfjlFilterBuilder distinct(
      {List<String>? columnsToSelect, bool? getIsDeleted}) {
    return WfjlFilterBuilder(this)
      .._getIsDeleted = getIsDeleted == true
      ..qparams.selectColumns = columnsToSelect
      ..qparams.distinct = true;
  }

  void _setDefaultValues() {}
  // END METHODS
  // BEGIN CUSTOM CODE
  /*
      you can define customCode property of your SqfEntityTable constant. For example:
      const tablePerson = SqfEntityTable(
      tableName: 'person',
      primaryKeyName: 'id',
      primaryKeyType: PrimaryKeyType.integer_auto_incremental,
      fields: [
        SqfEntityField('firstName', DbType.text),
        SqfEntityField('lastName', DbType.text),
      ],
      customCode: '''
       String fullName()
       { 
         return '$firstName $lastName';
       }
      ''');
     */
  // END CUSTOM CODE
}
// endregion wfjl

// region WfjlField
class WfjlField extends SearchCriteria {
  WfjlField(this.wfjlFB);
  // { param = DbParameter(); }
  DbParameter param = DbParameter();
  String _waitingNot = '';
  WfjlFilterBuilder wfjlFB;

  WfjlField get not {
    _waitingNot = ' NOT ';
    return this;
  }

  WfjlFilterBuilder equals(dynamic pValue) {
    param.expression = '=';
    wfjlFB._addedBlocks = _waitingNot == ''
        ? setCriteria(pValue, wfjlFB.parameters, param, SqlSyntax.EQuals,
            wfjlFB._addedBlocks)
        : setCriteria(pValue, wfjlFB.parameters, param, SqlSyntax.NotEQuals,
            wfjlFB._addedBlocks);
    _waitingNot = '';
    wfjlFB._addedBlocks.needEndBlock![wfjlFB._blockIndex] =
        wfjlFB._addedBlocks.retVal;
    return wfjlFB;
  }

  WfjlFilterBuilder equalsOrNull(dynamic pValue) {
    param.expression = '=';
    wfjlFB._addedBlocks = _waitingNot == ''
        ? setCriteria(pValue, wfjlFB.parameters, param, SqlSyntax.EQualsOrNull,
            wfjlFB._addedBlocks)
        : setCriteria(pValue, wfjlFB.parameters, param,
            SqlSyntax.NotEQualsOrNull, wfjlFB._addedBlocks);
    _waitingNot = '';
    wfjlFB._addedBlocks.needEndBlock![wfjlFB._blockIndex] =
        wfjlFB._addedBlocks.retVal;
    return wfjlFB;
  }

  WfjlFilterBuilder isNull() {
    wfjlFB._addedBlocks = setCriteria(
        0,
        wfjlFB.parameters,
        param,
        SqlSyntax.IsNULL.replaceAll(SqlSyntax.notKeyword, _waitingNot),
        wfjlFB._addedBlocks);
    _waitingNot = '';
    wfjlFB._addedBlocks.needEndBlock![wfjlFB._blockIndex] =
        wfjlFB._addedBlocks.retVal;
    return wfjlFB;
  }

  WfjlFilterBuilder contains(dynamic pValue) {
    if (pValue != null) {
      wfjlFB._addedBlocks = setCriteria(
          '%${pValue.toString()}%',
          wfjlFB.parameters,
          param,
          SqlSyntax.Contains.replaceAll(SqlSyntax.notKeyword, _waitingNot),
          wfjlFB._addedBlocks);
      _waitingNot = '';
      wfjlFB._addedBlocks.needEndBlock![wfjlFB._blockIndex] =
          wfjlFB._addedBlocks.retVal;
    }
    return wfjlFB;
  }

  WfjlFilterBuilder startsWith(dynamic pValue) {
    if (pValue != null) {
      wfjlFB._addedBlocks = setCriteria(
          '${pValue.toString()}%',
          wfjlFB.parameters,
          param,
          SqlSyntax.Contains.replaceAll(SqlSyntax.notKeyword, _waitingNot),
          wfjlFB._addedBlocks);
      _waitingNot = '';
      wfjlFB._addedBlocks.needEndBlock![wfjlFB._blockIndex] =
          wfjlFB._addedBlocks.retVal;
      wfjlFB._addedBlocks.needEndBlock![wfjlFB._blockIndex] =
          wfjlFB._addedBlocks.retVal;
    }
    return wfjlFB;
  }

  WfjlFilterBuilder endsWith(dynamic pValue) {
    if (pValue != null) {
      wfjlFB._addedBlocks = setCriteria(
          '%${pValue.toString()}',
          wfjlFB.parameters,
          param,
          SqlSyntax.Contains.replaceAll(SqlSyntax.notKeyword, _waitingNot),
          wfjlFB._addedBlocks);
      _waitingNot = '';
      wfjlFB._addedBlocks.needEndBlock![wfjlFB._blockIndex] =
          wfjlFB._addedBlocks.retVal;
    }
    return wfjlFB;
  }

  WfjlFilterBuilder between(dynamic pFirst, dynamic pLast) {
    if (pFirst != null && pLast != null) {
      wfjlFB._addedBlocks = setCriteria(
          pFirst,
          wfjlFB.parameters,
          param,
          SqlSyntax.Between.replaceAll(SqlSyntax.notKeyword, _waitingNot),
          wfjlFB._addedBlocks,
          pLast);
    } else if (pFirst != null) {
      if (_waitingNot != '') {
        wfjlFB._addedBlocks = setCriteria(pFirst, wfjlFB.parameters, param,
            SqlSyntax.LessThan, wfjlFB._addedBlocks);
      } else {
        wfjlFB._addedBlocks = setCriteria(pFirst, wfjlFB.parameters, param,
            SqlSyntax.GreaterThanOrEquals, wfjlFB._addedBlocks);
      }
    } else if (pLast != null) {
      if (_waitingNot != '') {
        wfjlFB._addedBlocks = setCriteria(pLast, wfjlFB.parameters, param,
            SqlSyntax.GreaterThan, wfjlFB._addedBlocks);
      } else {
        wfjlFB._addedBlocks = setCriteria(pLast, wfjlFB.parameters, param,
            SqlSyntax.LessThanOrEquals, wfjlFB._addedBlocks);
      }
    }
    _waitingNot = '';
    wfjlFB._addedBlocks.needEndBlock![wfjlFB._blockIndex] =
        wfjlFB._addedBlocks.retVal;
    return wfjlFB;
  }

  WfjlFilterBuilder greaterThan(dynamic pValue) {
    param.expression = '>';
    wfjlFB._addedBlocks = _waitingNot == ''
        ? setCriteria(pValue, wfjlFB.parameters, param, SqlSyntax.GreaterThan,
            wfjlFB._addedBlocks)
        : setCriteria(pValue, wfjlFB.parameters, param,
            SqlSyntax.LessThanOrEquals, wfjlFB._addedBlocks);
    _waitingNot = '';
    wfjlFB._addedBlocks.needEndBlock![wfjlFB._blockIndex] =
        wfjlFB._addedBlocks.retVal;
    return wfjlFB;
  }

  WfjlFilterBuilder lessThan(dynamic pValue) {
    param.expression = '<';
    wfjlFB._addedBlocks = _waitingNot == ''
        ? setCriteria(pValue, wfjlFB.parameters, param, SqlSyntax.LessThan,
            wfjlFB._addedBlocks)
        : setCriteria(pValue, wfjlFB.parameters, param,
            SqlSyntax.GreaterThanOrEquals, wfjlFB._addedBlocks);
    _waitingNot = '';
    wfjlFB._addedBlocks.needEndBlock![wfjlFB._blockIndex] =
        wfjlFB._addedBlocks.retVal;
    return wfjlFB;
  }

  WfjlFilterBuilder greaterThanOrEquals(dynamic pValue) {
    param.expression = '>=';
    wfjlFB._addedBlocks = _waitingNot == ''
        ? setCriteria(pValue, wfjlFB.parameters, param,
            SqlSyntax.GreaterThanOrEquals, wfjlFB._addedBlocks)
        : setCriteria(pValue, wfjlFB.parameters, param, SqlSyntax.LessThan,
            wfjlFB._addedBlocks);
    _waitingNot = '';
    wfjlFB._addedBlocks.needEndBlock![wfjlFB._blockIndex] =
        wfjlFB._addedBlocks.retVal;
    return wfjlFB;
  }

  WfjlFilterBuilder lessThanOrEquals(dynamic pValue) {
    param.expression = '<=';
    wfjlFB._addedBlocks = _waitingNot == ''
        ? setCriteria(pValue, wfjlFB.parameters, param,
            SqlSyntax.LessThanOrEquals, wfjlFB._addedBlocks)
        : setCriteria(pValue, wfjlFB.parameters, param, SqlSyntax.GreaterThan,
            wfjlFB._addedBlocks);
    _waitingNot = '';
    wfjlFB._addedBlocks.needEndBlock![wfjlFB._blockIndex] =
        wfjlFB._addedBlocks.retVal;
    return wfjlFB;
  }

  WfjlFilterBuilder inValues(dynamic pValue) {
    wfjlFB._addedBlocks = setCriteria(
        pValue,
        wfjlFB.parameters,
        param,
        SqlSyntax.IN.replaceAll(SqlSyntax.notKeyword, _waitingNot),
        wfjlFB._addedBlocks);
    _waitingNot = '';
    wfjlFB._addedBlocks.needEndBlock![wfjlFB._blockIndex] =
        wfjlFB._addedBlocks.retVal;
    return wfjlFB;
  }
}
// endregion WfjlField

// region WfjlFilterBuilder
class WfjlFilterBuilder extends SearchCriteria {
  WfjlFilterBuilder(Wfjl obj) {
    whereString = '';
    groupByList = <String>[];
    _addedBlocks.needEndBlock!.add(false);
    _addedBlocks.waitingStartBlock!.add(false);
    _obj = obj;
  }
  AddedBlocks _addedBlocks = AddedBlocks(<bool>[], <bool>[]);
  int _blockIndex = 0;
  List<DbParameter> parameters = <DbParameter>[];
  List<String> orderByList = <String>[];
  Wfjl? _obj;
  QueryParams qparams = QueryParams();
  int _pagesize = 0;
  int _page = 0;

  /// put the sql keyword 'AND'
  WfjlFilterBuilder get and {
    if (parameters.isNotEmpty) {
      parameters[parameters.length - 1].wOperator = ' AND ';
    }
    return this;
  }

  /// put the sql keyword 'OR'
  WfjlFilterBuilder get or {
    if (parameters.isNotEmpty) {
      parameters[parameters.length - 1].wOperator = ' OR ';
    }
    return this;
  }

  /// open parentheses
  WfjlFilterBuilder get startBlock {
    _addedBlocks.waitingStartBlock!.add(true);
    _addedBlocks.needEndBlock!.add(false);
    _blockIndex++;
    if (_blockIndex > 1) {
      _addedBlocks.needEndBlock![_blockIndex - 1] = true;
    }
    return this;
  }

  /// String whereCriteria, write raw query without 'where' keyword. Like this: 'field1 like 'test%' and field2 = 3'
  WfjlFilterBuilder where(String? whereCriteria, {dynamic parameterValue}) {
    if (whereCriteria != null && whereCriteria != '') {
      final DbParameter param = DbParameter(
          columnName: parameterValue == null ? null : '',
          hasParameter: parameterValue != null);
      _addedBlocks = setCriteria(parameterValue ?? 0, parameters, param,
          '($whereCriteria)', _addedBlocks);
      _addedBlocks.needEndBlock![_blockIndex] = _addedBlocks.retVal;
    }
    return this;
  }

  /// page = page number,
  ///
  /// pagesize = row(s) per page
  WfjlFilterBuilder page(int page, int pagesize) {
    if (page > 0) {
      _page = page;
    }
    if (pagesize > 0) {
      _pagesize = pagesize;
    }
    return this;
  }

  /// int count = LIMIT
  WfjlFilterBuilder top(int count) {
    if (count > 0) {
      _pagesize = count;
    }
    return this;
  }

  /// close parentheses
  WfjlFilterBuilder get endBlock {
    if (_addedBlocks.needEndBlock![_blockIndex]) {
      parameters[parameters.length - 1].whereString += ' ) ';
    }
    _addedBlocks.needEndBlock!.removeAt(_blockIndex);
    _addedBlocks.waitingStartBlock!.removeAt(_blockIndex);
    _blockIndex--;
    return this;
  }

  /// argFields might be String or List<String>.
  ///
  /// Example 1: argFields='name, date'
  ///
  /// Example 2: argFields = ['name', 'date']
  WfjlFilterBuilder orderBy(dynamic argFields) {
    if (argFields != null) {
      if (argFields is String) {
        orderByList.add(argFields);
      } else {
        for (String? s in argFields as List<String?>) {
          if (s!.isNotEmpty) {
            orderByList.add(' $s ');
          }
        }
      }
    }
    return this;
  }

  /// argFields might be String or List<String>.
  ///
  /// Example 1: argFields='field1, field2'
  ///
  /// Example 2: argFields = ['field1', 'field2']
  WfjlFilterBuilder orderByDesc(dynamic argFields) {
    if (argFields != null) {
      if (argFields is String) {
        orderByList.add('$argFields desc ');
      } else {
        for (String? s in argFields as List<String?>) {
          if (s!.isNotEmpty) {
            orderByList.add(' $s desc ');
          }
        }
      }
    }
    return this;
  }

  /// argFields might be String or List<String>.
  ///
  /// Example 1: argFields='field1, field2'
  ///
  /// Example 2: argFields = ['field1', 'field2']
  WfjlFilterBuilder groupBy(dynamic argFields) {
    if (argFields != null) {
      if (argFields is String) {
        groupByList.add(' $argFields ');
      } else {
        for (String? s in argFields as List<String?>) {
          if (s!.isNotEmpty) {
            groupByList.add(' $s ');
          }
        }
      }
    }
    return this;
  }

  /// argFields might be String or List<String>.
  ///
  /// Example 1: argFields='name, date'
  ///
  /// Example 2: argFields = ['name', 'date']
  WfjlFilterBuilder having(dynamic argFields) {
    if (argFields != null) {
      if (argFields is String) {
        havingList.add(argFields);
      } else {
        for (String? s in argFields as List<String?>) {
          if (s!.isNotEmpty) {
            havingList.add(' $s ');
          }
        }
      }
    }
    return this;
  }

  WfjlField setField(WfjlField? field, String colName, DbType dbtype) {
    return WfjlField(this)
      ..param = DbParameter(
          dbType: dbtype,
          columnName: colName,
          wStartBlock: _addedBlocks.waitingStartBlock![_blockIndex]);
  }

  WfjlField? _id;
  WfjlField get id {
    return _id = setField(_id, 'id', DbType.integer);
  }

  WfjlField? _jsons;
  WfjlField get jsons {
    return _jsons = setField(_jsons, 'jsons', DbType.text);
  }

  WfjlField? _photos;
  WfjlField get photos {
    return _photos = setField(_photos, 'photos', DbType.text);
  }

  WfjlField? _submit;
  WfjlField get submit {
    return _submit = setField(_submit, 'submit', DbType.bool);
  }

  WfjlField? _photo1;
  WfjlField get photo1 {
    return _photo1 = setField(_photo1, 'photo1', DbType.blob);
  }

  WfjlField? _photo2;
  WfjlField get photo2 {
    return _photo2 = setField(_photo2, 'photo2', DbType.blob);
  }

  WfjlField? _photo3;
  WfjlField get photo3 {
    return _photo3 = setField(_photo3, 'photo3', DbType.blob);
  }

  WfjlField? _running;
  WfjlField get running {
    return _running = setField(_running, 'running', DbType.bool);
  }

  WfjlField? _msg;
  WfjlField get msg {
    return _msg = setField(_msg, 'msg', DbType.text);
  }

  bool _getIsDeleted = false;

  void _buildParameters() {
    if (_page > 0 && _pagesize > 0) {
      qparams
        ..limit = _pagesize
        ..offset = (_page - 1) * _pagesize;
    } else {
      qparams
        ..limit = _pagesize
        ..offset = _page;
    }
    for (DbParameter param in parameters) {
      if (param.columnName != null) {
        if (param.value is List && !param.hasParameter) {
          param.value = param.dbType == DbType.text || param.value[0] is String
              ? '\'${param.value.join('\',\'')}\''
              : param.value.join(',');
          whereString += param.whereString
              .replaceAll('{field}', param.columnName!)
              .replaceAll('?', param.value.toString());
          param.value = null;
        } else {
          if (param.value is Map<String, dynamic> &&
              param.value['sql'] != null) {
            param
              ..whereString = param.whereString
                  .replaceAll('?', param.value['sql'].toString())
              ..dbType = DbType.integer
              ..value = param.value['args'];
          }
          whereString +=
              param.whereString.replaceAll('{field}', param.columnName!);
        }
        if (!param.whereString.contains('?')) {
        } else {
          switch (param.dbType) {
            case DbType.bool:
              param.value = param.value == null
                  ? null
                  : param.value == true
                      ? 1
                      : 0;
              param.value2 = param.value2 == null
                  ? null
                  : param.value2 == true
                      ? 1
                      : 0;
              break;
            case DbType.date:
            case DbType.datetime:
            case DbType.datetimeUtc:
              param.value = param.value == null
                  ? null
                  : (param.value as DateTime).millisecondsSinceEpoch;
              param.value2 = param.value2 == null
                  ? null
                  : (param.value2 as DateTime).millisecondsSinceEpoch;
              break;
            default:
          }
          if (param.value != null) {
            if (param.value is List) {
              for (var p in param.value) {
                whereArguments.add(p);
              }
            } else {
              whereArguments.add(param.value);
            }
          }
          if (param.value2 != null) {
            whereArguments.add(param.value2);
          }
        }
      } else {
        whereString += param.whereString;
      }
    }
    if (Wfjl._softDeleteActivated) {
      if (whereString != '') {
        whereString =
            '${!_getIsDeleted ? 'ifnull(isDeleted,0)=0 AND' : ''} ($whereString)';
      } else if (!_getIsDeleted) {
        whereString = 'ifnull(isDeleted,0)=0';
      }
    }

    if (whereString != '') {
      qparams.whereString = whereString;
    }
    qparams
      ..whereArguments = whereArguments
      ..groupBy = groupByList.join(',')
      ..orderBy = orderByList.join(',')
      ..having = havingList.join(',');
  }

  /// Deletes List<Wfjl> bulk by query
  ///
  /// <returns>BoolResult res.success=Deleted, not res.success=Can not deleted
  Future<BoolResult> delete([bool hardDelete = false]) async {
    _buildParameters();
    var r = BoolResult(success: false);

    if (Wfjl._softDeleteActivated && !hardDelete) {
      r = await _obj!._mnWfjl.updateBatch(qparams, {'isDeleted': 1});
    } else {
      r = await _obj!._mnWfjl.delete(qparams);
    }
    return r;
  }

  /// using:
  ///
  /// update({'fieldName': Value})
  ///
  /// fieldName must be String. Value is dynamic, it can be any of the (int, bool, String.. )
  Future<BoolResult> update(Map<String, dynamic> values) {
    _buildParameters();
    if (qparams.limit! > 0 || qparams.offset! > 0) {
      qparams.whereString =
          'id IN (SELECT id from wfjl ${qparams.whereString!.isNotEmpty ? 'WHERE ${qparams.whereString}' : ''}${qparams.limit! > 0 ? ' LIMIT ${qparams.limit}' : ''}${qparams.offset! > 0 ? ' OFFSET ${qparams.offset}' : ''})';
    }
    return _obj!._mnWfjl.updateBatch(qparams, values);
  }

  /// This method always returns Wfjl Obj if exist, otherwise returns null
  ///
  /// bool preload: if true, loads all related child objects (Set preload to true if you want to load all fields related to child or parent)
  ///
  /// ex: toSingle(preload:true) -> Loads all related objects
  ///
  /// List<String> preloadFields: specify the fields you want to preload (preload parameter's value should also be "true")
  ///
  /// ex: toSingle(preload:true, preloadFields:['plField1','plField2'... etc])  -> Loads only certain fields what you specified
  ///
  /// bool loadParents: if true, loads all parent objects until the object has no parent

  ///
  /// <returns>List<Wfjl>
  Future<Wfjl?> toSingle(
      {bool preload = false,
      List<String>? preloadFields,
      bool loadParents = false,
      List<String>? loadedFields}) async {
    _pagesize = 1;
    _buildParameters();
    final objFuture = _obj!._mnWfjl.toList(qparams);
    final data = await objFuture;
    Wfjl? obj;
    if (data.isNotEmpty) {
      obj = Wfjl.fromMap(data[0] as Map<String, dynamic>);
    } else {
      obj = null;
    }
    return obj;
  }

  /// This method returns int. [Wfjl]
  ///
  /// <returns>int
  Future<int> toCount([VoidCallback Function(int c)? wfjlCount]) async {
    _buildParameters();
    qparams.selectColumns = ['COUNT(1) AS CNT'];
    final wfjlsFuture = await _obj!._mnWfjl.toList(qparams);
    final int count = wfjlsFuture[0]['CNT'] as int;
    if (wfjlCount != null) {
      wfjlCount(count);
    }
    return count;
  }

  /// This method returns List<Wfjl> [Wfjl]
  ///
  /// bool preload: if true, loads all related child objects (Set preload to true if you want to load all fields related to child or parent)
  ///
  /// ex: toList(preload:true) -> Loads all related objects
  ///
  /// List<String> preloadFields: specify the fields you want to preload (preload parameter's value should also be "true")
  ///
  /// ex: toList(preload:true, preloadFields:['plField1','plField2'... etc])  -> Loads only certain fields what you specified
  ///
  /// bool loadParents: if true, loads all parent objects until the object has no parent

  ///
  /// <returns>List<Wfjl>
  Future<List<Wfjl>> toList(
      {bool preload = false,
      List<String>? preloadFields,
      bool loadParents = false,
      List<String>? loadedFields}) async {
    final data = await toMapList();
    final List<Wfjl> wfjlsData = await Wfjl.fromMapList(data,
        preload: preload,
        preloadFields: preloadFields,
        loadParents: loadParents,
        loadedFields: loadedFields,
        setDefaultValues: qparams.selectColumns == null);
    return wfjlsData;
  }

  /// This method returns Json String [Wfjl]
  Future<String> toJson() async {
    final list = <dynamic>[];
    final data = await toList();
    for (var o in data) {
      list.add(o.toMap(forJson: true));
    }
    return json.encode(list);
  }

  /// This method returns Json String. [Wfjl]
  Future<String> toJsonWithChilds() async {
    final list = <dynamic>[];
    final data = await toList();
    for (var o in data) {
      list.add(await o.toMapWithChildren(false, true));
    }
    return json.encode(list);
  }

  /// This method returns List<dynamic>. [Wfjl]
  ///
  /// <returns>List<dynamic>
  Future<List<dynamic>> toMapList() async {
    _buildParameters();
    return await _obj!._mnWfjl.toList(qparams);
  }

  /// Returns List<DropdownMenuItem<Wfjl>>
  Future<List<DropdownMenuItem<Wfjl>>> toDropDownMenu(String displayTextColumn,
      [VoidCallback Function(List<DropdownMenuItem<Wfjl>> o)?
          dropDownMenu]) async {
    _buildParameters();
    final wfjlsFuture = _obj!._mnWfjl.toList(qparams);

    final data = await wfjlsFuture;
    final int count = data.length;
    final List<DropdownMenuItem<Wfjl>> items = []..add(DropdownMenuItem(
        value: Wfjl(),
        child: Text('Select Wfjl'),
      ));
    for (int i = 0; i < count; i++) {
      items.add(
        DropdownMenuItem(
          value: Wfjl.fromMap(data[i] as Map<String, dynamic>),
          child: Text(data[i][displayTextColumn].toString()),
        ),
      );
    }
    if (dropDownMenu != null) {
      dropDownMenu(items);
    }
    return items;
  }

  /// Returns List<DropdownMenuItem<int>>
  Future<List<DropdownMenuItem<int>>> toDropDownMenuInt(
      String displayTextColumn,
      [VoidCallback Function(List<DropdownMenuItem<int>> o)?
          dropDownMenu]) async {
    _buildParameters();
    qparams.selectColumns = ['id', displayTextColumn];
    final wfjlsFuture = _obj!._mnWfjl.toList(qparams);

    final data = await wfjlsFuture;
    final int count = data.length;
    final List<DropdownMenuItem<int>> items = []..add(DropdownMenuItem(
        value: 0,
        child: Text('Select Wfjl'),
      ));
    for (int i = 0; i < count; i++) {
      items.add(
        DropdownMenuItem(
          value: data[i]['id'] as int,
          child: Text(data[i][displayTextColumn].toString()),
        ),
      );
    }
    if (dropDownMenu != null) {
      dropDownMenu(items);
    }
    return items;
  }

  /// This method returns Primary Key List SQL and Parameters retVal = Map<String,dynamic>. [Wfjl]
  ///
  /// retVal['sql'] = SQL statement string, retVal['args'] = whereArguments List<dynamic>;
  ///
  /// <returns>List<String>
  Map<String, dynamic> toListPrimaryKeySQL([bool buildParameters = true]) {
    final Map<String, dynamic> _retVal = <String, dynamic>{};
    if (buildParameters) {
      _buildParameters();
    }
    _retVal['sql'] = 'SELECT `id` FROM wfjl WHERE ${qparams.whereString}';
    _retVal['args'] = qparams.whereArguments;
    return _retVal;
  }

  /// This method returns Primary Key List<int>.
  /// <returns>List<int>
  Future<List<int>> toListPrimaryKey([bool buildParameters = true]) async {
    if (buildParameters) {
      _buildParameters();
    }
    final List<int> idData = <int>[];
    qparams.selectColumns = ['id'];
    final idFuture = await _obj!._mnWfjl.toList(qparams);

    final int count = idFuture.length;
    for (int i = 0; i < count; i++) {
      idData.add(idFuture[i]['id'] as int);
    }
    return idData;
  }

  /// Returns List<dynamic> for selected columns. Use this method for 'groupBy' with min,max,avg..  [Wfjl]
  ///
  /// Sample usage: (see EXAMPLE 4.2 at https://github.com/hhtokpinar/sqfEntity#group-by)
  Future<List<dynamic>> toListObject() async {
    _buildParameters();

    final objectFuture = _obj!._mnWfjl.toList(qparams);

    final List<dynamic> objectsData = <dynamic>[];
    final data = await objectFuture;
    final int count = data.length;
    for (int i = 0; i < count; i++) {
      objectsData.add(data[i]);
    }
    return objectsData;
  }

  /// Returns List<String> for selected first column
  ///
  /// Sample usage: await Wfjl.select(columnsToSelect: ['columnName']).toListString()
  Future<List<String>> toListString(
      [VoidCallback Function(List<String> o)? listString]) async {
    _buildParameters();

    final objectFuture = _obj!._mnWfjl.toList(qparams);

    final List<String> objectsData = <String>[];
    final data = await objectFuture;
    final int count = data.length;
    for (int i = 0; i < count; i++) {
      objectsData.add(data[i][qparams.selectColumns![0]].toString());
    }
    if (listString != null) {
      listString(objectsData);
    }
    return objectsData;
  }
}
// endregion WfjlFilterBuilder

// region WfjlFields
class WfjlFields {
  static TableField? _fId;
  static TableField get id {
    return _fId = _fId ?? SqlSyntax.setField(_fId, 'id', DbType.integer);
  }

  static TableField? _fJsons;
  static TableField get jsons {
    return _fJsons =
        _fJsons ?? SqlSyntax.setField(_fJsons, 'jsons', DbType.text);
  }

  static TableField? _fPhotos;
  static TableField get photos {
    return _fPhotos =
        _fPhotos ?? SqlSyntax.setField(_fPhotos, 'photos', DbType.text);
  }

  static TableField? _fSubmit;
  static TableField get submit {
    return _fSubmit =
        _fSubmit ?? SqlSyntax.setField(_fSubmit, 'submit', DbType.bool);
  }

  static TableField? _fPhoto1;
  static TableField get photo1 {
    return _fPhoto1 =
        _fPhoto1 ?? SqlSyntax.setField(_fPhoto1, 'photo1', DbType.blob);
  }

  static TableField? _fPhoto2;
  static TableField get photo2 {
    return _fPhoto2 =
        _fPhoto2 ?? SqlSyntax.setField(_fPhoto2, 'photo2', DbType.blob);
  }

  static TableField? _fPhoto3;
  static TableField get photo3 {
    return _fPhoto3 =
        _fPhoto3 ?? SqlSyntax.setField(_fPhoto3, 'photo3', DbType.blob);
  }

  static TableField? _fRunning;
  static TableField get running {
    return _fRunning =
        _fRunning ?? SqlSyntax.setField(_fRunning, 'running', DbType.bool);
  }

  static TableField? _fMsg;
  static TableField get msg {
    return _fMsg = _fMsg ?? SqlSyntax.setField(_fMsg, 'msg', DbType.text);
  }
}
// endregion WfjlFields

//region WfjlManager
class WfjlManager extends SqfEntityProvider {
  WfjlManager()
      : super(Srwzdb(),
            tableName: _tableName,
            primaryKeyList: _primaryKeyList,
            whereStr: _whereStr);
  static final String _tableName = 'wfjl';
  static final List<String> _primaryKeyList = ['id'];
  static final String _whereStr = 'id=?';
}

//endregion WfjlManager
class SrwzdbSequenceManager extends SqfEntityProvider {
  SrwzdbSequenceManager() : super(Srwzdb());
}
// END OF ENTITIES

// BEGIN CONTROLLERS
// BEGIN CONTROLLER (Wfjl)
 
// END CONTROLLER (Wfjl)

// END OF CONTROLLERS
