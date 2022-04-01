// card_screen.dart

import 'package:flutter/material.dart';
import 'package:card_maker/src/item_card.dart';
import 'package:card_maker/src/utils/text_utils.dart';

// Display the details of an item card
class CardDetailsScreen extends StatelessWidget {
  const CardDetailsScreen({Key? key, required this.itemCard,}) : super(key: key);
  
  final ItemCard itemCard;
  static const regPadSize = 16.0;
  static const nrwPadSize = 4.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(itemCard.name),
      ),
      body:
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: regPadSize, top: regPadSize, bottom: nrwPadSize),
              child: cardHeaderText("Unique Item Card ID"),
            ),
            Padding(
              padding: const EdgeInsets.only(left: regPadSize),
              child: cardSubheaderText(itemCard.id)
            ),
            Padding(
              padding: const EdgeInsets.only(left: regPadSize, top: regPadSize, bottom: nrwPadSize),
              child: cardHeaderText("Description"),
            ),
            Padding(
              padding: const EdgeInsets.only(left: regPadSize),
              child: cardText(itemCard.desc)
            )
          ],
      ),
    );
  }
}