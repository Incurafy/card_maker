// item_card.dart

class ItemCard {
  final String id;
  final String name;
  final String type;
  final String rarity;
  final String desc;

  const ItemCard({
      required this.id,
      required this.name,
      required this.type,
      required this.rarity,
      required this.desc
  });

  factory ItemCard.fromJson(Map<String, dynamic> json) {
    return ItemCard(
      id: json["id"],
      name: json["name"],
      type: json["type"],
      rarity: json["rarity"],
      desc: json["desc"]
    );
  }

  dynamic toJson() => {
      "id": id,
      "name": name,
      "type": type,
      "rarity": rarity,
      "desc": desc 
  };

  @override
  String toString() {
    return "{id: " + id + ", name: " + name + ", type:" + type +
           ", rarity: " + rarity + ", desc: " + desc + "}";
  }

}
