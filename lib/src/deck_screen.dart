// deck_screen.dart

import 'package:flutter/material.dart';
import 'package:card_maker/src/card_icons.dart';
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
      body: ListView.builder(
        itemCount: itemCards.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(CardIcons.weapon, size: 36),
            title:
              Text(itemCards[index].itemName,
                style: const TextStyle(
                  fontSize: 18,
                )
              ),
            subtitle:
              Text(itemCards[index].itemId,
                style: const TextStyle(
                  fontStyle: FontStyle.italic,
                )
              ),
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