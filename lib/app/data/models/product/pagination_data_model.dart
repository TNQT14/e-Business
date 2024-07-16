import '../../../domain/entities/product/pagination_meta_data.dart';

class PaginationMetaDataModel extends PaginationMetaData {
  PaginationMetaDataModel({
    required super.totalPages,
  });

  factory PaginationMetaDataModel.fromJson(Map<String, dynamic> json) => PaginationMetaDataModel(
    totalPages: json["totalPages"],
  );

  Map<String, dynamic> toJson() => {
    "totalPages": totalPages,
  };
}