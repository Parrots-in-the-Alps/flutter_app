import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vulcan_mobile_app/providers/ReservationsProvider.dart';
import 'package:vulcan_mobile_app/utils/app_bar.dart';

class WriteNFCValidated extends StatelessWidget {
  const WriteNFCValidated({super.key});

  @override
  Widget build(BuildContext context) {
    String reservationID =
        Provider.of<ReservationProvider>(context, listen: false).reservation_id;

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
                    const Text(
                      "Chambre pour X personnes",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
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
                            "reservation n${Provider.of<ReservationProvider>(context, listen: false).reservation_id}"),
                    const Text(
                      "Chambre 404",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                RawMaterialButton(
                  onPressed: () {},
                  elevation: 2.0,
                  fillColor: const Color(0xFF07B456),
                  padding: const EdgeInsets.all(30.0),
                  shape: const CircleBorder(),
                  child: const Icon(
                    Icons.done,
                    size: 40.0,
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
