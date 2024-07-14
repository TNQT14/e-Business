import 'package:dartz/dartz.dart';
import '../../../core/error/failures.dart';
import '../../entities/category/category.dart';
import '../../repositories/category_repository.dart';
import '../usecase.dart';

class GetCachedCategoryUseCase implements UseCase<List<Category>, NoParams> {
  final CategoryRepository repository;
  GetCachedCategoryUseCase(this.repository);

  @override
  Future<Either<Failure, List<Category>>> call(NoParams params) async {
    return await repository.getCachedCategories();
  }
}
