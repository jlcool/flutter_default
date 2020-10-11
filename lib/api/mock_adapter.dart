import 'dart:convert';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import '../model/api/response_data.dart';

class MockAdapter extends HttpClientAdapter {
  DefaultHttpClientAdapter _adapter = DefaultHttpClientAdapter();

  @override
  Future<ResponseBody> fetch(RequestOptions options,
      Stream<List<int>> requestStream, Future cancelFuture) async {
    Uri uri = options.uri;
    switch (uri.path) {
      case '/api/V1/member/token':
        {
          var response = ResponseData();
          response.code = 0;
          return ResponseBody.fromString(json.encode(response.toJson()), 200,
              headers: {
                Headers.contentTypeHeader: [Headers.jsonContentType]
              });
        }
        break;
      default:
    }
    return _adapter.fetch(options, requestStream, cancelFuture);
  }

  @override
  void close({bool force = false}) {
    // TODO: implement close
  }
}
