import 'package:dartz/dartz.dart';


import '../../../core/error/failures.dart';
import '../../../model/user_model.dart';
import '../../repositories/user_repository.dart';
import '../usecase.dart';


class SignInUseCase implements UseCase<User, SignInParams> {
  final UserRepository repository;
  SignInUseCase(this.repository);

  @override
  Future<Either<Failure, User>> call(SignInParams params) async {
    return await repository.signIn(params);
  }
}

class SignInParams {
  final String username;
  final String password;
  const SignInParams({
    required this.username,
    required this.password,
  });
}