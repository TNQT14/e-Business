import 'package:freezed_annotation/freezed_annotation.dart';
import '../core/values/enums.dart';
part 'orders.g.dart';
part 'orders.freezed.dart';

@freezed
class Orders with _$Orders{
  factory Orders({
    required int id,
    required int userId,
    required String fullName,
    required String email,
    required String phoneNumber,
    required String address,
    required String note,
    required DateTime orderDate,
    required Status status,
    @Default(0)double totalMoney,
    @Default('') String shippingMethod,
    @Default('') String shippingAddress,
    required DateTime shippingDate,
    @Default('') String trackingNumber,
    @Default('') String paymentMethod,
    @Default(false) bool active,
    @Default(0)int couponId,
}) = _Orders;

  factory Orders.fromJson(Map<String, dynamic> json) =>
      _$OrdersFromJson(json);
}