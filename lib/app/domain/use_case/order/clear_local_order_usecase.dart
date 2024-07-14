import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../../repositories/order_repository.dart';
import '../usecase.dart';

class ClearLocalOrdersUseCase implements UseCase<NoParams, NoParams> {
  final OrderRepository repository;
  ClearLocalOrdersUseCase(this.repository);

  @override
  Future<Either<Failure, NoParams>> call(NoParams params) async {
    return await repository.clearLocalOrders();
  }
}
