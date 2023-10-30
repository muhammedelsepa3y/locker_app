import 'package:dartz/dartz.dart';
import 'package:locker_app/core/usecase/base_usecase.dart';
import 'package:locker_app/locker/domain/entities/locker.dart';

import '../../../core/error/custom_err.dart';
import '../repository/base_locker_repository.dart';

class AddLockerUseCase implements BaseUseCase<Locker, Locker> {
  final BaseLockerRepository repository;

  AddLockerUseCase(this.repository);

  @override
  Future<Either<CustomError, Locker>> call(Locker parameters) async {
    try {
      await repository.addLocker(parameters);
      return Right(parameters);
    } catch (e) {
      return Left(CustomError(e.toString()));
    }
  }
}
