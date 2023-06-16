import 'package:flutter/material.dart';

class SimulationProvider extends ChangeNotifier {
  late bool _nfcWriteValid;
  late int _roomId;
  late String nfcTag;

  void setRoomId(int roomId) {
    _roomId = roomId;
  }
}
