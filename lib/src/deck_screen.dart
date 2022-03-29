// deck_screen.dart

import 'package:card_maker/src/card_icons.dart';
import 'package:flutter/material.dart';
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
        children: const <Widget>[
          Card(
            child: ListTile(
              leading: Icon(CardIcons.weapon, size: 36),
              title:
                Text("Brand",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  )),
              subtitle:
                Text("Fine greatsword, rare (requires attunement)",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                  )
              ),
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
