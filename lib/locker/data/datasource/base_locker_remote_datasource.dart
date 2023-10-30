import 'package:locker_app/core/error/custom_err.dart';
import 'package:locker_app/locker/data/models/locker_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:locker_app/locker/domain/entities/locker.dart';

abstract class BaseLockerRemoteDataSource {
  Future<List<LockerModel>> getLockers();

  Future<void> addLocker(Locker locker);
}

class LockerRemoteDataSource implements BaseLockerRemoteDataSource {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> addLocker(Locker locker) async {
    try {
      LockerModel lockerModel = LockerModel(
        id: locker.id,
        location: locker.location,
        numberOfCells: locker.numberOfCells,
        reservationMode: locker.reservationMode,
      );
      await firestore.collection('lockers').add(lockerModel.toJson());
    } catch (e) {
      throw CustomError(e.toString());
    }
  }

  @override
  Future<List<LockerModel>> getLockers() {
    try {
      return firestore.collection('lockers').get().then((snapshot) {
        return snapshot.docs
            .map((doc) => LockerModel.fromJson(doc.data()))
            .toList();
      });
    } catch (e) {
      throw CustomError(e.toString());
    }
  }
}
