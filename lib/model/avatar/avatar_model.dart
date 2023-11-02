import 'dart:convert';

Avatar restaurantModelFromJson(String str) => Avatar.fromJson(json.decode(str));

String restaurantModelToJson(Avatar data) => json.encode(data.toJson());

class Avatar {
  String? message;
  List<AvatarResult>? result;

  Avatar({
    this.message,
    this.result,
  });

  factory Avatar.fromJson(Map<String, dynamic> json) => Avatar(
        message: json["message"],
        result: List<AvatarResult>.from(
            json["result"].map((x) => AvatarResult.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "result": List<dynamic>.from(result!.map((x) => x.toJson())),
      };
}

class AvatarResult {
  String? id;
  String? email;
  String? avatar;
  AteAt? createAt;
  AteAt? updateAt;

  AvatarResult({
    this.id,
    this.email,
    this.avatar,
    this.createAt,
    this.updateAt,
  });

  factory AvatarResult.fromJson(Map<String, dynamic> json) => AvatarResult(
        id: json["id"],
        email: json["email"],
        avatar: json["avatar"],
        createAt: AteAt.fromJson(json["create_at"]),
        updateAt: AteAt.fromJson(json["update_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "avatar": avatar,
        "create_at": createAt?.toJson(),
        "update_at": updateAt?.toJson(),
      };
}

class AteAt {
  int seconds;
  int nanoseconds;

  AteAt({
    required this.seconds,
    required this.nanoseconds,
  });

  factory AteAt.fromJson(Map<String, dynamic> json) => AteAt(
        seconds: json["_seconds"],
        nanoseconds: json["_nanoseconds"],
      );

  Map<String, dynamic> toJson() => {
        "_seconds": seconds,
        "_nanoseconds": nanoseconds,
      };
}
