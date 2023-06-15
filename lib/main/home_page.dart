import 'package:flutter/material.dart';
import 'package:vulcan_mobile_app/check_in/_screens/qr_code.dart';
import 'package:vulcan_mobile_app/simulation/_screens/access_simulation.dart';
import 'package:vulcan_mobile_app/simulation/_screens/listing_room.dart';
import 'package:vulcan_mobile_app/simulation/_screens/simulation_room_list_card.dart';
import 'package:vulcan_mobile_app/utils/vulcan_app_bar.dart';
import 'package:vulcan_mobile_app/utils/menu_button.dart';
import 'package:vulcan_mobile_app/write_nfc/_screens/listing_reservation.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const VulcanAppBar(title: "ACCUEUIL"),
      body: Container(
        color: const Color(0xFF607D8B),
        child: const Expanded(
          child: Padding(
            padding: EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MenuButton(text: 'Check-in', destination: QRCode()),
                MenuButton(
                    text: 'Ecrire une clé', destination: ListingReservation()),
                MenuButton(
                    text: 'Simulation', destination: RoomList(buttonTitle: 'Simuler l\'accès', widgetRedirection: AccessSimulation())),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
