import 'package:dartz/dartz.dart';
import 'package:locker_app/core/error/custom_err.dart';

abstract class BaseUseCase<T, Parameters> {
  Future<Either<CustomError, T>> call(Parameters parameters);
}

class NoParams {}
