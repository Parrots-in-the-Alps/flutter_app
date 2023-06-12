// To parse this JSON data, do
//
//     final reservationCarrier = reservationCarrierFromJson(jsonString);

import 'dart:convert';

ReservationCarrier reservationCarrierFromJson(String str) => ReservationCarrier.fromJson(json.decode(str));

String reservationCarrierToJson(ReservationCarrier data) => json.encode(data.toJson());

class ReservationCarrier {
    String status;
    Reservation reservation;
    User user;

    ReservationCarrier({
        required this.status,
        required this.reservation,
        required this.user,
    });

    factory ReservationCarrier.fromJson(Map<String, dynamic> json) => ReservationCarrier(
        status: json["status"],
        reservation: Reservation.fromJson(json["reservation"]),
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "reservation": reservation.toJson(),
        "user": user.toJson(),
    };
}

class Reservation {
    int id;
    String entryDate;
    String exitDate;
    int userId;
    bool isDue;
    DateTime createdAt;
    DateTime updatedAt;
    int roomId;
    dynamic serviceId;
    dynamic checkedIn;

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
    });

    factory Reservation.fromJson(Map<String, dynamic> json) => Reservation(
        id: json["id"],
        entryDate: json["entryDate"],
        exitDate: json["exitDate"],
        userId: json["user_id"],
        isDue: json["isDue"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        roomId: json["room_id"],
        serviceId: json["service_id"],
        checkedIn: json["checked_in"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "entryDate": entryDate,
        "exitDate": exitDate,
        "user_id": userId,
        "isDue": isDue,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "room_id": roomId,
        "service_id": serviceId,
        "checked_in": checkedIn,
    };
}

class User {
    int id;
    String name;
    String email;
    DateTime emailVerifiedAt;
    int addressId;
    DateTime createdAt;
    DateTime updatedAt;

    User({
        required this.id,
        required this.name,
        required this.email,
        required this.emailVerifiedAt,
        required this.addressId,
        required this.createdAt,
        required this.updatedAt,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
        addressId: json["address_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt.toIso8601String(),
        "address_id": addressId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
