import 'package:flutter/material.dart';
import 'package:vulcan_mobile_app/repositories/simulation_api.dart';

class CharactersObservables extends ChangeNotifier {
  late bool _door_open;

  Future<bool> openDoor(String nfc_tag, int room_id, int reservation_id) async {
    _door_open = await SimultationApi().openDoor(nfc_tag, room_id, reservation_id);

    notifyListeners();
    return _door_open;
  }
}