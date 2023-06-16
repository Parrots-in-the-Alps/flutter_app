import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vulcan_mobile_app/models/reservation_carrier.dart';
import 'package:vulcan_mobile_app/providers/reservation_provider.dart';
import 'package:vulcan_mobile_app/repositories/reservation_api.dart';

class RoomList extends StatefulWidget {
  const RoomList({
    Key? key,
    required this.buttonTitle,
    required this.widgetRedirection,
  }) : super(key: key);

  final String buttonTitle;
  final Widget widgetRedirection;

  @override
  _RoomListState createState() => _RoomListState();
}

class _RoomListState extends State<RoomList> {
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
      //TODO APPBAR
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
                RawMaterialButton(
                  fillColor: Colors.orange,
                  elevation: 2.0,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => widget.widgetRedirection,
                      ),
                    );
                    Provider.of<ReservationProvider>(context, listen: false)
                        .reservationId = resa.id.toString();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        widget.buttonTitle,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      const Icon(Icons.contactless),
                    ],
                  ),
                ),
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
