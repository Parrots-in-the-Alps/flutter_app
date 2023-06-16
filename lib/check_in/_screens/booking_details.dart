import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vulcan_mobile_app/check_in/_screens/booking_validated.dart';
import 'package:vulcan_mobile_app/models/reservation_carrier.dart';
import 'package:vulcan_mobile_app/repositories/reservation_api.dart';
import 'package:vulcan_mobile_app/utils/vulcan_alert_dialog.dart';
import 'package:vulcan_mobile_app/utils/vulcan_app_bar.dart';
import '../../providers/reservation_provider.dart';

class BookingDetails extends StatefulWidget {
  const BookingDetails({super.key});

  @override
  State<BookingDetails> createState() => _BookingDetailsState();
}

class _BookingDetailsState extends State<BookingDetails> {
  late Future<ReservationCarrier> validReservation;

  @override
  initState() {
    super.initState();
    String resaId =
        Provider.of<ReservationProvider>(context, listen: false).reservationId;
    validReservation = ReservationApi().isReservationValide(resaId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF607D8B),
        appBar: const VulcanAppBar(title: "Booking Details"),
        body: FutureBuilder<ReservationCarrier>(
          future: validReservation,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final ReservationCarrier resa = snapshot.data!;
              Provider.of<ReservationProvider>(context, listen: false)
                  .reservations = resa;
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Card(
                      color: const Color(0xFF455A64),
                      child: SizedBox(
                        width: 330,
                        height: 200,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                "Réservation ID: ${Provider.of<ReservationProvider>(context, listen: false).reservationId}",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                snapshot.data!.reservations[0].room.type.name,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              Text(
                                "Du ${snapshot.data!.reservations[0].dateIn.toString()} au ${snapshot.data!.reservations[0].dateOut.toString()} ",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              Text(
                                snapshot.data!.reservations[0].userName,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    RawMaterialButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BookingValidated()),
                        );
                      },
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
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return const VulcanAlertDialog(
                  textAlert: 'reservation non valide');
            }

            return const Center(child: CircularProgressIndicator());
          },
        ));
  }
}
