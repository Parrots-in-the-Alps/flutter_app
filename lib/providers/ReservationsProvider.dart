import 'package:flutter/material.dart';

class ReservationProvider extends ChangeNotifier {
  String reservation_id = "";

  // Future<Reservation> getReservation() async {
  //   var response =
  //       await http.get(Uri.parse("https://rickandmortyapi.com/api/character"));
  //   return RickAndMortyCharacters.fromJson(jsonDecode(response.body)).results;
  // }
}
