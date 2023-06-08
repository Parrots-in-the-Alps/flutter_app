import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyCardWidget extends StatefulWidget {
  @override
  _MyCardWidgetState createState() => _MyCardWidgetState();
}

class _MyCardWidgetState extends State<MyCardWidget> {
  List<Chambre> chambres = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      // Effectuer la requête API
      final response = await http
          .get(Uri.parse('https://vulcan-7bh9.onrender.com/api/rooms/active'));

      // Vérifier si la requête a réussi
      if (response.statusCode == 200) {
        // Analyser les données JSON
        final data = json.decode(response.body);

        // Récupérer la liste de chambres depuis les données
        final List<dynamic> chambresData = data['data'];

        // Créer une liste de chambres à partir des données
        List<Chambre> chambresList = [];
        for (var chambreData in chambresData) {
          Chambre chambre = Chambre(
            chambreName: chambreData['name'],
            chambreNumber: chambreData['number'].toString(),
            chambreButtonText: 'Créer une clé',
            chambreRightText: chambreData['type'],
          );
          chambresList.add(chambre);
        }

        // Mettre à jour l'état avec la liste de chambres
        setState(() {
          chambres = chambresList;
        });
      } else {
        // Gérer les erreurs de requête API
        print('Erreur de requête API : ${response.statusCode}');
      }
    } catch (e) {
      // Gérer les erreurs
      print('Erreur lors de la récupération des données : $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500, // Hauteur spécifiée pour le conteneur de la liste
      child: ListView.builder(
        itemCount: chambres.length,
        itemBuilder: (context, index) {
          return buildCard(chambres[index]);
        },
      ),
    );
  }

  Widget buildCard(Chambre chambre) {
    return Card(
      color: const Color(0xFF455A64), // Couleur de la card : 455A64
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              chambre
                  .chambreName, // Utilisation de la variable pour le nom de la chambre
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'N° ${chambre.chambreNumber}', // Utilisation de la variable pour le numéro de chambre
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(
                        0xFF455A64), // Couleur du fond du bouton : 455A64
                    side: const BorderSide(
                        color: Colors
                            .orange), // Couleur des contours du bouton : orange
                  ),
                  onPressed: () {
                    // Action à effectuer lorsqu'on appuie sur le bouton "Créer une clé"
                  },
                  child: Text(
                    chambre
                        .chambreButtonText, // Utilisation de la variable pour le texte du bouton
                    style: const TextStyle(
                      color:
                          Colors.orange, // Couleur du texte du bouton : orange
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  chambre
                      .chambreRightText, // Utilisation de la variable pour le texte à droite du bouton
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Chambre {
  final String chambreName;
  final String chambreNumber;
  final String chambreButtonText;
  final String chambreRightText;

  Chambre({
    required this.chambreName,
    required this.chambreNumber,
    required this.chambreButtonText,
    required this.chambreRightText,
  });
}
