import 'package:flutter/material.dart';
import 'package:vulcan_mobile_app/repositories/reservation_api.dart';

class ReservationProvider extends ChangeNotifier {
  String reservationId = "";
  late bool _reservationIsValid;
  String nfcTag = ""; //TODO error ? LateNotInitialized
  // late bool _nfcSet;

  Future<bool> reservationIsValid(int reservationId) async {
    _reservationIsValid =
        await ReservationApi().reservationIsValid(reservationId);

    notifyListeners();
    return _reservationIsValid;
  }

  Future<String> validateReservation(int reservationId) async {
    nfcTag = await ReservationApi().validateReservation(reservationId);

    notifyListeners();
    return nfcTag;
  }
}
