import 'package:flutter/material.dart';
import 'package:vulcan_mobile_app/utils/app_bar.dart';

class SimulationValidated extends StatelessWidget {
  const SimulationValidated({super.key});

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
                fillColor: const Color(0xFF07B456),
                padding: const EdgeInsets.all(30.0),
                shape: const CircleBorder(),
                child: const Icon(
                  Icons.done,
                  size: 40.0,
                  color: Colors.white,
                ),
              ),
              const Text(
                "Accès validé !",
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
