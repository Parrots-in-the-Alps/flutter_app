import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:vulcan_mobile_app/simulation/_screens/simulation_failed.dart';
import 'package:vulcan_mobile_app/simulation/_screens/simulation_validated.dart';
import 'package:vulcan_mobile_app/utils/app_bar.dart';

class AccessSimulation extends StatefulWidget {
  const AccessSimulation({super.key});

  @override
  State<AccessSimulation> createState() => _AccessSimulationState();
}

class _AccessSimulationState extends State<AccessSimulation> {
  late Future<NfcTag?> _scannedTag =
      Future.value(null); //résultat de la lecture de la carte NFC

  bool _isScanning = true;
  //true parce qu'on scan direct quand on arrive sur cet écran

  @override
  initState() {
    super.initState();
    getNfcData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const VulcanAppBar(title: 'Simuler un accès'),
      body: Container(
        width: MediaQuery.of(context)
            .size
            .width, // Définir la largeur à la largeur de l'écran
        color: const Color(0xFF607D8B),
        child: const Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.nfc,
                color: Color(0xFF455A64),
                size: 128,
              ),
              Text(
                'Mettre la carte sur le téléphone pour simuler un accès',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> readNdef(NfcTag tag) {
    //Lister les données du tag
    List<Widget> ndefWidgets = [];

    var tech = Ndef.from(tag);
    if (tech is Ndef) {
      final record = tech.cachedMessage!.records[0];
      if (record.typeNameFormat == NdefTypeNameFormat.nfcWellknown &&
          record.type.length == 1 &&
          record.type.first == 0x54) {
        // record type: NFC Wellknown Text
        final languageCodeLength = record.payload.first;
        final text =
            utf8.decode(record.payload.sublist(1 + languageCodeLength));
        ndefWidgets.add(ListTile(
          title: Text(text),
        ));
      }

      return ndefWidgets;
    } else {
      return [const Text('No NDEF data found')];
    }
  }

  //Démarre la session de lecture NFC
  void getNfcData() async {
    bool isAvailable = await NfcManager.instance.isAvailable();

    if (isAvailable) {
      await NfcManager.instance.startSession(onError: (error) async {
        print(error);
        _scannedTag = Future.error(error);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SimulationFailed()),
        );
      }, onDiscovered: (NfcTag tag) async {
        setState(() {
          _scannedTag = Future.value(tag);
          _isScanning = false;
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const SimulationValidated()),
          );
        });
        NfcManager.instance.stopSession();
      });
    }
  }
}
