import 'dart:convert';

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
    print('zizi');
    if (response.statusCode == 203) {
      print('zozo');
      print('zuzu');
      print(response.body);
      TagCarrier tag = tagCarrierFromJson(response.body);
      print(tag.nfcTag);
      print('zuzu2');
      return tag.nfcTag;
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

  Future<String> setNfcTag(String nfcTag, int roomId) async {
    var response = await http.post(
        Uri.parse("https://vulcan-7bh9.onrender.com/api/isresavalide"),
        body: {"room_id": roomId, "nfc_tag": nfcTag});
    if (response.statusCode == 203) {
      return "zizicoptere" * 2;
    }
    throw Exception('no zizicoptere' * 2);
  }
}
