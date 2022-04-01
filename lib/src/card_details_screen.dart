// card_screen.dart

import 'package:card_maker/src/deck_screen.dart';
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
            onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text("Delete?"),
                content: const Text("Do you want to delete this item card?"),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, "No"),
                    child: const Text("No"),
                  ),
                  TextButton(
                    onPressed: () {
                      dataHandler.deleteItemCard(itemCard.id);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DeckScreen()),
                      );
                    },
                    child: const Text("Yes"),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
                left: regPaddingSize,
                top: regPaddingSize,
                bottom: nrwPaddingSize),
            child: cardHeaderText("Unique Item Card ID"),
          ),
          Padding(
              padding: const EdgeInsets.only(left: regPaddingSize),
              child: cardSubheaderText(itemCard.id)),
          Padding(
            padding: const EdgeInsets.only(
                left: regPaddingSize,
                top: regPaddingSize,
                bottom: nrwPaddingSize),
            child: cardHeaderText("Description"),
          ),
          Padding(
              padding: const EdgeInsets.only(left: regPaddingSize),
              child: cardText(itemCard.desc))
        ],
      ),
    );
  }
}
