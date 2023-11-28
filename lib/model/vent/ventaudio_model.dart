// To parse this JSON data, do
//
//     final ventaudioModel = ventaudioModelFromJson(jsonString);

import 'dart:convert';

VentAudioModel ventaudioModelFromJson(String str) =>
    VentAudioModel.fromJson(json.decode(str));

String ventaudioModelToJson(VentAudioModel data) => json.encode(data.toJson());

class VentAudioModel {
  String? message;
  List<VentAudioResult>? result;

  VentAudioModel({
    this.message,
    this.result,
  });

  factory VentAudioModel.fromJson(Map<String, dynamic> json) => VentAudioModel(
        message: json["message"],
        result: List<VentAudioResult>.from(
            json["result"].map((x) => VentAudioResult.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "result": List<dynamic>.from(result!.map((x) => x.toJson())),
      };
}

class VentAudioResult {
  String? id;
  String? owner;
  String? audioUrl;
  dynamic createAt;
  dynamic updateAt;

  VentAudioResult({
    this.id,
    this.owner,
    this.audioUrl,
    this.createAt,
    this.updateAt,
  });

  factory VentAudioResult.fromJson(Map<String, dynamic> json) =>
      VentAudioResult(
        id: json["id"],
        owner: json["owner"],
        audioUrl: json["audioUrl"],
        createAt: json["create_at"],
        updateAt: json["update_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "owner": owner,
        "audioUrl": audioUrl,
        "create_at": createAt,
        "update_at": updateAt,
      };
}
