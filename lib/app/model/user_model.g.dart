// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: (json['id'] as num).toInt(),
      fullName: json['fullName'] as String,
      phoneNumber: json['phoneNumber'] as String,
      address: json['address'] as String,
      password: json['password'] as String,
      createAt: json['createAt'] as String,
      updateAt: json['updateAt'] as String,
      isActive: json['isActive'] as bool,
      DoB: json['DoB'] as String,
      facebookAcountId: json['facebookAcountId'] as String,
      googleAccountId: json['googleAccountId'] as String,
      roleId: (json['roleId'] as num).toInt(),
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'phoneNumber': instance.phoneNumber,
      'address': instance.address,
      'password': instance.password,
      'createAt': instance.createAt,
      'updateAt': instance.updateAt,
      'isActive': instance.isActive,
      'DoB': instance.DoB,
      'facebookAcountId': instance.facebookAcountId,
      'googleAccountId': instance.googleAccountId,
      'roleId': instance.roleId,
    };
