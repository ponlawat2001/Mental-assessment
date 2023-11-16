// To parse this JSON data, do
//
//     final contactModel = contactModelFromJson(jsonString);

import 'dart:convert';

ContactModel contactModelFromJson(String str) =>
    ContactModel.fromJson(json.decode(str));

String contactModelToJson(ContactModel data) => json.encode(data.toJson());

class ContactModel {
  String? message;
  List<ContactResult>? result;

  ContactModel({
    this.message,
    this.result,
  });

  factory ContactModel.fromJson(Map<String, dynamic> json) => ContactModel(
        message: json["message"],
        result: List<ContactResult>.from(
            json["result"].map((x) => ContactResult.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "result": List<dynamic>.from(result!.map((x) => x.toJson())),
      };
}

class ContactResult {
  String? id;
  String? nameContact;
  String? imageContact;
  String? locationContact;
  String? emailContact;
  String? facebookContact;
  String? lineContact;
  String? phoneContact;
  dynamic updateAt;

  ContactResult({
    this.id,
    this.nameContact,
    this.imageContact,
    this.locationContact,
    this.emailContact,
    this.facebookContact,
    this.lineContact,
    this.phoneContact,
    this.updateAt,
  });

  factory ContactResult.fromJson(Map<String, dynamic> json) => ContactResult(
        id: json["id"],
        nameContact: json["name_contact"],
        imageContact: json["image_contact"],
        locationContact: json["location_contact"],
        emailContact: json["email_contact"],
        facebookContact: json["facebook_contact"],
        lineContact: json["line_contact"],
        phoneContact: json["phone_contact"],
        updateAt: json["update_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name_contact": nameContact,
        "image_contact": imageContact,
        "location_contact": locationContact,
        "email_contact": emailContact,
        "facebook_contact": facebookContact,
        "line_contact": lineContact,
        "phone_contact": phoneContact,
        "update_at": updateAt?.toJson(),
      };
}
