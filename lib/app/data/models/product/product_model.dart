import '../../../domain/entities/product/product.dart';
import '../category/category_model.dart';
import 'price_tag_model.dart';

class ProductModel extends Product {
  const ProductModel({
    required super.id,
    required super.name,
    required super.description,
    required super.priceTags,
    required super.categories,
    required super.images,
    required super.createdAt,
    required super.updatedAt,
  });

  // factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
  //       id: json["id"],
  //       name: json["name"],
  //       description: json["description"],
  //       priceTags: json["price"],
  //       categories: json["category_id"],
  //       images: List<String>.from(json["product_images"].map((x) => x)),
  //       createdAt: DateTime.parse(json["created_at"]),
  //       updatedAt: DateTime.parse(json["updated_at"]),
  //     );

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json["id"],
    name: json["name"] as String,
    description: json["description"] as String,
    priceTags: json["price"],
    categories: json["category_id"] as int,
    images: ['https://media.hasaki.vn/wysiwyg/HaNguyen1/sua-rua-mat-simple-giup-da-sach-thoang-150ml-1.jpg'],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );


  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "price": List<dynamic>.from(
            (priceTags as List<PriceTagModel>).map((x) => x.toJson())),
        "category_id": List<dynamic>.from(
            (categories as List<CategoryModel>).map((x) => x.toJson())),
        "product_images": List<dynamic>.from(images.map((x) => x)),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };

  factory ProductModel.fromEntity(Product entity) => ProductModel(
        id: entity.id,
        name: entity.name,
        description: entity.description,
        priceTags: entity.priceTags,
        categories: entity.categories,
        images: entity.images,
        createdAt: entity.createdAt,
        updatedAt: entity.updatedAt,
      );
}
