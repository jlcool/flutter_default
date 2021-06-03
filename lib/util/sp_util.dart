import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

/**
 * @Author: thl
 * @GitHub: https://github.com/Sky24n
 * @JianShu: https://www.jianshu.com/u/cbf2ad25d33a
 * @Email: 863764940@qq.com
 * @Description: Sp Util.
 * @Date: 2018/9/8
 */

/// SharedPreferences Util.
class SpUtil {
  static SpUtil? _singleton;
  static SharedPreferences? _prefs;

  static Future<SpUtil?> getInstance() async {
    if (_singleton == null) {
      // keep local instance till it is fully initialized.
      // 保持本地实例直到完全初始化。
      var singleton = SpUtil._();
      await singleton._init();
      _singleton = singleton;
    }
    return _singleton;
  }

  SpUtil._();

  Future _init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static String getString(String key, {String defValue: ''}) {
    if (_prefs == null) return defValue;
    return _prefs?.getString(key) ?? defValue;
  }

  static Future<bool>? putString(String key, String value) {
    return _prefs?.setString(key, value);
  }

  static bool getBool(String key, {bool defValue: false}) {
    return _prefs?.getBool(key) ?? defValue;
  }

  static Future<bool>? putBool(String key, bool value) {
    return _prefs?.setBool(key, value);
  }

  static int getInt(String key, {int defValue: 0}) {
    if (_prefs == null) return defValue;
    return _prefs?.getInt(key) ?? defValue;
  }

  static Future<bool>? putInt(String key, int value) {
    return _prefs?.setInt(key, value);
  }

  static double getDouble(String key, {double defValue: 0.0}) {
    if (_prefs == null) return defValue;
    return _prefs?.getDouble(key) ?? defValue;
  }

  static Future<bool>? putDouble(String key, double value) {
    return _prefs?.setDouble(key, value);
  }

  static List<String> getStringList(String key,
      {List<String> defValue: const []}) {
    if (_prefs == null) return defValue;
    return _prefs?.getStringList(key) ?? defValue;
  }

  static Future<bool>? putStringList(String key, List<String> value) {
    return _prefs?.setStringList(key, value);
  }

  static Set<String>? getKeys() {
    return _prefs?.getKeys();
  }

  static Future<bool>? remove(String key) {
    return _prefs?.remove(key);
  }

  static Future<bool>? clear() {
    return _prefs?.clear();
  }

  ///Sp is initialized.
  static bool isInitialized() {
    return _prefs != null;
  }
}
