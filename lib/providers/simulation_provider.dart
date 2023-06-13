import 'package:flutter/material.dart';
import 'package:vulcan_mobile_app/repositories/simulation_api.dart';

class SimulationProvider extends ChangeNotifier {
  late bool _nfcWriteValid;

  Future<bool> openNaaNoor(String nfcTag, int reservationId) async {
    _nfcWriteValid =
        await SimultationApi().openNaaNoor(nfcTag, reservationId);

    notifyListeners();
    return _nfcWriteValid;
  }
}