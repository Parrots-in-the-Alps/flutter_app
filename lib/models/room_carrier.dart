// To parse this JSON data, do
//
//     final roomCarrier = roomCarrierFromJson(jsonString);

import 'dart:convert';

RoomCarrier roomCarrierFromJson(String str) =>
    RoomCarrier.fromJson(json.decode(str));

String roomCarrierToJson(RoomCarrier data) => json.encode(data.toJson());

class RoomCarrier {
  List<Room> data;
  String description;

  RoomCarrier({
    required this.data,
    required this.description,
  });

  factory RoomCarrier.fromJson(Map<String, dynamic> json) => RoomCarrier(
        data: List<Room>.from(json["data"].map((x) => Room.fromJson(x))),
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "description": description,
      };
}

class Room {
  int id;
  Name name;
  Type type;
  Description description;
  bool isActive;
  bool isQueued;
  String price;
  int number;
  int capacity;
  Image image;

  Room({
    required this.id,
    required this.name,
    required this.type,
    required this.description,
    required this.isActive,
    required this.isQueued,
    required this.price,
    required this.number,
    required this.capacity,
    required this.image,
  });

  factory Room.fromJson(Map<String, dynamic> json) => Room(
        id: json["id"],
        name: nameValues.map[json["name"]]!,
        type: typeValues.map[json["type"]]!,
        description: descriptionValues.map[json["description"]]!,
        isActive: json["isActive"],
        isQueued: json["isQueued"],
        price: json["price"],
        number: json["number"],
        capacity: json["capacity"],
        image: imageValues.map[json["image"]]!,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": nameValues.reverse[name],
        "type": typeValues.reverse[type],
        "description": descriptionValues.reverse[description],
        "isActive": isActive,
        "isQueued": isQueued,
        "price": price,
        "number": number,
        "capacity": capacity,
        "image": imageValues.reverse[image],
      };
}

enum Description {
  OUR_HOTEL_SUITE_IS_THE_BEST_OF_THE_COUNTRY,
  OUR_LUXURY_ROOM_IS_EXACTLY_WHAT_YOU_NEED,
  ALL_YOU_NEED_AT_THE_BEST_PRICE_FOR_A_GOOD_NIGHT,
  NOTRE_SUITE_EST_LA_MEILLEURE_DU_PAYS,
  NOS_CHAMBRE_DE_LUXE_SONT_EXACTEMENT_CE_DONT_VOUS_AVEZ_BESOIN,
  TOUT_CE_DONT_VOUS_AVEZ_BESOIN_AU_MEILLEUR_PRIX_POUR_UNE_AGREABLE_SOIREE
}

final descriptionValues = EnumValues({
  "All you need at the best price for a good night !":
      Description.ALL_YOU_NEED_AT_THE_BEST_PRICE_FOR_A_GOOD_NIGHT,
  "Our Hotel suite is the best of the country !":
      Description.OUR_HOTEL_SUITE_IS_THE_BEST_OF_THE_COUNTRY,
  "Our luxury room is exactly what you need !":
      Description.OUR_LUXURY_ROOM_IS_EXACTLY_WHAT_YOU_NEED,
  "Notre suite est la meilleure du pays !":
      Description.NOTRE_SUITE_EST_LA_MEILLEURE_DU_PAYS,
  "Nos chambres de luxes sont exactement ce dont vous avez besoins!":
      Description.NOS_CHAMBRE_DE_LUXE_SONT_EXACTEMENT_CE_DONT_VOUS_AVEZ_BESOIN,
  "Tout ce dont vous avez besoin au  meilleur prix pour une agréable soirée !":
      Description
          .TOUT_CE_DONT_VOUS_AVEZ_BESOIN_AU_MEILLEUR_PRIX_POUR_UNE_AGREABLE_SOIREE
});

enum Image { SUITE_ROOM_JPG, LUXURY_ROOM_JPG, STANDARD_ROOM_JPG }

final imageValues = EnumValues({
  "luxury_room.jpg": Image.LUXURY_ROOM_JPG,
  "standard_room.jpg": Image.STANDARD_ROOM_JPG,
  "suite_room.jpg": Image.SUITE_ROOM_JPG
});

enum Name {
  THE_SUITE,
  LUXURY_ROOM,
  STANDARD_ROOM,
  LA_SUITE,
  CHAMBRE_STANDARD,
  CHAMBRE_DE_LUXE
}

final nameValues = EnumValues({
  "Luxury Room": Name.LUXURY_ROOM,
  "Standard Room": Name.STANDARD_ROOM,
  "The Suite": Name.THE_SUITE,
  "La Suite": Name.LA_SUITE,
  "Chambre Standard": Name.CHAMBRE_STANDARD,
  "Chambre de Luxe": Name.CHAMBRE_DE_LUXE
});

enum Type { LUXURY, STANDARD, LUXE, SUITE }

final typeValues = EnumValues({
  "luxury": Type.LUXURY,
  "standard": Type.STANDARD,
  "luxe": Type.LUXE,
  "suite": Type.SUITE
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
