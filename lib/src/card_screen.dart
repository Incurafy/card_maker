// card_screen.dart

import 'package:flutter/material.dart';
import 'package:card_maker/src/item_card.dart';

// Display the details of an item card
class CardScreen extends StatelessWidget {
  const CardScreen({ Key? key, required this.itemCard }) : super(key: key);

  final ItemCard itemCard;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(itemCard.itemName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(itemCard.itemDesc),
      ),
    );
  }
}