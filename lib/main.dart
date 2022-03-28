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
    var id = uuid.v4();
    
    return MaterialApp(
      title: "Card Maker",
      theme: ThemeData(
        //colorScheme: const ColorScheme.dark(),
        primarySwatch: Colors.deepPurple,
      ),
      home: DeckScreen(
        title: "Card Deck",
        itemCards: [ItemCard(id, 0, "Item Name", "This is a description of the item.")],
      )
    );
  }
}
