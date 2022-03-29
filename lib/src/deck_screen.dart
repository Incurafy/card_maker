// deck_screen.dart

import 'package:flutter/material.dart';
import 'package:card_maker/src/card_screen.dart';
import 'package:card_maker/src/item_card.dart';

// Primary screen, displays the full list of item cards
class DeckScreen extends StatelessWidget {
  const DeckScreen({Key? key, required this.title, required this.itemCards})
      : super(key: key);

  final String title;
  final List<ItemCard> itemCards;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Card Deck"),
      ),
      // List of existing item cards
      body: ListView.builder(
          itemCount: itemCards.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(itemCards[index].itemName),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                      CardScreen(itemCard: itemCards[index])
                  )
                );
              }
            );
          }
        ),
    );
  }
}
