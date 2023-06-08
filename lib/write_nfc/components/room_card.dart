import 'package:flutter/material.dart';

class RoomCard extends StatelessWidget {
  const RoomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: const Color(0xFF455A64),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text("NOM DE LA CHAMBRE"),
            const SizedBox(height: 15),
            const Text("N 12456"),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  child: const Text('BUY TICKETS'),
                  onPressed: () {/* ... */},
                ),
                const SizedBox(width: 8),
                TextButton(
                  child: const Text('LISTEN'),
                  onPressed: () {/* ... */},
                ),
              ],
            )
          ],
        ));
  }
}
