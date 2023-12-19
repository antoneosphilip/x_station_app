class NotificationModel {
  List<Data>? data;
  String? message;
  int? code;
  String? type;

  NotificationModel({this.data, this.message, this.code, this.type});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
    code = json['code'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['code'] = this.code;
    data['type'] = this.type;
    return data;
  }
}

class Data {
  String? id;
  String? type;
  String? notifiableType;
  int? notifiableId;
  DataMessage? data;
  Null? readAt;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.type,
        this.notifiableType,
        this.notifiableId,
        this.data,
        this.readAt,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    notifiableType = json['notifiable_type'];
    notifiableId = json['notifiable_id'];
    data = json['data'] != null ? new DataMessage.fromJson(json['data']) : null;
    readAt = json['read_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['notifiable_type'] = this.notifiableType;
    data['notifiable_id'] = this.notifiableId;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['read_at'] = this.readAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class DataMessage {
  String? message;
  String? notificationType;
  String? modelId;

  DataMessage({this.message, this.notificationType, this.modelId});
  int get modelIdAsInt => int.tryParse(modelId ?? '') ?? 0;
  DataMessage.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    notificationType = json['notificationType'];
    modelId = json['modelId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['notificationType'] = this.notificationType;
    data['modelId'] = this.modelId;
    return data;
  }
}