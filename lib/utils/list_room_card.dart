import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:vulcan_mobile_app/models/chambre.dart';

class MyCardWidget extends StatefulWidget {
  const MyCardWidget(
      {super.key, required this.button_title, required this.widgetRedirection});

  final String button_title;
  final Widget widgetRedirection;

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
        List<Chambre> chambresList = chambresData.map((chambreData) {
          return Chambre.fromJson(chambreData);
        }).toList();

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
      height: 600,
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
      color: const Color(0xFF455A64),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              chambre.name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'N° ${chambre.number}',
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
                    backgroundColor: const Color(0xFF455A64),
                    side: const BorderSide(color: Colors.orange),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => widget.widgetRedirection,
                      ),
                    );
                  },
                  child: Text(
                    widget.button_title,
                    style: const TextStyle(
                      color: Colors.orange,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  chambre.type,
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
