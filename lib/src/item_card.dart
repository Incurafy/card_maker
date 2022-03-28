// item_card.dart

import 'package:uuid/uuid.dart';

// Defines an item card and its properties (many not listed)
class ItemCard {
  final Uuid id;
  final int index;
  final String itemName;
  final String itemDesc;

  const ItemCard(this.id, this.index, this.itemName, this.itemDesc);
}