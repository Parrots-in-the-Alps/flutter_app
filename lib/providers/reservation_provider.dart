import 'package:flutter/material.dart';
import 'package:vulcan_mobile_app/models/reservation_carrier.dart';

class ReservationProvider extends ChangeNotifier {
  String reservationId = "";
  // late bool _reservationIsValid;
  late ReservationCarrier reservations;
  // late bool _nfcSet;

  bool setReservationNfcTag(String nfcTag) {
    for (Reservation reservation in reservations.reservations) {
      if (reservation.id == int.parse(reservationId)) {
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

  String getRoomNfcTag() {
    for (Reservation reservation in reservations.reservations) {
      if (reservation.id == int.parse(reservationId)) {
        return reservation.nfcTag;
      }
    }
    throw Exception("reservation non trouvée");
  }

  Reservation getResaById() {
    print("getresabyid${reservationId}");
    for (Reservation reservation in reservations.reservations) {
      if (reservation.id == int.parse(reservationId)) {
        print(reservation);
        print(reservation.nfcTag);
        return reservation;
      }
    }
    throw Exception("reservation non trouvée");
  }
}
