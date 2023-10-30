import '../../../core/utils/enums.dart';
import '../../domain/entities/locker.dart';

class LockerModel extends Locker {
  LockerModel({
    required int id,
    required String location,
    required int numberOfCells,
    required ReservationMode reservationMode,
  }) : super(
          id: id,
          location: location,
          numberOfCells: numberOfCells,
          reservationMode: reservationMode,
        );
  factory LockerModel.fromJson(Map<String, dynamic> json) => LockerModel(
        id: json['id'],
        location: json['location'],
        numberOfCells: json['numberOfCells'],
        reservationMode: ReservationMode.values[json['reservationMode']],
      );
  Map<String, dynamic> toJson() => {
        'id': id,
        'location': location,
        'numberOfCells': numberOfCells,
        'reservationMode': reservationMode.index,
      };
}
