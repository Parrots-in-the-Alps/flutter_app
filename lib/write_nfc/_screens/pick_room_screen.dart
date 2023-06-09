import 'package:flutter/material.dart';
import 'package:vulcan_mobile_app/utils/app_bar.dart';
import 'package:vulcan_mobile_app/utils/list_room_card.dart';
import 'package:vulcan_mobile_app/write_nfc/_screens/write_nfc.dart';

class PickRoomScreen extends StatelessWidget {
  const PickRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const VulcanAppBar(title: 'Choisir une chambre'),
      body: Container(
        color: const Color(0xFF607D8B),
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                MyCardWidget(
                    button_title: "Créer une clé",
                    widgetRedirection: WriteNfc()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
