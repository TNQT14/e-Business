import 'package:dartz/dartz.dart';
import '../../../core/error/failures.dart';
import '../../entities/category/category.dart';
import '../../repositories/category_repository.dart';
import '../usecase.dart';

class GetRemoteCategoryUseCase implements UseCase<List<Category>, NoParams> {
  final CategoryRepository repository;
  GetRemoteCategoryUseCase(this.repository);

  @override
  Future<Either<Failure, List<Category>>> call(NoParams params) async {
    return await repository.getRemoteCategories();
  }
}
