import 'dart:io';

import 'package:device_info/device_info.dart';

class DeviceInfoUtil {
  static DeviceInfoUtil? _singleton;
  static DeviceInfoPlugin? _info;
  static AndroidDeviceInfo? androidInfo;
  static IosDeviceInfo? iosInfo;

  static Future<DeviceInfoUtil?> getInstance() async {
    if (_singleton == null) {
      // keep local instance till it is fully initialized.
      // 保持本地实例直到完全初始化。
      var singleton = DeviceInfoUtil._();
      await singleton._init();
      _singleton = singleton;
    }
    return _singleton;
  }

  DeviceInfoUtil._();

  Future _init() async {
    _info = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      androidInfo = await _info?.androidInfo;
    } else if (Platform.isIOS) {
      iosInfo = await _info?.iosInfo;
    }
  }
}
