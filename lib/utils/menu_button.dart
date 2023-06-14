import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({super.key, required this.text, required this.destination});
  final String text;
  final Widget destination;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => destination,
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFFF9800),
        padding: const EdgeInsets.all(20.0), // Espacement interne des boutons
        minimumSize: const Size(double.infinity,
            0.0), // Taille minimale des boutons pour remplir l'espace disponible
      ),
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 20.0), // Augmenter la taille de la police du texte
      ),
    );
  }
}
