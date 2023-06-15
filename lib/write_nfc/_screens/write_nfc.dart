import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:provider/provider.dart';
import 'package:vulcan_mobile_app/utils/vulcan_app_bar.dart';
import 'package:vulcan_mobile_app/providers/reservation_provider.dart';
import 'package:vulcan_mobile_app/write_nfc/_screens/write_nfc_validated.dart';

class WriteNfc extends StatefulWidget {
  const WriteNfc({super.key});

  @override
  State<WriteNfc> createState() => _WriteNfcState();
}

class _WriteNfcState extends State<WriteNfc> {
  String _dataToWrite = "Hello NFC 🏆"; //remplacer par le tag_nfc récupérer

  @override
  initState() {
    super.initState();
    _dataToWrite = Provider.of<ReservationProvider>(context, listen: false)
        .reservations
        .reservations[0]
        .nfcTag;
    writeData(_dataToWrite);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const VulcanAppBar(title: 'Ecrire une clé'),
      body: Container(
        width: MediaQuery.of(context)
            .size
            .width, // Définir la largeur à la largeur de l'écran
        color: const Color(0xFF607D8B),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "reservation n${Provider.of<ReservationProvider>(context, listen: false).reservations.reservations[0].id} \n chambre n${Provider.of<ReservationProvider>(context, listen: false).reservations.reservations[0].room.number}",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const Icon(
                Icons.nfc,
                color: Color(0xFF455A64),
                size: 128,
              ),
              const Text(
                'Mettre la carte sur le téléphone',
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

  Future<NfcTag?> scannedTag = Future.value(null);

  //Démarre la session d'écriture NFC
  void writeData(String keyCode) async {
    NfcManager.instance.startSession(onError: (error) async {
      print(error.details);
      print(error.message);
    }, onDiscovered: (NfcTag tag) async {
      var ndef = Ndef.from(tag);
      if (ndef == null || !ndef.isWritable) {
        print('Tag is not writable');
        NfcManager.instance.stopSession();
        return;
      }

      NdefMessage message = NdefMessage(
        [NdefRecord.createText(keyCode)],
      );

      try {
        await ndef.write(message);
        print("successfuly write");
        NfcManager.instance.stopSession();
        setState(() {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const WriteNFCValidated()),
          );
        });
      } catch (e) {
        NfcManager.instance.stopSession(errorMessage: e.toString());
        setState(() {});
        print(e.toString());
      }
    });
  }
}
