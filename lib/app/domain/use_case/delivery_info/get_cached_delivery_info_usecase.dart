import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../../entities/user/delivery_info.dart';
import '../../repositories/delivery_info_repository.dart';
import '../usecase.dart';

class GetCachedDeliveryInfoUseCase implements UseCase<List<DeliveryInfo>, NoParams> {
  final DeliveryInfoRepository repository;
  GetCachedDeliveryInfoUseCase(this.repository);

  @override
  Future<Either<Failure, List<DeliveryInfo>>> call(NoParams params) async {
    return await repository.getCachedDeliveryInfo();
  }
}
