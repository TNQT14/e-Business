// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counpon_conditions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CounponConditionsImpl _$$CounponConditionsImplFromJson(
        Map<String, dynamic> json) =>
    _$CounponConditionsImpl(
      id: (json['id'] as num).toInt(),
      counponId: (json['counponId'] as num).toInt(),
      attribute: json['attribute'] as String,
      operator: json['operator'] as String,
      value: json['value'] as String,
      discountAmount: (json['discountAmount'] as num).toDouble(),
    );

Map<String, dynamic> _$$CounponConditionsImplToJson(
        _$CounponConditionsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'counponId': instance.counponId,
      'attribute': instance.attribute,
      'operator': instance.operator,
      'value': instance.value,
      'discountAmount': instance.discountAmount,
    };
