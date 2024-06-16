// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counpon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CounponImpl _$$CounponImplFromJson(Map<String, dynamic> json) =>
    _$CounponImpl(
      id: (json['id'] as num).toInt(),
      code: json['code'] as String,
      active: json['active'] as bool,
    );

Map<String, dynamic> _$$CounponImplToJson(_$CounponImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'active': instance.active,
    };
