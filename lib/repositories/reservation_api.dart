import 'package:http/http.dart' as http;

class ReservationApi {
  Future<bool> reservationIsValid(int reservation_id) async {
    var response = await http.post(
        Uri.parse("https://vulcan-7bh9.onrender.com/api/isresavalide"),
        body: {
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
