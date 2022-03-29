// deck_screen.dart

import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:card_maker/src/card_icons.dart';
import 'package:card_maker/src/card_screen.dart';
import 'package:card_maker/src/item_card.dart';

class DeckScreen extends StatefulWidget {
  const DeckScreen({ Key? key }) : super(key: key);

  @override
  State<DeckScreen> createState() => _DeckScreenState();
}

class _DeckScreenState extends State<DeckScreen> {

  List itemCards = [];
  String db = "http://my-json-server.typicode.com/incurafy/demo/cards";

  Future<String> _getData() async {
    var response = await http.get(
      Uri.parse(Uri.encodeFull(db)),
      headers: {
        "Accept": "application/json"
      }
    );

    setState(() {
      var rawItemCards = jsonDecode(response.body);
      itemCards = [];
      for (var card in rawItemCards) {
        itemCards.add(ItemCard.fromJson(card));
      }
    });

    return "Success?";
  }

  @override
  // ignore: must_call_super
  void initState() {
    _getData();
  }

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
          const double iconSize = 32.0;

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

          return Card(
            child: ListTile(
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
            )
          );
        }
      ),
    );
  }
}
