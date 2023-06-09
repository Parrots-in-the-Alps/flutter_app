class Chambre {
  int id;
  String name;
  String type;
  String description;
  bool isActive;
  bool isQueued;
  String price;
  int number;
  int capacity;
  String image;

  Chambre({
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

  factory Chambre.fromJson(Map<String, dynamic> json) => Chambre(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        description: json["description"],
        isActive: json["isActive"],
        isQueued: json["isQueued"],
        price: json["price"],
        number: json["number"],
        capacity: json["capacity"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "description": description,
        "isActive": isActive,
        "isQueued": isQueued,
        "price": price,
        "number": number,
        "capacity": capacity,
        "image": image,
      };
}
