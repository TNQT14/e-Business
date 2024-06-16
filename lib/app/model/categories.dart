import 'package:freezed_annotation/freezed_annotation.dart';

part 'categories.g.dart';
part 'categories.freezed.dart';

@freezed
class Categories with _$Categories{
  factory Categories({
    required int id,
    required String name,
}) = _Categories;

  factory Categories.fromJson(Map<String,dynamic>json)=>
      _$CategoriesFromJson(json);
}