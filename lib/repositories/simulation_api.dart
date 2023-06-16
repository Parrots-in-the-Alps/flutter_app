import 'package:http/http.dart' as http;
import 'package:vulcan_mobile_app/models/room_carrier.dart';

class SimultationApi {
//ajout check card

  ///simulation ouverture porte
  Future<bool> openNaaNoor(String nfcTag, String reservationId) async {
    print("arguments opennnoor");
    print("nfcTag $nfcTag\n");
    print("reservationId:\n");
    print(reservationId);
    print("avant call open");
    var response = await http.post(
        Uri.parse("https://vulcan-7bh9.onrender.com/api/openNaaNoor"),
        body: {"reservation_id": reservationId, "nfc_tag": nfcTag});
    print(response.statusCode);
    print("apres call open");
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

  Future<RoomCarrier> fetchRooms() async {
    final response =
        await http.get(Uri.parse('https://vulcan-7bh9.onrender.com/api/rooms'));
    print(response);
    if (response.statusCode != 200) {
      throw Exception('Erreur lors de la récupération des chambres');
    }
    return roomCarrierFromJson(response.body);
  }
}
