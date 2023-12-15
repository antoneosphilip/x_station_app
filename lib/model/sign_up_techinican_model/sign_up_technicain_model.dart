class SignUpTechnicainModel {
  Data? data;
  String? message;
  int? code;
  String? type;
  bool? showToast;

  SignUpTechnicainModel(
      {this.data, this.message, this.code, this.type, this.showToast});

  SignUpTechnicainModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
    code = json['code'];
    type = json['type'];
    showToast = json['showToast'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    data['code'] = this.code;
    data['type'] = this.type;
    data['showToast'] = this.showToast;
    return data;
  }
}

class Data {
  String? name;
  String? email;
  String? phoneNumber;
  String? address;
  String? type;
  String? updatedAt;
  String? createdAt;
  int? id;
  String? token;

  Data(
      {this.name,
        this.email,
        this.phoneNumber,
        this.address,
        this.type,
        this.updatedAt,
        this.createdAt,
        this.id,
        this.token});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    address = json['address'];
    type = json['type'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber;
    data['address'] = this.address;
    data['type'] = this.type;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    data['token'] = this.token;
    return data;
  }
}