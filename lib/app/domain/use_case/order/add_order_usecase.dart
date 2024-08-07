import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';

import '../../entities/order/order_details.dart';
import '../../repositories/order_repository.dart';
import '../usecase.dart';



class AddOrderUseCase implements UseCase<OrderDetails, OrderDetails> {
  final OrderRepository repository;
  AddOrderUseCase(this.repository);

  @override
  Future<Either<Failure, OrderDetails>> call(OrderDetails params) async {
    return await repository.addOrder(params);
  }
}
