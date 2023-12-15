// To parse this JSON data, do
//
//     final assessmentModel = assessmentModelFromJson(jsonString);

import 'dart:convert';

AssessmentModel assessmentModelFromJson(String str) =>
    AssessmentModel.fromJson(json.decode(str));

String assessmentModelToJson(AssessmentModel data) =>
    json.encode(data.toJson());

class AssessmentModel {
  String? message;
  List<AssessmentResult>? result;

  AssessmentModel({
    this.message,
    this.result,
  });

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
  String? type;
  Questionnaire? questionnaire;
  List<Answer>? answer;
  List<Scorerate>? scorerate;
  List<Advise>? advise;
  AteAt? createAt;
  AteAt? updateAt;
  bool? isDelete;

  AssessmentResult({
    this.id,
    this.name,
    this.description,
    this.type,
    this.questionnaire,
    this.answer,
    this.scorerate,
    this.advise,
    this.createAt,
    this.updateAt,
    this.isDelete,
  });

  factory AssessmentResult.fromJson(Map<String, dynamic> json) =>
      AssessmentResult(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        type: json["type"],
        questionnaire: Questionnaire.fromJson(json["questionnaire"]),
        answer:
            List<Answer>.from(json["answer"].map((x) => Answer.fromJson(x))),
        scorerate: List<Scorerate>.from(
            json["scorerate"].map((x) => Scorerate.fromJson(x))),
        advise:
            List<Advise>.from(json["advise"].map((x) => Advise.fromJson(x))),
        createAt: AteAt.fromJson(json["create_at"]),
        updateAt: AteAt.fromJson(json["update_at"]),
        isDelete: json["is_delete"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "type": type,
        "questionnaire": questionnaire!.toJson(),
        "answer": List<dynamic>.from(answer!.map((x) => x.toJson())),
        "scorerate": List<dynamic>.from(scorerate!.map((x) => x.toJson())),
        "advise": List<dynamic>.from(advise!.map((x) => x.toJson())),
        "create_at": createAt!.toJson(),
        "update_at": updateAt!.toJson(),
        "is_delete": isDelete,
      };
}

class Advise {
  int? rate;
  String? advise;
  String? name;

  Advise({
    this.rate,
    this.advise,
    this.name,
  });

  factory Advise.fromJson(Map<String, dynamic> json) => Advise(
        rate: json["rate"],
        advise: json["advise"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "rate": rate,
        "advise": advise,
        "name": name,
      };
}

class Answer {
  int? score;
  String? name;

  Answer({
    this.score,
    this.name,
  });

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
        score: json["score"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "score": score,
        "name": name,
      };
}

class AteAt {
  int? seconds;
  int? nanoseconds;

  AteAt({
    this.seconds,
    this.nanoseconds,
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

class Questionnaire {
  List<String>? question;
  List<bool>? reversescore;

  Questionnaire({
    this.question,
    this.reversescore,
  });

  factory Questionnaire.fromJson(Map<String, dynamic> json) => Questionnaire(
        question: List<String>.from(json["question"].map((x) => x)),
        reversescore: List<bool>.from(json["reversescore"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "question": List<dynamic>.from(question!.map((x) => x)),
        "reversescore": List<dynamic>.from(reversescore!.map((x) => x)),
      };
}

class Scorerate {
  List<Answer>? rate;
  String? name;
  List<int>? questionnairenumber;

  Scorerate({
    this.rate,
    this.name,
    this.questionnairenumber,
  });

  factory Scorerate.fromJson(Map<String, dynamic> json) => Scorerate(
        rate: List<Answer>.from(json["rate"].map((x) => Answer.fromJson(x))),
        name: json["name"],
        questionnairenumber:
            List<int>.from(json["questionnairenumber"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "rate": List<dynamic>.from(rate!.map((x) => x.toJson())),
        "name": name,
        "questionnairenumber":
            List<dynamic>.from(questionnairenumber!.map((x) => x)),
      };
}
