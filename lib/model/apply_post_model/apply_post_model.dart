class ApplyPostModel {
  Null? data;
  String? message;
  int? code;
  String? type;
  bool? showToast;

  ApplyPostModel(
      {this.data, this.message, this.code, this.type, this.showToast});

  ApplyPostModel.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    message = json['message'];
    code = json['code'];
    type = json['type'];
    showToast = json['showToast'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data;
    data['message'] = this.message;
    data['code'] = this.code;
    data['type'] = this.type;
    data['showToast'] = this.showToast;
    return data;
  }
}