// main,dart

import 'package:flutter/material.dart';
import 'package:card_maker/src/item_card.dart';
import 'package:card_maker/src/card_details.dart';

// Main method, entry point into the program, nothing unusual.
// runApp inflates the given widget and attaches it to the screen.
void main() => runApp(const CardMakerApp());

// The root widget for the entire app (because it was called in main()).
// Extending "StatelessWidget" makes it a stateless widget, meaning that it's immutable.
class CardMakerApp extends StatelessWidget {
  // Constructor
  // {} means optional parameters in Dart
  // First : is a separator that specifies the initialiser list of the constructor
  // Second : is how a parameter is passed to a name function (super() in this case)
  // Keys preserve state when a widget is moved around in the widget tree
  const CardMakerApp({ Key? key }) : super(key: key); //

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Card Maker",
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(),
      ),
      home: const CardDeck(
        title: "Card Deck",
        itemCards: [ItemCard("Item Name", "This is the item's description.")],
      )
    );
  }
}

class CardDeck extends StatelessWidget {
  const CardDeck({Key? key, required this.title, required this.itemCards}) : super(key: key);

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
            title: Text(itemCards[index].itemName),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CardDetails(itemCard: itemCards[index])
                ) 
              );
            }
          );
        }
      ),
    );
  }
}
