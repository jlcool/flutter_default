import 'package:flutter/material.dart';

class RouterUtil {
  static Future<T?> push<T>(BuildContext context, String routeName,
      {Object? arguments}) async {
    return Navigator.of(context).pushNamed<T>(routeName, arguments: arguments);
  }
}
