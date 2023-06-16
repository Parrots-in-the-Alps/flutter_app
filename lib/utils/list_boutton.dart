import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vulcan_mobile_app/models/reservation_carrier.dart';
import 'package:vulcan_mobile_app/providers/reservation_provider.dart';

class ListButton extends StatelessWidget {
  const ListButton(
      {super.key,
      required this.destination,
      required this.text,
      required this.resa});
  final Widget destination;
  final Reservation resa;
  final String text;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor:
          resa.checkedIn != null ? Colors.orange : const Color(0xFF07B456),
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
            builder: (context) => destination,
          ),
        );
        Provider.of<ReservationProvider>(context, listen: false).reservationId =
            resa.id.toString();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            text,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
          Icon(resa.checkedIn != null ? Icons.contactless : Icons.check_circle),
        ],
      ),
    );
  }
}
