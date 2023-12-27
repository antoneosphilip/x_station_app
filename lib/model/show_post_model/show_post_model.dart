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
  bool? myPost;
  User? user;
  int? isApplied;
  int? jobTaken;
  List<AllApplied>? allApplied;

  Data(
      {this.id,
        this.title,
        this.description,
        this.image,
        this.myPost,
        this.user,
        this.isApplied,
        this.jobTaken,
        this.allApplied});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    image = json['image']??'';
    myPost = json['my_post'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    isApplied = json['is_applied'];
    jobTaken = json['job_taken'];
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
    data['my_post'] = this.myPost;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['is_applied'] = this.isApplied;
    data['job_taken'] = this.jobTaken;
    if (this.allApplied != null) {
      data['all_applied'] = this.allApplied!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? phoneNumber;
  String? address;
  String? avatar;
  num? averageRating;

  User(
      {this.id,
        this.name,
        this.email,
        this.phoneNumber,
        this.address,
        this.avatar,
        this.averageRating});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    address = json['address'];
    avatar = json['avatar']??'';
    averageRating = json['average_rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber;
    data['address'] = this.address;
    data['avatar'] = this.avatar;
    data['average_rating'] = this.averageRating;
    return data;
  }
}

class AllApplied {
  UserApplied? user;
  String? status;

  AllApplied({this.user, this.status});

  AllApplied.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new UserApplied.fromJson(json['user']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['status'] = this.status;
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
  int? averageRating;

  UserApplied(
      {this.id,
        this.name,
        this.email,
        this.phoneNumber,
        this.address,
        this.avatar,
        this.averageRating});

  UserApplied.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    address = json['address'];
    avatar = json['avatar'];
    averageRating = json['average_rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber;
    data['address'] = this.address;
    data['avatar'] = this.avatar;
    data['average_rating'] = this.averageRating;
    return data;
  }
}