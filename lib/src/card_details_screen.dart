// card_screen.dart

import 'package:flutter/material.dart';
import 'package:card_maker/src/item_card.dart';
import 'package:card_maker/src/utils/text_utils.dart';
import 'package:card_maker/src/data_handler.dart';

// Display the details of an item card
class CardDetailsScreen extends StatelessWidget {
  CardDetailsScreen({Key? key, required this.itemCard}) : super(key: key);

  final ItemCard itemCard;
  final DataHandler dataHandler = DataHandler();

  static const regPaddingSize = 16.0;
  static const nrwPaddingSize = 4.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(itemCard.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              dataHandler.deleteItemCard(itemCard.id); 
            },
          )
        ],
      ),
      body:
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                left: regPaddingSize, top: regPaddingSize, bottom: nrwPaddingSize
              ),
              child: cardHeaderText("Unique Item Card ID"),
            ),
            Padding(
              padding: const EdgeInsets.only(left: regPaddingSize),
              child: cardSubheaderText(itemCard.id)
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: regPaddingSize, top: regPaddingSize, bottom: nrwPaddingSize
              ),
              child: cardHeaderText("Description"),
            ),
            Padding(
              padding: const EdgeInsets.only(left: regPaddingSize),
              child: cardText(itemCard.desc)
            )
          ],
      ),
    );
  }
}