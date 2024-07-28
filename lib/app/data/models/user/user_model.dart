import 'dart:convert';

import '../../../domain/entities/user/user.dart';


UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.verify_account,
    required super.citizenPid,
    required super.fullName,
    required super.birthDate,
    required super.gender,
    required super.ethnic,
    required super.religion,
    required super.homeTown,
    required super.regPlaceAddress,
    required super.identifyCharacteristics,
    required super.dateProvide,
    required super.outOfDate,
    required super.photoBase64,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["userID"],
    firstName: json["firstName"]?? "",
    lastName: json["lastName"]?? "",
    email: json["email"],
    verify_account: json["verify_account"] ?? "false",
    citizenPid: json["citizenPid"]  ?? "",
    fullName: json["fullName"] ?? "",
    birthDate: json["birthDate"] ?? "",
    gender: json["gender"] ?? "",
    ethnic: json["ethnic"] ?? "",
    religion: json["religion"] ?? "",
    homeTown: json["homeTown"] ?? "",
    regPlaceAddress: json["regPlaceAddress"] ?? "",
    identifyCharacteristics: json["identifyCharacteristics"] ?? "",
    dateProvide: json["dateProvide"] ?? "",
    outOfDate: json["outOfDate"] ?? "",
    photoBase64: json["photoBase64"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "userID": id,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "verify_account": verify_account,
    "citizenPid": citizenPid,
    "fullName": fullName,
    "birthDate": birthDate,
    "gender" : gender,
    "ethnic" : ethnic,
    "religion": religion,
    "homeTown": homeTown,
    "regPlaceAddress": regPlaceAddress,
    "identifyCharacteristics": identifyCharacteristics,
    "dateProvide": dateProvide,
    "outOfDate": outOfDate,
    "photoBase64": photoBase64,

  };
}
