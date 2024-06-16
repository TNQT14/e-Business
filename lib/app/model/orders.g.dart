// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrdersImpl _$$OrdersImplFromJson(Map<String, dynamic> json) => _$OrdersImpl(
      id: (json['id'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      address: json['address'] as String,
      note: json['note'] as String,
      orderDate: DateTime.parse(json['orderDate'] as String),
      status: $enumDecode(_$StatusEnumMap, json['status']),
      totalMoney: (json['totalMoney'] as num?)?.toDouble() ?? 0,
      shippingMethod: json['shippingMethod'] as String? ?? '',
      shippingAddress: json['shippingAddress'] as String? ?? '',
      shippingDate: DateTime.parse(json['shippingDate'] as String),
      trackingNumber: json['trackingNumber'] as String? ?? '',
      paymentMethod: json['paymentMethod'] as String? ?? '',
      active: json['active'] as bool? ?? false,
      couponId: (json['couponId'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$OrdersImplToJson(_$OrdersImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'fullName': instance.fullName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'address': instance.address,
      'note': instance.note,
      'orderDate': instance.orderDate.toIso8601String(),
      'status': _$StatusEnumMap[instance.status]!,
      'totalMoney': instance.totalMoney,
      'shippingMethod': instance.shippingMethod,
      'shippingAddress': instance.shippingAddress,
      'shippingDate': instance.shippingDate.toIso8601String(),
      'trackingNumber': instance.trackingNumber,
      'paymentMethod': instance.paymentMethod,
      'active': instance.active,
      'couponId': instance.couponId,
    };

const _$StatusEnumMap = {
  Status.pending: 'pending',
  Status.processing: 'processing',
  Status.shipped: 'shipped',
  Status.delivered: 'delivered',
  Status.cancelled: 'cancelled',
};
