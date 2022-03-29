// main,dart

import 'package:flutter/material.dart';
import 'package:card_maker/src/deck_screen.dart';

void main() => runApp(const CardMakerApp());

class CardMakerApp extends StatelessWidget {
  const CardMakerApp({Key? key}) : super(key: key); //

  @override
  Widget build(BuildContext context) {    
    return MaterialApp(
      title: "Card Maker",
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(),
        //primarySwatch: Colors.deepPurple,
      ),
      home: const DeckScreen(
        title: "Card Deck",
      )
    );
  }
}
