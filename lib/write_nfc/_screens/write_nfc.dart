import 'package:flutter/material.dart';
import 'package:vulcan_mobile_app/utils/app_bar.dart';

class WriteNfc extends StatelessWidget {
  const WriteNfc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const VulcanAppBar(title: 'Ecrire une clé'),
      body: Container(
        width: MediaQuery.of(context)
            .size
            .width, // Définir la largeur à la largeur de l'écran
        color: const Color(0xFF607D8B),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Text(
                'Chambre pour x personnes \n reservation n 124 \n chambre 404',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Icon(
                Icons.nfc,
                color: Color(0xFF455A64),
                size: 128,
              ),
              Text(
                'Mettre la carte sur le téléphone',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
