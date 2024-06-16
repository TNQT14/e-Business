import 'package:freezed_annotation/freezed_annotation.dart';

part 'counpon_conditions.g.dart';
part 'counpon_conditions.freezed.dart';

@freezed
class CounponConditions with _$CounponConditions{
  factory CounponConditions({
    required int id,
    required int counponId,
    required String attribute,
    required String operator,
    required String value,
    required double discountAmount,
}) = _CounponConditions;

  factory CounponConditions.fromJson(Map<String,dynamic> json) =>
      _$CounponConditionsFromJson(json);
}