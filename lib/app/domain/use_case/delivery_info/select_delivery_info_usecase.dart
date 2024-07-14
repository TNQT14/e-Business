import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../../entities/user/delivery_info.dart';
import '../../repositories/delivery_info_repository.dart';
import '../usecase.dart';

class SelectDeliveryInfoUseCase implements UseCase<DeliveryInfo, DeliveryInfo> {
  final DeliveryInfoRepository repository;
  SelectDeliveryInfoUseCase(this.repository);

  @override
  Future<Either<Failure, DeliveryInfo>> call(DeliveryInfo params) async {
    return await repository.selectDeliveryInfo(params);
  }
}
