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
        reservations: List<Reservation>.from(
            json["reservations"].map((x) => Reservation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "reservations": List<dynamic>.from(reservations.map((x) => x.toJson())),
      };
}

class Reservation {
  int id;
  DateTime entryDate;
  DateTime exitDate;
  int userId;
  bool isDue;
  DateTime createdAt;
  DateTime updatedAt;
  int roomId;
  dynamic serviceId;
  dynamic checkedIn;
  Room room;
  int cardCounter;
  String user;
  dynamic nfcTag;

  Reservation({
    required this.id,
    required this.entryDate,
    required this.exitDate,
    required this.userId,
    required this.isDue,
    required this.createdAt,
    required this.updatedAt,
    required this.roomId,
    this.serviceId,
    this.checkedIn,
    required this.room,
    required this.cardCounter,
    required this.user,
    this.nfcTag,
  });

  factory Reservation.fromJson(Map<String, dynamic> json) => Reservation(
        id: json["id"],
        entryDate: DateTime.parse(json["entryDate"]),
        exitDate: DateTime.parse(json["exitDate"]),
        userId: json["user_id"],
        isDue: json["isDue"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        roomId: json["room_id"],
        serviceId: json["service_id"],
        checkedIn: json["checked_in"],
        room: Room.fromJson(json["room"]),
        cardCounter: json["cardCounter"],
        user: json["user"],
        nfcTag: json["nfcTag"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "entryDate":
            "${entryDate.year.toString().padLeft(4, '0')}-${entryDate.month.toString().padLeft(2, '0')}-${entryDate.day.toString().padLeft(2, '0')}",
        "exitDate":
            "${exitDate.year.toString().padLeft(4, '0')}-${exitDate.month.toString().padLeft(2, '0')}-${exitDate.day.toString().padLeft(2, '0')}",
        "user_id": userId,
        "isDue": isDue,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "room_id": roomId,
        "service_id": serviceId,
        "checked_in": checkedIn,
        "room": room.toJson(),
        "cardCounter": cardCounter,
        "user": user,
        "nfcTag": nfcTag,
      };
}

class Room {
  int id;
  Description name;
  int number;
  bool isActive;
  bool isQueued;
  Description type;
  int capacity;
  String price;
  Image image;
  Description description;
  DateTime createdAt;
  DateTime updatedAt;

  Room({
    required this.id,
    required this.name,
    required this.number,
    required this.isActive,
    required this.isQueued,
    required this.type,
    required this.capacity,
    required this.price,
    required this.image,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Room.fromJson(Map<String, dynamic> json) => Room(
        id: json["id"],
        name: Description.fromJson(json["name"]),
        number: json["number"],
        isActive: json["isActive"],
        isQueued: json["isQueued"],
        type: Description.fromJson(json["type"]),
        capacity: json["capacity"],
        price: json["price"],
        image: imageValues.map[json["image"]]!,
        description: Description.fromJson(json["description"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name.toJson(),
        "number": number,
        "isActive": isActive,
        "isQueued": isQueued,
        "type": type.toJson(),
        "capacity": capacity,
        "price": price,
        "image": imageValues.reverse[image],
        "description": description.toJson(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Description {
  String en;
  String fr;

  Description({
    required this.en,
    required this.fr,
  });

  factory Description.fromJson(Map<String, dynamic> json) => Description(
        en: json["en"],
        fr: json["fr"],
      );

  Map<String, dynamic> toJson() => {
        "en": en,
        "fr": fr,
      };
}

enum Image { LUXURY_ROOM_JPG, STANDARD_ROOM_JPG }

final imageValues = EnumValues({
  "luxury_room.jpg": Image.LUXURY_ROOM_JPG,
  "standard_room.jpg": Image.STANDARD_ROOM_JPG
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
