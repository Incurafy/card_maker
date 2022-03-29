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
      body: ListView(
        children: <Widget>[
          Card(
            child: ListTile(
              leading: const Icon(CardIcons.weapon, size: 36),
              title:
                //const Text("Brand",
                Text(itemCards[0].itemName,
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 18,
                  )),
              subtitle:
                Text(itemCards[0].itemId,
                //const Text("Fine greatsword, rare (requires attunement)",
                  style: const TextStyle(
                    fontStyle: FontStyle.italic,
                  )
                ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                      CardScreen(itemCard: itemCards[0])
                  )
                );
              }
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(CardIcons.weapon, size: 36),
              title:
                //const Text("Brand",
                Text(itemCards[1].itemName,
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 18,
                  )),
              subtitle:
                Text(itemCards[1].itemId,
                //const Text("Fine greatsword, rare (requires attunement)",
                  style: const TextStyle(
                    fontStyle: FontStyle.italic,
                  )
                ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                      CardScreen(itemCard: itemCards[1])
                  )
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}

/*       body: ListView.builder(
          itemCount: itemCards.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: cardHeaderText(itemCards[index].itemName),
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
        ), */
