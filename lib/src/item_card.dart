// item_card.dart

// Defines an item card and its properties (many not listed)
class ItemCard {
  final int index;
  final String id;
  final String name;
  final String type;
  final String rarity;
  final String desc;

  const ItemCard(this.index, this.id, this.name, this.type, this.rarity, this.desc);

  ItemCard.fromJson(Map<String, dynamic> json)
    : index = json["index"], id = json["id"], name = json["name"], type = json["type"],
      rarity = json["rarity"], desc = json["desc"];
}