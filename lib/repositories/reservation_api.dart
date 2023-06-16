import 'package:http/http.dart' as http;
import 'package:vulcan_mobile_app/models/reservation_carrier.dart';
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
      TagCarrier tag = tagCarrierFromJson(response.body);
      return tag.nfcTag;
    } else {
      return "open nee nooor";
    }
  }

  // Retourne la liste des reservations en cours
  Future<ReservationCarrier> getRollingReservation(bool checkedIn) async {
    var response = await http.post(Uri.parse(
        'https://vulcan-7bh9.onrender.com/api/getRollingReservations'),
        body: {"checkedIn_resa": checkedIn});
    if (response.statusCode == 203) {
      return reservationCarrierFromJson(response.body);
    }
    throw Exception(response.statusCode);
  }

  Future<bool> setNfcTag(String nfcTag, int roomId) async {
    var response = await http.post(
        Uri.parse("https://vulcan-7bh9.onrender.com/api/setNfc"),
        body: {"room_id": roomId.toString(), "nfc_tag": nfcTag});
    if (response.statusCode == 203) {
      return true;
    }
    return false;
  }

  Future<bool> checkCardCounter(int roomId) async {
    var response = await http.post(
        Uri.parse("https://vulcan-7bh9.onrender.com/api/checkcard"),
        body: {"room_id": roomId.toString()});
    if (response.statusCode == 203) {
      return true;
    }
    return false;
  }
}
