// item_card.dart

import 'package:flutter/material.dart';
import 'package:card_maker/src/card_icons.dart';

// Defines an item card and its properties (many not listed)
class ItemCard {
  final int index;
  final String id;
  final String name;
  final String type;
  final String rarity;
  final String desc;

  const ItemCard(this.index, this.id, this.name, this.type, this.rarity, this.desc);

  static const double iconSize = 32.0;

  ItemCard.fromJson(Map<String, dynamic> json)
    : index = json["index"], id = json["id"], name = json["name"], type = json["type"],
      rarity = json["rarity"], desc = json["desc"];

  // Choose which icon a card should use based on its type
  Icon chooseIcon(itemCards, index) {
    switch(itemCards[index].type) {
      case "weapon": {
        return const Icon(CardIcons.weapon, size: iconSize);
      }

      case "armour": {
        return const Icon(CardIcons.armour, size: iconSize);
      }

      case "staff": {
        return const Icon(CardIcons.staff, size: iconSize);
      }

      case "wand": {
        return const Icon(CardIcons.wand, size: iconSize);
      }

      case "wondrousItem": {
        return const Icon(CardIcons.wondrousItem, size: iconSize);
      }

      case "ring": {
        return const Icon(CardIcons.ring, size: iconSize);
      }

      case "scroll": {
        return const Icon(CardIcons.scroll, size: iconSize);
      }

      case "potion": {
        return const Icon(CardIcons.potion, size: iconSize);
      }

      default: {
        return const Icon(CardIcons.wondrousItem, size: iconSize);
      }
    }
  }

}
