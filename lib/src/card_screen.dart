// card_screen.dart

import 'package:flutter/material.dart';
import 'package:card_maker/src/item_card.dart';
import 'package:card_maker/src/utils/text_utils.dart';

// Display the details of an item card
class CardScreen extends StatelessWidget {
  const CardScreen({Key? key, required this.itemCard,}) : super(key: key);
  //required this.cardDetails

  static const defPadSize = 16.0;

  final ItemCard itemCard;
  //final List<ListItem> cardDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(itemCard.itemName),
      ),
      body:
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: defPadSize, top: defPadSize),
              child: cardHeaderText("Item Card ID"),
            ),
            Padding(
              padding: const EdgeInsets.only(left: defPadSize),
              child: cardSubheaderText(itemCard.id)
            ),
            Padding(
              padding: const EdgeInsets.only(left: defPadSize, top: defPadSize),
              child: cardHeaderText("Description"),
            ),
            Padding(
              padding: const EdgeInsets.only(left: defPadSize),
              child: cardText(itemCard.itemDesc)
            )
          ],
      ),
    );
  }
}