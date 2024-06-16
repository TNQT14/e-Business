import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_images.g.dart';
part 'product_images.freezed.dart';

@freezed

class ProductImages with _$ProductImages{
  factory ProductImages({
    required int id,
    required int productId,
    required String imageUrl,
}) = _ProductImage;

  factory ProductImages.fromJson(Map<String, dynamic>json)=>
      _$ProductImageFromJson(json);
}