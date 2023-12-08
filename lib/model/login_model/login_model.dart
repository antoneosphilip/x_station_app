// import '../UserDataModel/UserDataModel.dart';
//
// class LoginModel {
//   UserDataModel? data;
//   String? message;
//   String? type;
//   int? code;
//   bool? showToast;
//   bool? verified;
//
//   LoginModel(
//       {this.data,
//         this.message,
//         this.type,
//         this.code,
//         this.showToast,
//         this.verified});
//
//   LoginModel.fromJson(Map<String, dynamic> json) {
//     data = json['data'] != null .fromJson(json['data']) : null;
//     message = json['message'];
//     type = json['type'];
//     code = json['code'];
//     showToast = json['showToast'];
//     verified = json['verified'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     data['message'] = this.message;
//     data['type'] = this.type;
//     data['code'] = this.code;
//     data['showToast'] = this.showToast;
//     data['verified'] = this.verified;
//     return data;
//   }
// }
