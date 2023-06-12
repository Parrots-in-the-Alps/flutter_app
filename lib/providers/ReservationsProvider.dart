import 'package:flutter/material.dart';
import 'package:vulcan_mobile_app/repositories/reservation_api.dart';

class ReservationProvider extends ChangeNotifier {
  String reservation_id = "";
  late bool _reservation_is_valid;
  String nfc_tag = ""; //TODO error ? LateNotInitialized
  late bool _nfc_write_valid;

  Future<bool> reservationIsValid(int reservationId) async {
    _reservation_is_valid =
        await ReservationApi().reservationIsValid(reservationId);

    notifyListeners();
    return _reservation_is_valid;
  }

  Future<String> validateReservation(int reservationId) async {
    nfc_tag = await ReservationApi().validateReservation(reservationId);

    notifyListeners();
    return nfc_tag;
  }

  Future<bool> openNaaNoor(String nfcTag, int reservationId) async {
    _nfc_write_valid =
        await ReservationApi().openNaaNoor(nfcTag, reservationId);

    notifyListeners();
    return _nfc_write_valid;
  }
}
