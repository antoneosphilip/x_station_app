class UpdateProfileModel {
  Null? data;
  String? message;
  String? type;
  int? code;
  bool? showToast;

  UpdateProfileModel(
      {this.data, this.message, this.type, this.code, this.showToast});

  UpdateProfileModel.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    message = json['message'];
    type = json['type'];
    code = json['code'];
    showToast = json['showToast'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data;
    data['message'] = this.message;
    data['type'] = this.type;
    data['code'] = this.code;
    data['showToast'] = this.showToast;
    return data;
  }
}