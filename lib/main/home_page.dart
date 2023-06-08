import 'package:flutter/material.dart';
import 'package:vulcan_mobile_app/utils/button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF455A64),
        title: const Text('Ma page d\'accueil'),
      ),
      body: Container(
        color: const Color(0xFF607D8B),
        child: const Expanded(
          child: Padding(
            padding: EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
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
