import 'package:flutter/material.dart';
import 'package:vulcan_mobile_app/utils/app_bar.dart';
import 'package:vulcan_mobile_app/utils/list_room_card.dart';

class PickRommSimulation extends StatelessWidget {
  const PickRommSimulation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const VulcanAppBar(title: 'Choisir une chambre'),
      body: Container(
        color: const Color(0xFF607D8B),
        child: const Expanded(
          child: Padding(
            padding: EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyCardWidget(button_title: "Simuler un accès"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
