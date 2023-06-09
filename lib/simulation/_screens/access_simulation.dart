import 'package:flutter/material.dart';
import 'package:vulcan_mobile_app/utils/app_bar.dart';

class AccessSimulation extends StatelessWidget {
  const AccessSimulation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const VulcanAppBar(title: 'Simuler un accès'),
      body: Container(
        width: MediaQuery.of(context)
            .size
            .width, // Définir la largeur à la largeur de l'écran
        color: const Color(0xFF607D8B),
        child: const Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.nfc,
                color: Color(0xFF455A64),
                size: 128,
              ),
              Text(
                'Mettre la carte sur le téléphone pour simuler un accès',
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
