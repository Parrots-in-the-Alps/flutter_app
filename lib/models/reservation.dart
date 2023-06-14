class Reservation {
  int id;
  String entryDate;
  String exitDate;
  int userId;
  bool isDue;
  String createdAt;
  String updatedAt;
  int roomId;
  List<int> serviceId;
  dynamic checkedIn;
  Room room;
  dynamic cardCounter;
  String user;
  String nfcTag;

  Reservation({
    required this.id,
    required this.entryDate,
    required this.exitDate,
    required this.userId,
    required this.isDue,
    required this.createdAt,
    required this.updatedAt,
    required this.roomId,
    required this.serviceId,
    required this.checkedIn,
    required this.room,
    required this.cardCounter,
    required this.user,
    required this.nfcTag,
  });

  factory Reservation.fromJson(Map<String, dynamic> json) {
    return Reservation(
      id: json['id'],
      entryDate: json['entryDate'],
      exitDate: json['exitDate'],
      userId: json['user_id'],
      isDue: json['isDue'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      roomId: json['room_id'],
      serviceId: List<int>.from(json['service_id']),
      checkedIn: json['checked_in'],
      room: Room.fromJson(json['room']),
      cardCounter: json['cardCounter'],
      user: json['user'],
      nfcTag: json['nfcTag'],
    );
  }
}

class Room {
  int id;
  Map<String, String> name;
  int number;
  bool isActive;
  bool isQueued;
  Map<String, String> type;
  int capacity;
  int price;
  String image;
  Map<String, String> description;
  String createdAt;
  String updatedAt;

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

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      id: json['id'],
      name: Map<String, String>.from(json['name']),
      number: json['number'],
      isActive: json['isActive'],
      isQueued: json['isQueued'],
      type: Map<String, String>.from(json['type']),
      capacity: json['capacity'],
      price: json['price'],
      image: json['image'],
      description: Map<String, String>.from(json['description']),
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
