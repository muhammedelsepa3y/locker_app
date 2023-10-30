import '../../../core/utils/enums.dart';

class Locker {
  final int id;
  final String location;
  final int numberOfCells;
  final ReservationMode reservationMode;
  Locker({
    required this.id,
    required this.location,
    required this.numberOfCells,
    required this.reservationMode,
  });
}
