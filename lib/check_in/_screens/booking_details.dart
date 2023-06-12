import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vulcan_mobile_app/utils/app_bar.dart';

import '../../providers/ReservationsProvider.dart';

class BookingDetails extends StatefulWidget {
  const BookingDetails({super.key});

  @override
  State<BookingDetails> createState() => _BookingDetailsState();
}

class _BookingDetailsState extends State<BookingDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF607D8B),
        appBar: const VulcanAppBar(title: "Booking Details"),
        body: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Card(
                    color: const Color(0xFF455A64),
                    child: SizedBox(
                      width: 300,
                      height: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Réservation ID: ${Provider.of<ReservationProvider>(context, listen: false).reservation_id}",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 18),
                            ),
                            const Text(
                              "Room type: Standard",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            const Text(
                              "Date: 19/06/2023 au 26/06/2023",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Card(
                    color: Color(0xFF455A64),
                    child: SizedBox(
                      width: 300,
                      height: 100,
                      child: Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Nom Prénom",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            Text(
                              "Nombre de personne: ",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            Text(
                              "2 adultes",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
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
            ],
          ),
        ));
  }
}


/**
 * 
 * 
 * 
 * 
 Text(
                    textAlign: TextAlign.start,
                    "Réservation ID: ${Provider.of<ReservationProvider>(context, listen: false).reservation_id}",
                    style: const TextStyle(color: Colors.white),
                  )
 * 
 * 
 body: Column(
          children: [
            Text(Provider.of<ReservationProvider>(context, listen: false).reservation_id),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.done),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.close),
            ),
          ],
        ));
 * 
 */


/**
 * 
 ,
            Expanded(
                flex: 1,
                child: Center(
                  child: Text(
                    "Scan result: $result",
                    style: const TextStyle(fontSize: 18),
                  ),
                )),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        if (result.isNotEmpty) {
                          Clipboard.setData(ClipboardData(text: result));
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Copied to Clipboard"),
                          ));
                        }
                      },
                      child: const Text("Copy")),
                  ElevatedButton(
                      onPressed: () async {
                        if (result.isNotEmpty) {
                          final Uri url = Uri.parse(result);
                          await launchUrl(url);
                        }
                      },
                      child: const Text("Open"))
                ],
              ),
            )
 * 
 */