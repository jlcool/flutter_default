class MemberTokenResponse {
  int id;
  String phone;
  String email;
  String token;
  String nickName;
  int memberType;

  MemberTokenResponse({this.id, this.phone,this.email,this.token,this.nickName,this.memberType});

  MemberTokenResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phone = json['phone'];
    email = json['email'];
    token = json['token'];
    nickName = json['nick_name'];
    memberType = json['member_type'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['token'] = this.token;
    data['nick_name'] = this.nickName;
    data['member_type'] = this.memberType;
    return data;
  }
}
