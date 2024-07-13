import 'package:dartz/dartz.dart';
import '../../core/error/failures.dart';
import '../../model/user_model.dart';
import '../use_case/usecase.dart';
import '../use_case/user/sign_in_usecase.dart';
import '../use_case/user/sign_up_usecase.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> signIn(SignInParams params);
  Future<Either<Failure, User>> signUp(SignUpParams params);
  Future<Either<Failure, NoParams>> signOut();
  Future<Either<Failure, User>> getCachedUser();
}
