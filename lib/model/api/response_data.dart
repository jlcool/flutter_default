class ResponseData {
  int? code;
  dynamic data;
  String? msg;

  ResponseData({this.code, this.data, this.msg});

  ResponseData.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> pageData = new Map<String, dynamic>();
    pageData['code'] = this.code;
    pageData['data'] = this.data;
    pageData['msg'] = this.msg;
    return pageData;
  }
}
