import 'package:dartz/dartz.dart';
import 'package:ebusiness/app/domain/use_case/usecase.dart';
import 'package:ebusiness/app/model/categories.dart';
import 'package:flutter/foundation.dart';

import '../../core/error/failures.dart';
import '../entities/product_response.dart';
import '../repositories/product_repository.dart';


class GetProductUseCase
    implements UseCase<ProductResponse, FilterProductParams> {
  final ProductRepository repository;
  GetProductUseCase(this.repository);

  @override
  Future<Either<Failure, ProductResponse>> call(
      FilterProductParams params) async {
    return await repository.getProducts(params);
  }
}

class FilterProductParams {
  final String? keyword;
  final List<Categories> categories;
  final double minPrice;
  final double maxPrice;
  final int? limit;
  final int? pageSize;

  const FilterProductParams({
    this.keyword = '',
    this.categories = const [],
    this.minPrice = 0,
    this.maxPrice = 10000,
    this.limit = 0,
    this.pageSize = 10,
  });

  FilterProductParams copyWith({
    int? skip,
    String? keyword,
    List<Category>? categories,
    double? minPrice,
    double? maxPrice,
    int? limit,
    int? pageSize,
  }) =>
      FilterProductParams(
        keyword: keyword ?? this.keyword,
        // categories: categories ?? this.categories,
        minPrice: minPrice ?? this.minPrice,
        maxPrice: maxPrice ?? this.maxPrice,
        limit: skip ?? this.limit,
        pageSize: pageSize ?? this.pageSize,
      );
}
