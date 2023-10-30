import 'package:dartz/dartz.dart';
import 'package:locker_app/core/error/custom_err.dart';
import 'package:locker_app/core/usecase/base_usecase.dart';
import 'package:locker_app/locker/domain/entities/locker.dart';

abstract class BaseLockerRepository {
  Future<Either<CustomError, List<Locker>>> getLockers();
  Future<Either<CustomError, NoParams>> addLocker(Locker locker);
}
