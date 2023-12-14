class ProfileModel {
  Data? data;
  String? message;
  int? status;

  ProfileModel({this.data, this.message, this.status});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class Data {
  User? user;
  String? token;

  Data({this.user, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? userName;
  String? email;
  String? gender;
  String? photo;
  String? cover;
  String? bio;
  String? city;
  String? country;
  int? active;
  bool? isFriend;
  bool? isFollow;
  bool? isPage;

  User(
      {this.id,
        this.name,
        this.userName,
        this.email,
        this.gender,
        this.photo,
        this.cover,
        this.bio,
        this.city,
        this.country,
        this.active,
        this.isFriend,
        this.isFollow,
        this.isPage});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    userName = json['userName'];
    email = json['email'];
    gender = json['gender'];
    photo = json['photo'];
    cover = json['cover'];
    bio = json['bio'];
    city = json['city'];
    country = json['country'];
    active = json['active'];
    isFriend = json['isFriend'];
    isFollow = json['isFollow'];
    isPage = json['isPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['userName'] = this.userName;
    data['email'] = this.email;
    data['gender'] = this.gender;
    data['photo'] = this.photo;
    data['cover'] = this.cover;
    data['bio'] = this.bio;
    data['city'] = this.city;
    data['country'] = this.country;
    data['active'] = this.active;
    data['isFriend'] = this.isFriend;
    data['isFollow'] = this.isFollow;
    data['isPage'] = this.isPage;
    return data;
  }
}