import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vulcan_mobile_app/models/reservation_carrier.dart';

class MyCardWidget2 extends StatefulWidget {
  const MyCardWidget2({
    Key? key,
    required this.buttonTitle,
    required this.widgetRedirection,
  }) : super(key: key);

  final String buttonTitle;
  final Widget widgetRedirection;

  @override
  _MyCardWidgetState createState() => _MyCardWidgetState();
}

class _MyCardWidgetState extends State<MyCardWidget2> {
  late ReservationCarrier reservationCarrier;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(Uri.parse(
          'https://vulcan-7bh9.onrender.com/api/getRollingReservations'));
      print(response);
      if (response.statusCode == 203) {
        reservationCarrier = reservationCarrierFromJson(response.body);
      } else {
        print('Erreur de requête API : ${response.statusCode}');
      }
    } catch (e) {
      print('Erreur lors de la récupération des données : $e');
    }
  }

  // @override
  // Widget build(BuildContext context) {
  //   return const Text("coucou");
  // }

//remplacer le build par un future builder

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: ListView.builder(
        itemCount: reservationCarrier.reservations.length,
        itemBuilder: (context, index) {
          return buildCard(reservationCarrier.reservations[index]);
        },
      ),
    );
  }

  Widget buildCard(Reservation reservation) {
    return Card(
      color: const Color(0xFF455A64),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'N° ${reservation.room.number}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'N° ${reservation.room.number}',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFF455A64),
                    side: const BorderSide(color: Colors.orange),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => widget.widgetRedirection,
                      ),
                    );
                  },
                  child: Text(
                    widget.buttonTitle,
                    style: const TextStyle(
                      color: Colors.orange,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  'N° ${reservation.room.number}',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
