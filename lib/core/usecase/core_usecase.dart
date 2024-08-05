import 'package:fpdart/fpdart.dart';
import 'package:subspace_task/core/utils/failure.dart';

abstract interface class CoreUsecase<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call(Params params);
}

class NoParams {}
