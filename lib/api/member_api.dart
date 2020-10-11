

import '../model/api/request/member_token_request.dart';
import '../model/api/response/member_token_response.dart';
import '../util/http_util.dart';

class MemberApi {
  Future<MemberTokenResponse> token(MemberTokenRequest request) async {
    var result = await HttpUtils.request(
      '/member/token',
      data: request.toJson(),
      method: HttpUtils.POST,
    );
    return MemberTokenResponse.fromJson(result.data);
  }
}
