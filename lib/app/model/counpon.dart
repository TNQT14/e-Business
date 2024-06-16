import 'package:freezed_annotation/freezed_annotation.dart';

part 'counpon.g.dart';
part 'counpon.freezed.dart';

@freezed
class Counpon with _$Counpon{
  factory Counpon({
  required int id,
  required String code,
  required bool active,
}) = _Counpon;

  factory Counpon.fromJson(Map<String, dynamic> json)=>
      _$CounponFromJson(json);
}