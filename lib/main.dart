// main,dart

import 'package:flutter/material.dart';
import 'package:card_maker/src/deck_screen.dart';
import 'package:card_maker/src/item_card.dart';
import 'package:uuid/uuid.dart';

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
  const CardMakerApp({Key? key}) : super(key: key); //

  @override
  Widget build(BuildContext context) {
    var uuid = const Uuid();
    
    return MaterialApp(
      title: "Card Maker",
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(),
        //primarySwatch: Colors.deepPurple,
      ),
      home: DeckScreen(
        title: "Card Deck",
        itemCards: [
          ItemCard(0, uuid.v4(), "Brand", "weapon", "rare", "This five-foot long ardite greatsword has a narrow blade and a hilt of wrought iron wrapped in grey leather. The blade is warm to the touch and shimmers with brilliant red and orange hues."),
          ItemCard(1, uuid.v4(), "Salamander Flame Gauntlets", "armour", "rare", "These dark metal gauntlets were forged using fire from the heart of a salamander."),
          ItemCard(2, uuid.v4(), "Nimbus, First Staff of the Thunderbirds", "staff", "artifact", "This ancient staff was created when a piece of driftwood was struck by lightning, fusing it to a twisted length of glass made from the sand on which it laid."),
        ],
      )
    );
  }
}
