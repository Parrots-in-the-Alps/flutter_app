import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF455A64),
          title: Text('Ma page d\'accueil'),
        ),
        body: Container(
          color: Color(0xFF607D8B),
          width: double.infinity,
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Action à effectuer lorsque le deuxième bouton est pressé
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color(0xFFFF9800), // Couleur du bouton surélevé
                  ),
                  child: const Text('Check-in'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Action à effectuer lorsque le deuxième bouton est pressé
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color(0xFFFF9800), // Couleur du bouton surélevé
                  ),
                  child: const Text('Ecrire une clé'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Action à effectuer lorsque le deuxième bouton est pressé
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color(0xFFFF9800), // Couleur du bouton surélevé
                  ),
                  child: const Text('Lire une clé'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
