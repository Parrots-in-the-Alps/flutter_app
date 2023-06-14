// To parse this JSON data, do
//
//     final reservationCarrier = reservationCarrierFromJson(jsonString);

import 'dart:convert';

ReservationCarrier reservationCarrierFromJson(String str) =>
    ReservationCarrier.fromJson(json.decode(str));

String reservationCarrierToJson(ReservationCarrier data) =>
    json.encode(data.toJson());

class ReservationCarrier {
    String status;
    List<Reservation> reservations;

    ReservationCarrier({
        required this.status,
        required this.reservations,
    });

  factory ReservationCarrier.fromJson(Map<String, dynamic> json) =>
      ReservationCarrier(
        status: json["status"],
        reservations: List<Reservation>.from(json["reservations"].map((x) => Reservation.fromJson(x))),
    );

  Map<String, dynamic> toJson() => {
        "status": status,
        "reservations": List<dynamic>.from(reservations.map((x) => x.toJson())),
    };
}

class Reservation {
    int id;
    DateTime dateIn;
    DateTime dateOut;
    String userName;
    dynamic nfcTag;
    dynamic checkedIn;
    Room room;

    Reservation({
        required this.id,
        required this.dateIn,
        required this.dateOut,
        required this.userName,
        this.nfcTag,
        this.checkedIn,
        required this.room,
    });

  factory Reservation.fromJson(Map<String, dynamic> json) => Reservation(
        id: json["id"],
        dateIn: DateTime.parse(json["dateIn"]),
        dateOut: DateTime.parse(json["dateOut"]),
        userName: json["userName"],
        nfcTag: json["nfcTag"],
        checkedIn: json["checkedIn"],
        room: Room.fromJson(json["room"]),
    );

  Map<String, dynamic> toJson() => {
        "id": id,
        "dateIn": "${dateIn.year.toString().padLeft(4, '0')}-${dateIn.month.toString().padLeft(2, '0')}-${dateIn.day.toString().padLeft(2, '0')}",
        "dateOut": "${dateOut.year.toString().padLeft(4, '0')}-${dateOut.month.toString().padLeft(2, '0')}-${dateOut.day.toString().padLeft(2, '0')}",
        "userName": userName,
        "nfcTag": nfcTag,
        "checkedIn": checkedIn,
        "room": room.toJson(),
    };
}

class Room {
    Type type;
    int number;
    dynamic activeCards;

    Room({
        required this.type,
        required this.number,
        this.activeCards,
    });

    factory Room.fromJson(Map<String, dynamic> json) => Room(
        type: typeValues.map[json["type"]]!,
        number: json["number"],
        activeCards: json["ActiveCards"],
    );

    Map<String, dynamic> toJson() => {
        "type": typeValues.reverse[type],
        "number": number,
        "ActiveCards": activeCards,
    };
}

enum Type { LUXURY, STANDARD, LUXE, SUITE }

final typeValues = EnumValues({
    "luxury": Type.LUXURY,
    "standard": Type.STANDARD,
    "luxe": Type.LUXE,
    "suite":Type.SUITE
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
