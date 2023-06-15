import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vulcan_mobile_app/providers/simulation_provider.dart';
import 'package:vulcan_mobile_app/repositories/simulation_api.dart';
import 'package:vulcan_mobile_app/simulation/_screens/simulation_failed.dart';
import 'package:vulcan_mobile_app/utils/vulcan_app_bar.dart';

import '../../main/home_page.dart';
import '../../providers/reservation_provider.dart';
import '../../utils/vulcan_alert_dialog.dart';

class SimulationValidated extends StatefulWidget {
  const SimulationValidated({super.key});

  @override
  State<SimulationValidated> createState() => _SimulationValidatedState();
}

class _SimulationValidatedState extends State<SimulationValidated> {
  late final Future<bool> isOpen;

  @override
  void initState() {
    super.initState();
    int reservationId = Provider.of<ReservationProvider>(context, listen: false)
        .reservations
        .reservations[0]
        .id;
    String scannedTag =
        Provider.of<SimulationProvider>(context, listen: false).nfcTag;
    isOpen = SimultationApi().openNaaNoor(scannedTag, reservationId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF607D8B),
        appBar: const VulcanAppBar(title: "Simulation Validated"),
        body: Center(
            child: FutureBuilder<bool>(
                future: isOpen,
                builder: (context, snapshot) {
                  print("zungugugu");
                  if (snapshot.hasData) {
                    print("prout stp");
                    if (snapshot.data! == true) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RawMaterialButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()),
                              );
                            },
                            elevation: 2.0,
                            fillColor: const Color(0xFF07B456),
                            padding: const EdgeInsets.all(30.0),
                            shape: const CircleBorder(),
                            child: const Icon(
                              Icons.done,
                              size: 60.0,
                              color: Colors.white,
                            ),
                          ),
                          const Text(
                            "Accès validé !",
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      );
                    } else {
                      return const SimulationFailed();
                    }
                  } else if (snapshot.hasError) {
                    return const VulcanAlertDialog(textAlert: "erreur");
                  }
                  return const Center(child: CircularProgressIndicator());
                })));
  }
}
