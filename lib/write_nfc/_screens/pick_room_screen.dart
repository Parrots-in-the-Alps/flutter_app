import 'package:flutter/material.dart';
import 'package:vulcan_mobile_app/write_nfc/components/room_card.dart';

class PickRoomScreen extends StatelessWidget {
  const PickRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF455A64),
        title: const Text('Ma page d\'accueil'),
      ),
      body: Container(
        color: const Color(0xFF607D8B),
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                RoomCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
