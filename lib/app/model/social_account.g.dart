// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SocialAccountImpl _$$SocialAccountImplFromJson(Map<String, dynamic> json) =>
    _$SocialAccountImpl(
      id: (json['id'] as num).toInt(),
      provider: json['provider'] as String,
      providerId: json['providerId'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
      userId: (json['userId'] as num).toInt(),
    );

Map<String, dynamic> _$$SocialAccountImplToJson(_$SocialAccountImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'provider': instance.provider,
      'providerId': instance.providerId,
      'email': instance.email,
      'name': instance.name,
      'userId': instance.userId,
    };
