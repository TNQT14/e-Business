

import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.g.dart';
part 'product.freezed.dart';

@freezed
class Product with _$Product{
  factory Product({
    required int id,
    required String name,
    required double price,
    required String thumbnail,
    required String description,
    required DateTime createDate,
    required DateTime updateDate,
    required int categoryId,
}) = _Product;

  factory Product.fromJson(Map<String,dynamic>json)=>
      _$ProductFromJson(json);
}
