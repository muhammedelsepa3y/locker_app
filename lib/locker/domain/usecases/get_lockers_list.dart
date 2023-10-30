import 'package:dartz/dartz.dart';
import 'package:locker_app/core/error/custom_err.dart';
import 'package:locker_app/core/usecase/base_usecase.dart';
import 'package:locker_app/locker/domain/repository/base_locker_repository.dart';
import '../entities/locker.dart';

class GetLockersListUseCase implements BaseUseCase<List<Locker>, NoParams> {
  final BaseLockerRepository repository;
  GetLockersListUseCase(this.repository);
  @override
  Future<Either<CustomError, List<Locker>>> call(NoParams parameters) async {
    try {
      final lockers = await repository.getLockers();
      return Right(lockers as List<Locker>);
    } catch (e) {
      return Left(CustomError(e.toString()));
    }
  }
}
