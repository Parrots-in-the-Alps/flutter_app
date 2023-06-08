import 'package:flutter/material.dart';
import 'package:vulcan_mobile_app/utils/button.dart';

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
              children: const [
                MenuButton(text: 'Check-in'),
                MenuButton(text: 'Ecrire une clé'),
                MenuButton(text: 'Lire une clé'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
