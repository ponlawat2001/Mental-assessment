// To parse this JSON data, do
//
//     final ventModel = ventModelFromJson(jsonString);

import 'dart:convert';

VentModel ventModelFromJson(String str) => VentModel.fromJson(json.decode(str));

String ventModelToJson(VentModel data) => json.encode(data.toJson());

class VentModel {
  String? message;
  List<VentResult>? result;

  VentModel({
    this.message,
    this.result,
  });

  factory VentModel.fromJson(Map<String, dynamic> json) => VentModel(
        message: json["message"],
        result: List<VentResult>.from(
            json["result"].map((x) => VentResult.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "result": List<dynamic>.from(result!.map((x) => x.toJson())),
      };
}

class VentResult {
  String? id;
  String? ventContent;
  String? owner;
  dynamic createAt;
  dynamic updateAt;
  bool? isDelete;

  VentResult({
    this.id,
    this.ventContent,
    this.owner,
    this.createAt,
    this.updateAt,
    this.isDelete,
  });

  factory VentResult.fromJson(Map<String, dynamic> json) => VentResult(
        id: json["id"],
        ventContent: json["vent_content"],
        owner: json["owner"],
        createAt: json["create_at"],
        updateAt: json["update_at"],
        isDelete: json["is_delete"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "vent_content": ventContent,
        "owner": owner,
        "create_at": createAt.toJson(),
        "update_at": updateAt.toJson(),
        "is_delete": isDelete,
      };
}
