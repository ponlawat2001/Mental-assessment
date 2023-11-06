// To parse this JSON data, do
//
//     final ventchoiceModel = ventchoiceModelFromJson(jsonString);

import 'dart:convert';

VentChoiceModel ventchoiceModelFromJson(String str) =>
    VentChoiceModel.fromJson(json.decode(str));

String ventchoiceModelToJson(VentChoiceModel data) =>
    json.encode(data.toJson());

class VentChoiceModel {
  String? message;
  List<VentChoiceResult>? result;

  VentChoiceModel({
    this.message,
    this.result,
  });

  factory VentChoiceModel.fromJson(Map<String, dynamic> json) =>
      VentChoiceModel(
        message: json["message"],
        result: List<VentChoiceResult>.from(
            json["result"].map((x) => VentChoiceResult.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "result": List<dynamic>.from(result!.map((x) => x.toJson())),
      };
}

class VentChoiceResult {
  String? id;
  String? choice;
  dynamic createAt;
  dynamic updateAt;

  VentChoiceResult({
    this.id,
    this.choice,
    this.createAt,
    this.updateAt,
  });

  factory VentChoiceResult.fromJson(Map<String, dynamic> json) =>
      VentChoiceResult(
        id: json["id"],
        choice: json["choice"],
        createAt: json["create_at"],
        updateAt: json["update_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "choice": choice,
        "create_at": createAt.toJson(),
        "update_at": updateAt.toJson(),
      };
}
