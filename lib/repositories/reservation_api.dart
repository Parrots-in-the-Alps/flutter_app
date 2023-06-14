import 'dart:convert';
import 'dart:js';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:vulcan_mobile_app/models/reservation_carrier.dart';
import 'package:vulcan_mobile_app/providers/reservation_provider.dart';

import '../models/tag_carrier.dart';

class ReservationApi {
  /// check de la réservation
  Future<ReservationCarrier> isReservationValide(String reservationId) async {
    var response = await http.post(
        Uri.parse("https://vulcan-7bh9.onrender.com/api/isresavalide"),
        body: {"reservation_id": reservationId});
    if (response.statusCode == 203) {
      return reservationCarrierFromJson(response.body);
    }

    throw Exception('Reservation non valide');
  }

  /// génère un nfc_tag
  Future<String> validateReservation(String reservationId) async {
    var response = await http.post(
        Uri.parse("https://vulcan-7bh9.onrender.com/api/validateresa"),
        body: {"reservation_id": reservationId});
    if (response.statusCode == 203) {
      return TagCarrier.fromJson(jsonDecode(response.body)).nfcTag;
    } else {
      return "open nee nooor";
    }
  }

  // Retourne la liste des reservations en cours
  Future<ReservationCarrier> getRollingReservation() async {
    var response = await http.get(Uri.parse(
        'https://vulcan-7bh9.onrender.com/api/getRollingReservations'));
    if (response.statusCode == 203) {
      return reservationCarrierFromJson(response.body);
    }
    throw Exception(response.statusCode);
  }
}
