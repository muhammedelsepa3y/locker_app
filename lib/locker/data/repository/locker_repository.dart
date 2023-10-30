import 'package:dartz/dartz.dart';
import 'package:locker_app/core/error/custom_err.dart';
import 'package:locker_app/core/usecase/base_usecase.dart';
import 'package:locker_app/locker/domain/entities/locker.dart';
import 'package:locker_app/locker/domain/repository/base_locker_repository.dart';

import '../datasource/base_locker_remote_datasource.dart';

class LockerRepository extends BaseLockerRepository {
  final BaseLockerRemoteDataSource lockerRemoteDataSource;
  LockerRepository({required this.lockerRemoteDataSource});

  @override
  Future<Either<CustomError, NoParams>> addLocker(Locker locker) async {
    try {
      await lockerRemoteDataSource.addLocker(locker);
      return Right(NoParams());
    } catch (e) {
      return Left(CustomError(e.toString()));
    }
  }

  @override
  Future<Either<CustomError, List<Locker>>> getLockers() async {
    try {
      final lockers = await lockerRemoteDataSource.getLockers();
      return Right(lockers);
    } catch (e) {
      return Left(CustomError(e.toString()));
    }
  }
}
