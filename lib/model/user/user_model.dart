// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String? message;
  List<UserResult>? result;

  UserModel({
    this.message,
    this.result,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        message: json["message"],
        result: List<UserResult>.from(
            json["result"].map((x) => UserResult.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "result": List<dynamic>.from(result!.map((x) => x.toJson())),
      };
}

class UserResult {
  String? id;
  String? avatar;
  String? email;
  String? password;
  String? createAt;
  String? updateAt;
  String? lastsigninAt;
  String? phone;
  String? displayname;

  UserResult({
    this.id,
    this.avatar,
    this.email,
    this.password,
    this.createAt,
    this.updateAt,
    this.lastsigninAt,
    this.phone,
    this.displayname,
  });

  factory UserResult.fromJson(Map<String, dynamic> json) => UserResult(
        id: json["id"],
        avatar: json["avatar"],
        email: json["email"],
        password: json["password"],
        createAt: json["create_at"],
        updateAt: json["update_at"],
        lastsigninAt: json["lastsignin_at"],
        phone: json["phone"],
        displayname: json["displayname"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "avatar": avatar,
        "email": email,
        "password": password,
        "create_at": createAt,
        "update_at": updateAt,
        "lastsignin_at": lastsigninAt,
        "phone": phone,
        "displayname": displayname,
      };
}
