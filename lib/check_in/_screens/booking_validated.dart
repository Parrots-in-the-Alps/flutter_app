import 'package:flutter/material.dart';
import 'package:vulcan_mobile_app/main/home_page.dart';
import 'package:vulcan_mobile_app/utils/app_bar.dart';
import 'package:vulcan_mobile_app/utils/button.dart';

class BookingValidated extends StatelessWidget {
  const BookingValidated({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF607D8B),
        appBar: const VulcanAppBar(title: "Booking Validated"),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RawMaterialButton(
                onPressed: () {},
                elevation: 2.0,
                fillColor: const Color(0xFF07B456),
                padding: const EdgeInsets.all(30.0),
                shape: const CircleBorder(),
                child: const Icon(
                  Icons.done,
                  size: 60.0,
                  color: Colors.white,
                ),
              ),
              const MenuButton(text: "Écrire une clé", destination: HomePage()),
              const MenuButton(text: "Accueuil", destination: HomePage()),
            ],
          ),
        ));
  }
}
