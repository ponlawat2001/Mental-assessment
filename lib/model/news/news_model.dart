// To parse this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);

import 'dart:convert';

NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));

String newsModelToJson(NewsModel data) => json.encode(data.toJson());

class NewsModel {
  String? message;
  List<NewsResult>? result;

  NewsModel({
    this.message,
    this.result,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        message: json["message"],
        result: List<NewsResult>.from(
            json["result"].map((x) => NewsResult.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "result": List<dynamic>.from(result!.map((x) => x.toJson())),
      };
}

class NewsResult {
  String? id;
  String? title;
  String? intro;
  String? newsContent;
  String? imageUrl;
  dynamic createAt;
  dynamic updateAt;
  bool isDelete;

  NewsResult({
    this.id,
    this.title,
    this.intro,
    this.newsContent,
    this.imageUrl,
    this.createAt,
    this.updateAt,
    required this.isDelete,
  });

  factory NewsResult.fromJson(Map<String, dynamic> json) => NewsResult(
        id: json["id"],
        title: json["title"],
        intro: json["intro"],
        newsContent: json["news_content"],
        imageUrl: json["image_URL"],
        createAt: json["create_at"],
        updateAt: json["update_at"],
        isDelete: json["is_delete"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "intro": intro,
        "news_content": newsContent,
        "image_URL": imageUrl,
        "create_at": createAt,
        "update_at": updateAt,
        "is_delete": isDelete,
      };
}
