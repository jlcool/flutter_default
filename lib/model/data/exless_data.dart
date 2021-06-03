import 'dart:io';

import 'package:device_info/device_info.dart';

import '../../util/device_info_util.dart';

class Exless {
  String type = "Info";
  String? source;
  String? date;
  ExlessData? data;
  String? message;
  Map<String, dynamic> toJson() {
    var map = new Map<String, dynamic>();
    map["type"] = type;
    if (source != null && source!.isNotEmpty) {
      map["source"] = source;
    }
    map["date"] = date;
    map["data"] = data?.toJson();
    map["message"] = message;
    return map;
  }
}

class ExlessData {
  String? level;
  ExlessUser user = ExlessUser();
  ExlessUserDescription? userDescription;
  ExlessEnvironment? environment;
  String version = "1.0.0";

  Map<String, dynamic> toJson() {
    var map = new Map<String, dynamic>();
    map["@level"] = level ?? "Info";
    map["@user"] = user.toJson();
    if (userDescription != null) {
      map["@user_description"] = userDescription!.toJson();
    }
    if (environment != null) {
      map["@environment"] = environment!.toJson();
    }
    map["@version"] = version;
    return map;
  }
}

class ExlessUser {
  String? identity;
  String? name;
  Map<String, dynamic> toJson() {
    var map = new Map<String, dynamic>();
    map["identity"] = identity;
    map["name"] = name;
    return map;
  }
}

class ExlessUserDescription {
  String? email_address;
  String? description;
  Map<String, dynamic> toJson() {
    var map = new Map<String, dynamic>();
    map["email_address"] = email_address;
    map["description"] = description;
    return map;
  }
}

class ExlessEnvironment {
  String? o_s_name;
  String? o_s_version;
  String? machine_name;
  String? runtime_version;
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = Map<String, dynamic>();
    try {
      if (Platform.isAndroid) {
        map = _readAndroidBuildData(DeviceInfoUtil.androidInfo);
      } else if (Platform.isIOS) {
        map = _readIosDeviceInfo(DeviceInfoUtil.iosInfo);
      }
    } catch (err) {}

    map["o_s_name"] = o_s_name;
    map["o_s_version"] = o_s_version;
    map["machine_name"] = machine_name;
    map["runtime_version"] = runtime_version;
    return map;
  }

  Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo? build) {
    return <String, dynamic>{
      'version.securityPatch': build?.version.securityPatch,
      'version.sdkInt': build?.version.sdkInt,
      'version.release': build?.version.release,
      'version.previewSdkInt': build?.version.previewSdkInt,
      'version.incremental': build?.version.incremental,
      'version.codename': build?.version.codename,
      'version.baseOS': build?.version.baseOS,
      'board': build?.board,
      'bootloader': build?.bootloader,
      'brand': build?.brand,
      'device': build?.device,
      'display': build?.display,
      'fingerprint': build?.fingerprint,
      'hardware': build?.hardware,
      'host': build?.host,
      'id': build?.id,
      'manufacturer': build?.manufacturer,
      'model': build?.model,
      'product': build?.product,
      'supported32BitAbis': build?.supported32BitAbis,
      'supported64BitAbis': build?.supported64BitAbis,
      'supportedAbis': build?.supportedAbis,
      'tags': build?.tags,
      'type': build?.type,
      'isPhysicalDevice': build?.isPhysicalDevice,
      'androidId': build?.androidId,
      'systemFeatures': build?.systemFeatures,
    };
  }

  Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo? data) {
    return <String, dynamic>{
      'name': data?.name,
      'systemName': data?.systemName,
      'systemVersion': data?.systemVersion,
      'model': data?.model,
      'localizedModel': data?.localizedModel,
      'identifierForVendor': data?.identifierForVendor,
      'isPhysicalDevice': data?.isPhysicalDevice,
      'utsname.sysname:': data?.utsname.sysname,
      'utsname.nodename:': data?.utsname.nodename,
      'utsname.release:': data?.utsname.release,
      'utsname.version:': data?.utsname.version,
      'utsname.machine:': data?.utsname.machine,
    };
  }
}
