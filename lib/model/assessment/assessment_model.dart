import 'dart:convert';

class AssessmentModel {
  String? message;
  List<AssessmentResult>? result;

  AssessmentModel({
    this.message,
    this.result,
  });

  factory AssessmentModel.fromRawJson(String str) =>
      AssessmentModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AssessmentModel.fromJson(Map<String, dynamic> json) =>
      AssessmentModel(
        message: json["message"],
        result: List<AssessmentResult>.from(
            json["result"].map((x) => AssessmentResult.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "result": List<dynamic>.from(result!.map((x) => x.toJson())),
      };
}

class AssessmentResult {
  String? id;
  String? name;
  String? description;
  Map<String, bool>? questionnaire;
  Map<String, int>? answer;
  Map<String, Scorerate>? scorerate;
  Map<String, Advise>? advise;
  AteAt? createAt;
  AteAt? updateAt;
  bool? isDelete;

  AssessmentResult({
    this.id,
    this.name,
    this.description,
    this.questionnaire,
    this.answer,
    this.scorerate,
    this.advise,
    this.createAt,
    this.updateAt,
    this.isDelete,
  });

  factory AssessmentResult.fromRawJson(String str) =>
      AssessmentResult.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AssessmentResult.fromJson(Map<String, dynamic> json) =>
      AssessmentResult(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        questionnaire: Map.from(json["questionnaire"])
            .map((k, v) => MapEntry<String, bool>(k, v)),
        answer:
            Map.from(json["answer"]).map((k, v) => MapEntry<String, int>(k, v)),
        scorerate: Map.from(json["scorerate"]).map(
            (k, v) => MapEntry<String, Scorerate>(k, Scorerate.fromJson(v))),
        advise: Map.from(json["advise"])
            .map((k, v) => MapEntry<String, Advise>(k, Advise.fromJson(v))),
        createAt: AteAt.fromJson(json["create_at"]),
        updateAt: AteAt.fromJson(json["update_at"]),
        isDelete: json["is_delete"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "questionnaire": Map.from(questionnaire ?? {})
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "answer": Map.from(answer ?? {})
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "scorerate": Map.from(scorerate ?? {})
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "advise": Map.from(advise ?? {})
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "create_at": createAt!.toJson(),
        "update_at": updateAt!.toJson(),
        "is_delete": isDelete,
      };
}

class Advise {
  int? rate;
  String? advise;

  Advise({
    this.rate,
    this.advise,
  });

  factory Advise.fromRawJson(String str) => Advise.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Advise.fromJson(Map<String, dynamic> json) => Advise(
        rate: json["rate"],
        advise: json["advise"],
      );

  Map<String, dynamic> toJson() => {
        "rate": rate,
        "advise": advise,
      };
}

class AteAt {
  int? seconds;
  int? nanoseconds;

  AteAt({
    this.seconds,
    this.nanoseconds,
  });

  factory AteAt.fromRawJson(String str) => AteAt.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AteAt.fromJson(Map<String, dynamic> json) => AteAt(
        seconds: json["_seconds"],
        nanoseconds: json["_nanoseconds"],
      );

  Map<String, dynamic> toJson() => {
        "_seconds": seconds,
        "_nanoseconds": nanoseconds,
      };
}

class Scorerate {
  Map<String, int>? rate;
  List<int>? questionnairenumber;

  Scorerate({
    this.rate,
    this.questionnairenumber,
  });

  factory Scorerate.fromRawJson(String str) =>
      Scorerate.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Scorerate.fromJson(Map<String, dynamic> json) => Scorerate(
        rate: Map.from(json["rate"]).map((k, v) => MapEntry<String, int>(k, v)),
        questionnairenumber:
            List<int>.from(json["questionnairenumber"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "rate":
            Map.from(rate ?? {}).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "questionnairenumber":
            List<dynamic>.from(questionnairenumber!.map((x) => x)),
      };
}
