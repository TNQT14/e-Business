import 'package:freezed_annotation/freezed_annotation.dart';
part 'social_account.g.dart';
part 'social_account.freezed.dart';

@freezed
class SocialAccount with _$SocialAccount{
  factory SocialAccount({
    required int id,
    required String provider,
    required String providerId,
    required String email,
    required String name,
    required int userId,
}) = _SocialAccount;

  factory SocialAccount.fromJson(Map<String, dynamic> json ) =>
      _$SocialAccountFromJson(json);
}