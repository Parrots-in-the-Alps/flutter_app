import 'package:flutter/material.dart';
import 'package:vulcan_mobile_app/main/home_page.dart';
import 'package:vulcan_mobile_app/utils/vulcan_app_bar.dart';

import '../../utils/new_list_room_card.dart';

class ListingRoom extends StatelessWidget {
  const ListingRoom({super.key});

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
                MyCardWidget2(
                  buttonTitle: "coucou",
                  widgetRedirection: HomePage(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
