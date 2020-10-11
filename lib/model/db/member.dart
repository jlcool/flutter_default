class Member {
  int id;
  String name;
  String avatar;
  String setting;

  Member({this.id, this.name, this.avatar, this.setting});

  Member.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    avatar = json['Avatar'];
    setting = json['setting'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['Avatar'] = this.avatar;
    data['setting'] = this.setting;
    return data;
  }
}