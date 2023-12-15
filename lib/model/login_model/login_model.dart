class LoginModel {
  Data? data;
  String? message;
  String? type;
  int? code;
  bool? showToast;

  LoginModel(
      {this.data, this.message, this.type, this.code, this.showToast});

  LoginModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
    type = json['type'];
    code = json['code'];
    showToast = json['showToast'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    data['type'] = this.type;
    data['code'] = this.code;
    data['showToast'] = this.showToast;
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? email;
  Null? emailVerifiedAt;
  String? phoneNumber;
  String? address;
  String? type;
  String? createdAt;
  String? updatedAt;
  String? token;

  Data(
      {this.id,
        this.name,
        this.email,
        this.emailVerifiedAt,
        this.phoneNumber,
        this.address,
        this.type,
        this.createdAt,
        this.updatedAt,
        this.token});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    phoneNumber = json['phone_number'];
    address = json['address'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['phone_number'] = this.phoneNumber;
    data['address'] = this.address;
    data['type'] = this.type;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['token'] = this.token;
    return data;
  }
}