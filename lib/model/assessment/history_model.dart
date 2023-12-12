import 'dart:convert';

HistoryModel historyModelFromJson(String str) =>
    HistoryModel.fromJson(json.decode(str));

String historyModelToJson(HistoryModel data) => json.encode(data.toJson());

class HistoryModel {
  String? message;
  List<HistoryResult>? result;

  HistoryModel({
    this.message,
    this.result,
  });

  factory HistoryModel.fromJson(Map<String, dynamic> json) => HistoryModel(
        message: json["message"],
        result: List<HistoryResult>.from(
            json["result"].map((x) => HistoryResult.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "result": List<dynamic>.from(result!.map((x) => x.toJson())),
      };
}

class HistoryResult {
  String? id;
  String? owner;
  String? type;
  String? summaryrate;
  List<Summary>? summary;
  CreateAt? createAt;

  HistoryResult({
    this.id,
    this.owner,
    this.type,
    this.summaryrate,
    this.summary,
    this.createAt,
  });

  factory HistoryResult.fromJson(Map<String, dynamic> json) => HistoryResult(
        id: json["id"],
        owner: json["owner"],
        type: json["type"],
        summaryrate: json["summaryrate"],
        summary:
            List<Summary>.from(json["summary"].map((x) => Summary.fromJson(x))),
        createAt: CreateAt.fromJson(json["create_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "owner": owner,
        "type": type,
        "summaryrate": summaryrate,
        "summary": List<dynamic>.from(summary!.map((x) => x.toJson())),
        "create_at": createAt!.toJson(),
      };
}

class CreateAt {
  int? seconds;
  int? nanoseconds;

  CreateAt({
    this.seconds,
    this.nanoseconds,
  });

  factory CreateAt.fromJson(Map<String, dynamic> json) => CreateAt(
        seconds: json["_seconds"],
        nanoseconds: json["_nanoseconds"],
      );

  Map<String, dynamic> toJson() => {
        "_seconds": seconds,
        "_nanoseconds": nanoseconds,
      };
}

class Summary {
  List<Scorerate>? scorerate;
  String? totalrate;
  String? advise;
  String? name;
  int? totalscore;
  List<Useranswer>? useranswer;
  String? owner;

  Summary({
    this.scorerate,
    this.totalrate,
    this.advise,
    this.name,
    this.totalscore,
    this.useranswer,
    this.owner,
  });

  factory Summary.fromJson(Map<String, dynamic> json) => Summary(
        scorerate: List<Scorerate>.from(
            json["scorerate"].map((x) => Scorerate.fromJson(x))),
        totalrate: json["totalrate"],
        advise: json["advise"],
        name: json["name"],
        totalscore: json["totalscore"],
        useranswer: List<Useranswer>.from(
            json["useranswer"].map((x) => Useranswer.fromJson(x))),
        owner: json["owner"],
      );

  Map<String, dynamic> toJson() => {
        "scorerate": List<dynamic>.from(scorerate!.map((x) => x.toJson())),
        "totalrate": totalrate,
        "advise": advise,
        "name": name,
        "totalscore": totalscore,
        "useranswer": List<dynamic>.from(useranswer!.map((x) => x.toJson())),
        "owner": owner,
      };
}

class Scorerate {
  String? rate;
  String? name;

  Scorerate({
    this.rate,
    this.name,
  });

  factory Scorerate.fromJson(Map<String, dynamic> json) => Scorerate(
        rate: json["rate"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "rate": rate,
        "name": name,
      };
}

class Useranswer {
  int? score;
  String? question;
  Answer? answer;

  Useranswer({
    this.score,
    this.question,
    this.answer,
  });

  factory Useranswer.fromJson(Map<String, dynamic> json) => Useranswer(
        score: json["score"],
        question: json["question"],
        answer: answerValues.map[json["answer"]],
      );

  Map<String, dynamic> toJson() => {
        "score": score,
        "question": question,
        "answer": answerValues.reverse[answer],
      };
}

enum Answer { EMPTY }

final answerValues = EnumValues({"ทุกวัน": Answer.EMPTY});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
