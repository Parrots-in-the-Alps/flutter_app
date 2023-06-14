import 'package:flutter/material.dart';
import 'package:vulcan_mobile_app/utils/vulcan_app_bar.dart';

class SimulationFailed extends StatelessWidget {
  const SimulationFailed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF607D8B),
        appBar: const VulcanAppBar(title: "Simulation Validated"),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RawMaterialButton(
                onPressed: () {},
                elevation: 2.0,
                fillColor: const Color(0xFFD32F2F),
                padding: const EdgeInsets.all(30.0),
                shape: const CircleBorder(),
                child: const Icon(
                  Icons.warning,
                  size: 60.0,
                  color: Colors.white,
                ),
              ),
              const Text(
                "Carte vide !\nAccès refusé !",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ));
  }
}
