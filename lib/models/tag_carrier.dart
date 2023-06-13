import 'dart:convert';

TagCarrier tagCarrierFromJson(String str) =>
    TagCarrier.fromJson(json.decode(str));

String tagCarrierToJson(TagCarrier data) => json.encode(data.toJson());

class TagCarrier {
  String status;
  String nfcTag;

  TagCarrier({
    required this.status,
    required this.nfcTag,
  });

  factory TagCarrier.fromJson(Map<String, dynamic> json) => TagCarrier(
        status: json["staus"],
        nfcTag: json["nfc_tag"],
      );

  Map<String, dynamic> toJson() => {
        "staus": status,
        "nfc_tag": nfcTag,
      };
}
