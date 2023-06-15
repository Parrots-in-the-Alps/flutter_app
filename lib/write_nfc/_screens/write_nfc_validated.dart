import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vulcan_mobile_app/main/home_page.dart';
import 'package:vulcan_mobile_app/providers/reservation_provider.dart';
import 'package:vulcan_mobile_app/providers/simulation_provider.dart';
import 'package:vulcan_mobile_app/repositories/reservation_api.dart';
import 'package:vulcan_mobile_app/repositories/simulation_api.dart';
import 'package:vulcan_mobile_app/utils/vulcan_app_bar.dart';

class WriteNFCValidated extends StatefulWidget {
  const WriteNFCValidated({super.key});

  @override
  State<WriteNFCValidated> createState() => _WriteNFCValidatedState();
}

class _WriteNFCValidatedState extends State<WriteNFCValidated> {
  @override
  void initState() {
    super.initState();
    String nfcTag = Provider.of<ReservationProvider>(context, listen: false)
        .reservations
        .reservations[0]
        .nfcTag;
    int roomId = Provider.of<ReservationProvider>(context, listen: false)
        .reservations
        .reservations[0]
        .room
        .roomId;
    ReservationApi().setNfcTag(nfcTag, roomId);
  }

  @override
  Widget build(BuildContext context) {
    String reservationID =
        Provider.of<ReservationProvider>(context, listen: false).reservationId;

    return Scaffold(
        // backgroundColor: const Color(0xFF607D8B),
        appBar: const VulcanAppBar(title: "Écrire clé"),
        body: Container(
          width: MediaQuery.of(context)
              .size
              .width, // Définir la largeur à la largeur de l'écran
          color: const Color(0xFF607D8B),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    reservationID == ""
                        ? const Text(
                            "reservation n X",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          )
                        : Text(
                            "reservation n${Provider.of<ReservationProvider>(context, listen: false).reservationId}",
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                    Text(
                      "chambre n${Provider.of<ReservationProvider>(context, listen: false).reservations.reservations[0].room.number}",
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                RawMaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
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
                  "Clé écrite !",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
