import 'dart:convert';

import '../../../domain/entities/category/category.dart';

List<CategoryModel> categoryModelListFromRemoteJson(String str) =>
    List<CategoryModel>.from(
        json.decode(utf8.decode(str.codeUnits)).map((x) => CategoryModel.fromJson(x)));

// json.decode(utf8.decode(str.codeUnits))

List<CategoryModel> categoryModelListFromLocalJson(String str) =>
    List<CategoryModel>.from(
        json.decode(str).map((x) => CategoryModel.fromJson(x)));

String categoryModelListToJson(List<CategoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryModel extends Category {
  const CategoryModel({
    required super.id,
    required super.name,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };

  factory CategoryModel.fromEntity(Category entity) => CategoryModel(
        id: entity.id,
        name: entity.name,
      );
}
