import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogUtil {
  static BuildContext? _context;
  static void init(BuildContext context) {
    _context = context;
  }

  static Future<T?> show<T>(String content,
      {String title = '提示',
      bool onlyRight = false,
      String leftText = '取消',
      String rightText = '确定',
      Function()? okCallBack,
      Function()? cancelCallBack}) {
    return showDialog<T>(
        context: _context!,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: [
              onlyRight
                  ? Container()
                  : FlatButton(
                      onPressed: cancelCallBack == null
                          ? () {
                              Navigator.pop(context);
                            }
                          : cancelCallBack,
                      child: Text(leftText)),
              FlatButton(
                  onPressed: okCallBack == null
                      ? () {
                          Navigator.pop(context);
                        }
                      : okCallBack(),
                  child: Text(rightText))
            ],
          );
        });
  }
}
