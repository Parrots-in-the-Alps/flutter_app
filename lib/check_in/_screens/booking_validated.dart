import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vulcan_mobile_app/main/home_page.dart';
import 'package:vulcan_mobile_app/utils/vulcan_app_bar.dart';
import 'package:vulcan_mobile_app/utils/menu_button.dart';
import 'package:vulcan_mobile_app/write_nfc/_screens/write_nfc.dart';

import '../../providers/reservation_provider.dart';
import '../../repositories/reservation_api.dart';
import '../../utils/vulcan_alert_dialog.dart';

class BookingValidated extends StatefulWidget {
  const BookingValidated({super.key});

  @override
  State<BookingValidated> createState() => _BookingValidatedState();
}

class _BookingValidatedState extends State<BookingValidated> {
  late Future<String> nfcTag0;

  @override
  initState() {
    super.initState();
    nfcTag0 = ReservationApi().validateReservation(
        Provider.of<ReservationProvider>(context, listen: false).reservationId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF607D8B),
        appBar: const VulcanAppBar(title: "Booking Validated"),
        body: Padding(
            padding: const EdgeInsets.all(24.0),
            child: FutureBuilder<String>(
                future: nfcTag0,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final String nfcTag = snapshot.data!;
                    bool setOk =
                        Provider.of<ReservationProvider>(context, listen: false)
                            .setReservationNfcTag(nfcTag);

                    if (setOk) {
                      return Column(
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
                          const MenuButton(
                              text: "Écrire une clé", destination: WriteNfc()),
                          const MenuButton(
                              text: "Accueuil", destination: HomePage()),
                        ],
                      );
                    }
                  } else if (snapshot.hasError) {
                    return const VulcanAlertDialog(textAlert: "erreur");
                  }
                  return const Center(child: CircularProgressIndicator());
                })));
  }
}
