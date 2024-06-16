import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.g.dart';
part 'user_model.freezed.dart';

@freezed
class User with _$User{
  factory User({
    required int id,
    required String fullName,
    required String phoneNumber,
    required String address,
    required String password,
    required String createAt,
    required String updateAt,
    required bool isActive,
    required String DoB,
    required String facebookAcountId,
    required String googleAccountId,
    required int roleId,
}) = _User;

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);
}
