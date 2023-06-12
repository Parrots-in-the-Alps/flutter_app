import 'package:flutter/material.dart';
import 'package:vulcan_mobile_app/repositories/reservation_api.dart';

class ReservationProvider extends ChangeNotifier {
  String reservation_id = "";
  late bool _reservation_is_valid;

  Future<bool> reservationIsValid(int reservationId) async {
    _reservation_is_valid =
        await ReservationApi().reservationIsValid(reservationId);

    notifyListeners();
    return _reservation_is_valid;
  }
}
