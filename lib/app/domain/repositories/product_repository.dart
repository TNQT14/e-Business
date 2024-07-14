import 'package:dartz/dartz.dart';
import '../../core/error/failures.dart';
import '../entities/product/product_response.dart';
import '../use_case/product/get_product_usecase.dart';

abstract class ProductRepository {
  Future<Either<Failure, ProductResponse>> getProducts(FilterProductParams params);
}