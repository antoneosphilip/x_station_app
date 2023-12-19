class ShowPostModel {
  Data? data;
  String? message;
  int? code;
  String? type;

  ShowPostModel({this.data, this.message, this.code, this.type});

  ShowPostModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
    code = json['code'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    data['code'] = this.code;
    data['type'] = this.type;
    return data;
  }
}

class Data {
  int? id;
  String? title;
  String? description;
  String? image;
  User? user;
  int? isApplied;
  List<AllApplied>? allApplied;

  Data(
      {this.id,
        this.title,
        this.description,
        this.image,
        this.user,
        this.isApplied,
        this.allApplied});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    image = json['image']??'';
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    isApplied = json['is_applied'];
    if (json['all_applied'] != null) {
      allApplied = <AllApplied>[];
      json['all_applied'].forEach((v) {
        allApplied!.add(new AllApplied.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['image'] = this.image;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['is_applied'] = this.isApplied;
    if (this.allApplied != null) {
      data['all_applied'] = this.allApplied!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  Null? avatar;

  User({this.id, this.name, this.avatar});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['avatar'] = this.avatar;
    return data;
  }
}

class AllApplied {
  UserApplied? user;

  AllApplied({this.user});

  AllApplied.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new UserApplied.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class UserApplied {
  int? id;
  String? name;
  String? email;
  String? phoneNumber;
  String? address;
  Null? avatar;

  UserApplied(
      {this.id,
        this.name,
        this.email,
        this.phoneNumber,
        this.address,
        this.avatar});

  UserApplied.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    address = json['address'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber;
    data['address'] = this.address;
    data['avatar'] = this.avatar;
    return data;
  }
}