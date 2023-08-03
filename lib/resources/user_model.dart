// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

List<UserModel> userModelFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
  String email;
  String fname;
  String lname;

  UserModel({
    required this.email,
    required this.fname,
    required this.lname,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        email: json["EMAIL"],
        fname: json["FNAME"],
        lname: json["LNAME"],
      );

  Map<String, dynamic> toJson() => {
        "EMAIL": email,
        "FNAME": fname,
        "LNAME": lname,
      };
}
