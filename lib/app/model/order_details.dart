import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_details.g.dart';
part 'order_details.freezed.dart';

@freezed
class OrderDetails with _$OrderDetails{
  factory OrderDetails({
    required int id,
    required int oderId,
    required String productId,
    required double price,
    required int numberOfProduct,
    required double totalMoney,
    required String color,
    required int counponId,
  }) = _OrderDetails;

  factory OrderDetails.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailsFromJson(json);
}