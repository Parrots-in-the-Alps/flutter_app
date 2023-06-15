import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vulcan_mobile_app/models/room_carrier.dart';
import 'package:vulcan_mobile_app/providers/room_provider.dart';
import 'package:vulcan_mobile_app/repositories/simulation_api.dart';

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
  late Future<RoomCarrier> roomCa;

  @override
  void initState() {
    super.initState();
    // SimultationApi simApi = new SimultationApi();
    roomCa = SimultationApi().fetchRooms();
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
      child: FutureBuilder(
        future: roomCa,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final roomCarrier = snapshot.data!;
            Provider.of<RoomProvider>(context, listen: false).roomCarrier =
                roomCarrier;
            print(Provider.of<RoomProvider>(context, listen: false)
                .roomCarrier
                .data[0]
                .capacity);
            return Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: roomCarrier.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      final room = roomCarrier.data[index];
                      return buildCard(room);
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

  Widget buildCard(Room room) {
    return Card(
      color: const Color(0xFF455A64),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'N° ${room.number}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              room.type.name,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
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
              ],
            ),
            const SizedBox(width: 8),
          ],
        ),
      ),
    );
  }
}
