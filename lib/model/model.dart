import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sqfentity/sqfentity.dart';
import 'package:sqfentity_gen/sqfentity_gen.dart';

part 'model.g.dart';
//  BEGIN srwz.db MODEL
//  Paste the following code into your model.dart
//  Enjoy.. Huseyin Tokpunar

// BEGIN TABLES

const tableWfjl = SqfEntityTable(
    tableName: 'wfjl',
    primaryKeyName: 'id',
    primaryKeyType: PrimaryKeyType.integer_auto_incremental,
    fields: [
      SqfEntityField('jsons', DbType.text),
      SqfEntityField('photos', DbType.text),
      SqfEntityField('submit', DbType.bool),
      SqfEntityField('photo1', DbType.blob),
      SqfEntityField('photo2', DbType.blob),
      SqfEntityField('photo3', DbType.blob),
      SqfEntityField('running', DbType.bool),
      SqfEntityField('msg', DbType.text),
    ]);
// END TABLES

// BEGIN DATABASE MODEL
@SqfEntityBuilder(srwzdb)
const srwzdb = SqfEntityModel(
    modelName: 'Srwzdb',
    databaseName: 'srwz.db',
    databaseTables: [
      tableWfjl,
    ],
    formTables: [
      tableWfjl,
    ]);
// END srwz.db MODEL
