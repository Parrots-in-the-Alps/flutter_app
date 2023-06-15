import 'package:flutter/material.dart';
import 'package:vulcan_mobile_app/models/reservation_carrier.dart';

class ReservationProvider extends ChangeNotifier {
  String reservationId = "";
  // late bool _reservationIsValid;
  late ReservationCarrier reservations;
  // late bool _nfcSet;

  bool setReservationNfcTag(String nfcTag) {
    print('tutu');
    for (Reservation reservation in reservations.reservations) {
      print('toto');
      if (reservation.id == int.parse(reservationId)) {
        print("je suis dans le if");
        print(reservations.reservations.length);
        reservation.nfcTag = nfcTag;
        return true;
      }
    }
    return false;
  }

  int getRoomId() {
    for (Reservation reservation in reservations.reservations) {
      if (reservation.id == int.parse(reservationId)) {
        return reservation.room.roomId;
      }
    }
    throw Exception("reservation non trouvée");
  }

  




}
