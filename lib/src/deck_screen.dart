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
          Icon typeIcon;
          const double iconSize = 36.0;

          switch(itemCards[index].type) {
            case "weapon": {
              typeIcon = const Icon(CardIcons.weapon, size: iconSize);
            }
            break;

            case "armour": {
              typeIcon = const Icon(CardIcons.armour, size: iconSize);
            }
            break;

            case "staff": {
              typeIcon = const Icon(CardIcons.staff, size: iconSize);
            }
            break;

            case "wand": {
              typeIcon = const Icon(CardIcons.wand, size: iconSize);
            }
            break;

            case "wondrousItem": {
              typeIcon = const Icon(CardIcons.wondrousItem, size: iconSize);
            }
            break;

            case "ring": {
              typeIcon = const Icon(CardIcons.ring, size: iconSize);
            }
            break;

            case "scroll": {
              typeIcon = const Icon(CardIcons.scroll, size: iconSize);
            }
            break;

            case "potion": {
              typeIcon = const Icon(CardIcons.potion, size: iconSize);
            }
            break;

            default: {
              typeIcon = const Icon(CardIcons.wondrousItem, size: iconSize);
            }
          }

          return ListTile(
            leading: typeIcon,
            title:
              Text(itemCards[index].name,
                style: const TextStyle(
                  fontSize: 18,
                )
              ),
            subtitle:
              Text(itemCards[index].type + ", " + itemCards[index].rarity,
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