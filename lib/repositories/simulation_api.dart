// import 'dart:convert';

// import 'package:http/http.dart' as http;

// // import 'Tag.dart';

// class SimultationApi {
//   Future<ReseravationCarrier> openDoor() async {
//     var response = await http.post(
//         Uri.parse("https://vulcan-7bh9.onrender.com/api/openNaaNoor"),
//         body: {
//           "nfc_tag": "09700b3943108d312df48bf369b06ab811238848ad35",
//           "room_id": 2,
//           "reservation_id": 10
//         });
//     return ReseravationCarrier.fromJson(jsonDecode(response.body)).results;
//   }
// }
