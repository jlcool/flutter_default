import 'package:flutter/material.dart' hide Action, Page;
import 'package:flutter/services.dart';
import 'package:sqfentity/sqfentity.dart';
import 'package:sqfentity_gen/sqfentity_gen.dart';

import 'app.dart';
import 'util/device_info_util.dart';
import 'util/sp_util.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DeviceInfoUtil.getInstance();
  await SpUtil.getInstance();
  runApp(createApp());
}

class BundledDbModel extends SqfEntityModelProvider {}

Future<String> createModelFromDatabase() async {
  final bundledDbModel = await convertDatabaseToModelBase(BundledDbModel()
    ..databaseName = 'srwz.db'
    ..bundledDatabasePath = 'assets/db/srwz.db');

  final String modelConstString =
      SqfEntityConverter(bundledDbModel).createConstDatabase();

  await Clipboard.setData(ClipboardData(text: modelConstString));

  print('''Your ${bundledDbModel.databaseName} 
      were created succesfuly and set to the Clipboard. 

      STEP 1:
      Open model.dart file in lib/model folder and paste models after following line
      part 'model.g.dart';

      STEP 2:
      Go Terminal Window and run command below
      flutter pub run build_runner build --delete-conflicting-outputs
      Your Entity models will be created in lib/model/model.g.dart''');

  return modelConstString;
}
