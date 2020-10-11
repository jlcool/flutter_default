class MemberTokenRequest {
  String account;
  String password;

  MemberTokenRequest({this.account, this.password});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['account'] = this.account;
    data['password'] = this.password;
    return data;
  }
}