import 'package:flutter/material.dart';
import 'package:vulcan_mobile_app/repositories/simulation_api.dart';

class SimulationProvider extends ChangeNotifier {
  late bool _nfcWriteValid;
  late int _roomId;
  late String nfcTag;
}
