import 'package:dartz/dartz.dart';
import '../../../core/error/failures.dart';
import '../../entities/category/category.dart';
import '../../repositories/category_repository.dart';
import '../usecase.dart';

class FilterCategoryUseCase implements UseCase<List<Category>, String> {
  final CategoryRepository repository;
  FilterCategoryUseCase(this.repository);

  @override
  Future<Either<Failure, List<Category>>> call(String params) async {
    return await repository.filterCachedCategories(params);
  }
}
