import 'package:flutter/material.dart';
import 'package:vulcan_mobile_app/models/reservation_carrier.dart';
import 'package:vulcan_mobile_app/repositories/reservation_api.dart';

class ReservationProvider extends ChangeNotifier {
  String reservationId = "";
  // late bool _reservationIsValid;
  late ReservationCarrier reservations;
  late ReservationCarrier validReservation;
  String nfcTag = ""; //TODO error ? LateNotInitialized
  // late bool _nfcSet;

  Future<ReservationCarrier> isReservationValide(String reservationId) async {
    validReservation =
        await ReservationApi().isReservationValide(reservationId);

    notifyListeners();
    return validReservation;
  }

  Future<String> validateReservation(int reservationId) async {
    nfcTag = await ReservationApi().validateReservation(reservationId);

    notifyListeners();
    return nfcTag;
  }

  Future<ReservationCarrier> getRollingReservation() async {
    reservations = await ReservationApi().getRollingReservation();
    notifyListeners();
    return reservations;
  }
}
