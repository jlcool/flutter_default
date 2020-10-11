import 'package:dio/dio.dart';
import 'print_util.dart';
import '../model/data/exless_data.dart';
import 'config_util.dart';

enum LogLevel { Trace, Debug, Information, Warning, Error, Critical, None }

///向exceptionless发送错误/日志信息
/// ```dart
///ExlessUtil()
/// ..setEnvironment()
/// ..createLog("内容", source: "来源", level: LogLevel.Information)
/// ..submit();
///```
class ExlessUtil {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://collector.exceptionless.io/api/v2',
    connectTimeout: 40000,
    receiveTimeout: 120000,
  ))
    ..interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      options.headers["Authorization"] =
          ConfigUtil.EXLESS_AUTHOR;
      options.headers["Accept"] = "application/json";
      options.headers["User-Agent"] = "exceptionless/1.0.0.0";
      options.headers["Content-Type"] = "application/json; charset=utf-8";
      return options;
    }));
  Exless _less = Exless()..data = ExlessData();

  void setUser({String identity, String name}) {
    _less.data.user = ExlessUser()
      ..identity = identity
      ..name = name;
  }

  void setUserDescription(String description, {String emailAddress}) {
    _less.data.userDescription = ExlessUserDescription()
      ..email_address = emailAddress
      ..description = description;
  }

  void createLog(String message, {String source, LogLevel level}) {
    _less.date = DateTime.now().toIso8601String();
    _less.type = "log";
    _less.source = source;
    _less.message = message;
    _less.data.level = level.toString().split('.').last;
  }

  void setEnvironment() {
    _less.data.environment = ExlessEnvironment();
  }

  void submit() {
    printl(_less.message ?? "");
    _dio.post("/events", data: [_less.toJson()]);
  }
}
