// item_details.dart

import 'package:flutter/material.dart';
import 'package:card_maker/src/item_card.dart';

class CardDetails extends StatelessWidget {
  const CardDetails({ Key? key, required this.itemCard }) : super(key: key);

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