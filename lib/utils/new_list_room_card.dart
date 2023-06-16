import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vulcan_mobile_app/main/home_page.dart';
import 'package:vulcan_mobile_app/models/reservation_carrier.dart';
import 'package:vulcan_mobile_app/providers/reservation_provider.dart';
import 'package:vulcan_mobile_app/repositories/reservation_api.dart';
import 'package:vulcan_mobile_app/write_nfc/_screens/write_nfc.dart';

import '../check_in/_screens/booking_details.dart';
import '../check_in/_screens/qr_code.dart';
import 'list_boutton.dart';

class MyCardWidget extends StatefulWidget {
  const MyCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  _MyCardWidgetState createState() => _MyCardWidgetState();
}

class _MyCardWidgetState extends State<MyCardWidget> {
  late Future<ReservationCarrier> reservationCarrier;

  @override
  void initState() {
    super.initState();
    // SimultationApi simApi = new SimultationApi();
    reservationCarrier = ReservationApi().getRollingReservation();
  }

  // @override
  // Widget build(BuildContext context) {
  //   return const Text("coucou");
  // }

//remplacer le build par un future builder

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //TODO
      height: 600,
      child: FutureBuilder(
        future: reservationCarrier,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final resaCarrier = snapshot.data!;
            Provider.of<ReservationProvider>(context, listen: false)
                .reservations = resaCarrier;
            return Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: resaCarrier.reservations.length,
                    itemBuilder: (BuildContext context, int index) {
                      final resa = resaCarrier.reservations[index];
                      return buildCard(resa);
                    },
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            throw const AlertDialog(
              backgroundColor: Color.fromRGBO(98, 0, 238, 1.0),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget buildCard(Reservation resa) {
    return Card(
      color: const Color(0xFF455A64),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Reservation N°${resa.id.toString()}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Chambre N° ${resa.room.number}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              resa.room.type.name,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  resa.userName,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                ListButton(
                    destination: resa.checkedIn == null
                        ? const BookingDetails()
                        : const WriteNfc(),
                    text: resa.checkedIn == null ? "checked-in" : "Ecrire clé",
                    resa: resa),
                const SizedBox(width: 8),
              ],
            ),
            const SizedBox(width: 8),
          ],
        ),
      ),
    );
  }
}
