
import '../util/sp_util.dart';

import 'member_api.dart';

class Api{
  MemberApi member=MemberApi();

  static auth(token) async {
    await SpUtil.putString("token","Basic "+token);
  }
}