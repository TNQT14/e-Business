import 'dart:convert';

import '../../../domain/entities/user/user.dart';


UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel extends User {
  const UserModel({
    required String id,
    required String firstName,
    required String lastName,
    required String email,
    required String verify_account,
  }) : super(
    id: id,
    firstName: firstName,
    lastName: lastName,
    email: email,
      verify_account: verify_account
  );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["userID"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    verify_account: json["verify_account"],
  );

  Map<String, dynamic> toJson() => {
    "userID": id,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "verify_account": verify_account,
  };
}
