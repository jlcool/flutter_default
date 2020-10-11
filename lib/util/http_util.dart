import 'package:dio/dio.dart';
import 'package:j10/util/config_util.dart';
import '../api/mock_adapter.dart';
import '../model/api/response_data.dart';
import '../util/print_util.dart';
import '../util/sp_util.dart';
import 'dart:async';


import 'dialog_util.dart';

/*
 * 封装 restful 请求
 *
 * GET、POST、DELETE、PATCH
 * 主要作用为统一处理相关事务：
 *  - 统一处理请求前缀；
 *  - 统一打印请求信息；
 *  - 统一打印响应信息；
 *  - 统一打印报错信息；
 */

class HttpUtils {
  /// global dio object
  static Dio dio;

  /// default options
  static const String API_PREFIX = ConfigUtil.API_PREFIX;
  static const int CONNECT_TIMEOUT = 10000;
  static const int RECEIVE_TIMEOUT = 3000;

  /// http request methods
  static const String GET = 'get';
  static const String POST = 'post';
  static const String PUT = 'put';
  static const String PATCH = 'patch';
  static const String DELETE = 'delete';

  static Future<ResponseData> request(String url, {data, method}) async {
    data = data ?? {};
    method = method ?? 'GET';

    /// restful 请求处理
    // data.forEach((key, value) {
    //   if (url.indexOf(key) != -1) {
    //     url = url.replaceAll(':$key', value.toString());
    //   }
    // });

    Dio dio = getInstance();

    /// 打印请求相关信息：请求地址、请求方式、请求参数
    printl('请求地址：【' + dio.options.baseUrl + url + '】');
    printl('请求参数：' + data.toString());

    ResponseData result;

    try {
      Response response = await dio.request(url,
          data: data, options: new Options(method: method));
      result = ResponseData.fromJson(response.data);

      /// 打印响应相关信息
      printl('返回值：${response.data}');
    } on DioError catch (e) {
      /// 打印请求失败相关信息
      printl('请求出错：' + e.toString());
    }

    return result;
  }

  /// 创建 dio 实例对象
  static Dio getInstance() {
    if (dio == null) {
      /// 全局属性：请求前缀、连接超时时间、响应超时时间
      BaseOptions option = new BaseOptions(
          baseUrl: API_PREFIX,
          connectTimeout: CONNECT_TIMEOUT,
          receiveTimeout: RECEIVE_TIMEOUT,
          headers: {"user-agent": "dio"},
          contentType: "application/json; charset=utf-8");
      dio = new Dio(option)
      ..httpClientAdapter=MockAdapter()
        ..interceptors
            .add(InterceptorsWrapper(onRequest: (RequestOptions options) {
          options.headers["Authorization"] = SpUtil.getString("token");
          printl('请求头：$options');
          return options;
        }, onResponse: (Response response) async {
          if (response.data["code"] == 0) {
            return response;
          } else {
            DialogUtil.show(response.data["msg"],onlyRight: true);
          }
        }, onError: (DioError e) {
          switch (e.type) {
            case DioErrorType.CONNECT_TIMEOUT:
              DialogUtil.show('连接超时',onlyRight: true);
              break;
            case DioErrorType.SEND_TIMEOUT:
              // TODO: Handle this case.
              break;
            case DioErrorType.RECEIVE_TIMEOUT:
              // TODO: Handle this case.
              break;
            case DioErrorType.RESPONSE:
              // TODO: Handle this case.
              break;
            case DioErrorType.CANCEL:
              // TODO: Handle this case.
              break;
            case DioErrorType.DEFAULT:
              DialogUtil.show('访问错误',onlyRight: true);
              break;
          }
        }));
    }

    return dio;
  }

  /// 清空 dio 对象
  static clear() {
    dio = null;
  }
}
