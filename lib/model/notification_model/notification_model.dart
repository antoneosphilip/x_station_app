class notfication {
  notfication({
    required this.id,
    required this.type,
    required this.notifiableType,
    required this.notifiableId,
    required this.data,
    required this.readAt,
    required this.createdAt,
    required this.updatedAt,
  });

  final String? id;
  final String? type;
  final String? notifiableType;
  final int? notifiableId;
  final Data? data;
  final dynamic readAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory notfication.fromJson(Map<String, dynamic> json){
    return notfication(
      id: json["id"],
      type: json["type"],
      notifiableType: json["notifiable_type"],
      notifiableId: json["notifiable_id"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
      readAt: json["read_at"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }

}

class Data {
  Data({
    required this.message,
    required this.notificationType,
    required this.modelId,
  });

  final String? message;
  final String? notificationType;
  final String? modelId;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      message: json["message"],
      notificationType: json["notificationType"],
      modelId: json["modelId"],
    );
  }

}
