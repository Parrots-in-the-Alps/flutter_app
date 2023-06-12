import 'package:http/http.dart' as http;

class SimultationApi {
  Future<bool> openDoor(String nfc_tag, int room_id, int reservation_id) async {
    var response = await http.post(
        Uri.parse("https://vulcan-7bh9.onrender.com/api/openNaaNoor"),
        body: {
          "nfc_tag": nfc_tag,
          "room_id": room_id,
          "reservation_id": reservation_id
        });
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
