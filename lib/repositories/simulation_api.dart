import 'package:http/http.dart' as http;

class SimultationApi {

//ajout check card

  ///simulation ouverture porte
  Future<bool> openNaaNoor(String nfcTag, int reservationId) async {
    var response = await http.post(
        Uri.parse("https://vulcan-7bh9.onrender.com/api/openNaaNoor"),
        body: {"reservation_id": reservationId, "nfc_tag": nfcTag});
    print(response);
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
}
