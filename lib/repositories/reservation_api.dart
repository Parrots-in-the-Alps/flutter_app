import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/tag_carrier.dart';

class ReservationApi {
  /// check de la réservation
  Future<bool> reservationIsValid(int reservationId) async {
    var response = await http.post(
        Uri.parse("https://vulcan-7bh9.onrender.com/api/isresavalide"),
        body: {"reservation_id": reservationId});
    switch (response.statusCode) {
      case 203:
        return true;
      case 403:
        return false;
      default:
        print("code http inccorect");
        return false;
    }
  }

  /// génère un nfc_tag
  Future<String> validateReservation(int reservationId) async {
    var response = await http.post(
        Uri.parse("https://vulcan-7bh9.onrender.com/api/validateresa"),
        body: {"reservation_id": reservationId});
    print(response);
    if (response.statusCode == 203) {
      return TagCarrier.fromJson(jsonDecode(response.body)).nfcTag;
    } else {
      return "open nee nooor";
    }
  }
}
