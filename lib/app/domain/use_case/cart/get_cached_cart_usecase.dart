import 'package:dartz/dartz.dart';
import '../../../core/error/failures.dart';
import '../../entities/cart/cart_item.dart';
import '../../repositories/cart_repository.dart';
import '../usecase.dart';

class GetCachedCartUseCase implements UseCase<List<CartItem>, NoParams> {
  final CartRepository repository;
  GetCachedCartUseCase(this.repository);

  @override
  Future<Either<Failure, List<CartItem>>> call(NoParams params) async {
    return await repository.getCachedCart();
  }
}
