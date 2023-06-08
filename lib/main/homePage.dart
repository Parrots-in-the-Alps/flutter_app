import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF607D8B),
        title: const Text('Ma page d\'accueil'),
      ),
      body: Container(
        color: const Color(0xFF607D8B),
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment
                  .spaceEvenly, // Espacement égal entre les boutons
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Action à effectuer lorsque le premier bouton est pressé
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF9800),
                    padding: const EdgeInsets.all(
                        20.0), // Espacement interne des boutons
                    minimumSize: const Size(double.infinity,
                        0.0), // Taille minimale des boutons pour remplir l'espace disponible
                  ),
                  child: const Text(
                    'Check-in',
                    style: TextStyle(
                        fontSize:
                            20.0), // Augmenter la taille de la police du texte
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Action à effectuer lorsque le deuxième bouton est pressé
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF9800),
                    padding: const EdgeInsets.all(20.0),
                    minimumSize: const Size(double.infinity, 0.0),
                  ),
                  child: const Text(
                    'Ecrire une clé',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Action à effectuer lorsque le troisième bouton est pressé
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF9800),
                    padding: const EdgeInsets.all(20.0),
                    minimumSize: const Size(double.infinity, 0.0),
                  ),
                  child: const Text(
                    'Lire une clé',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
