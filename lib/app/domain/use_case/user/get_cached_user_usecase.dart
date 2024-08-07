import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../../entities/user/user.dart';
import '../../repositories/user_repository.dart';
import '../usecase.dart';

class GetCachedUserUseCase implements UseCase<User, NoParams> {
  final UserRepository repository;
  GetCachedUserUseCase(this.repository);

  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    return await repository.getCachedUser();
  }
}
