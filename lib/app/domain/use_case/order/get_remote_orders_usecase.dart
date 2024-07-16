import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../../entities/order/order_details.dart';
import '../../repositories/order_repository.dart';
import '../usecase.dart';


class GetRemoteOrdersUseCase implements UseCase<List<OrderDetails>, NoParams> {
  final OrderRepository repository;
  GetRemoteOrdersUseCase(this.repository);

  @override
  Future<Either<Failure, List<OrderDetails>>> call(NoParams params) async {
    return await repository.getRemoteOrders();
  }
}
