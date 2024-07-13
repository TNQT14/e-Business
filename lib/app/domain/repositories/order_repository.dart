import 'package:dartz/dartz.dart';
import '../../core/error/failures.dart';
import '../../model/order_details.dart';
import '../use_case/usecase.dart';

abstract class OrderRepository {
  Future<Either<Failure, OrderDetails>> addOrder(OrderDetails params);
  Future<Either<Failure, List<OrderDetails>>> getRemoteOrders();
  Future<Either<Failure, List<OrderDetails>>> getCachedOrders();
  Future<Either<Failure, NoParams>> clearLocalOrders();
}