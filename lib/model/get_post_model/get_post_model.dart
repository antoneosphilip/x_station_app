class GetPostModel {
  List<Data>? data;
  String? message;
  int? code;
  String? type;

  GetPostModel({this.data, this.message, this.code, this.type});

  GetPostModel.fromJson(Map<String, dynamic> json) {
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
  String? avatar;

  User({this.id, this.name, this.avatar});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    avatar = json['avatar']??'';
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
  int? id;

  AllApplied({this.id});

  AllApplied.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}