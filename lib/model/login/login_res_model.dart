// To parse this JSON data, do
//
//     final restaurantModel = restaurantModelFromJson(jsonString);

import 'dart:convert';

ResEmailLogin restaurantModelFromJson(String str) =>
    ResEmailLogin.fromJson(json.decode(str));

String restaurantModelToJson(ResEmailLogin data) => json.encode(data.toJson());

class ResEmailLogin {
  String? message;
  String? result;

  ResEmailLogin({
    this.message,
    this.result,
  });

  factory ResEmailLogin.fromJson(Map<String, dynamic> json) => ResEmailLogin(
        message: json["message"],
        result: json["result"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "result": result,
      };
}
