import '../../../domain/entities/product/pagination_meta_data.dart';
import '../../../domain/entities/product/product.dart';
import '../../../domain/entities/product/product_response.dart';
import 'pagination_data_model.dart';
import 'product_model.dart';
import 'dart:convert';

ProductResponseModel productResponseModelFromJson(String str) =>
    ProductResponseModel.fromJson(json.decode(utf8.decode(str.codeUnits)));


String productResponseModelToJson(ProductResponseModel data) =>
    json.encode(data.toJson());

class ProductResponseModel extends ProductResponse {
  ProductResponseModel({
    required PaginationMetaData meta,
    required List<Product> data,
  }) : super(products: data, paginationMetaData: meta);

  factory ProductResponseModel.fromJson(Map<String, dynamic> json) => ProductResponseModel(
      meta: PaginationMetaDataModel.fromJson(json),
      data: List<ProductModel>.from(
          json["products"].map((x) => ProductModel.fromJson(x))),//3 =>ok
    );


  Map<String, dynamic> toJson() => {
        "totalPages": (paginationMetaData as PaginationMetaDataModel).toJson(),
        "products": List<dynamic>.from((products as List<ProductModel>).map((x) => x.toJson())),
      };
}
