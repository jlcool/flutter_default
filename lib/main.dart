import 'package:flutter/material.dart' hide Action, Page;
import 'db/injector.dart';
import 'util/sp_util.dart';

import 'app.dart';
import 'util/device_info_util.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DeviceInfoUtil.getInstance();
  await SpUtil.getInstance();
  setup();
  runApp(createApp());
}
