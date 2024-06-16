// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderDetailsImpl _$$OrderDetailsImplFromJson(Map<String, dynamic> json) =>
    _$OrderDetailsImpl(
      id: (json['id'] as num).toInt(),
      oderId: (json['oderId'] as num).toInt(),
      productId: json['productId'] as String,
      price: (json['price'] as num).toDouble(),
      numberOfProduct: (json['numberOfProduct'] as num).toInt(),
      totalMoney: (json['totalMoney'] as num).toDouble(),
      color: json['color'] as String,
      counponId: (json['counponId'] as num).toInt(),
    );

Map<String, dynamic> _$$OrderDetailsImplToJson(_$OrderDetailsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'oderId': instance.oderId,
      'productId': instance.productId,
      'price': instance.price,
      'numberOfProduct': instance.numberOfProduct,
      'totalMoney': instance.totalMoney,
      'color': instance.color,
      'counponId': instance.counponId,
    };
