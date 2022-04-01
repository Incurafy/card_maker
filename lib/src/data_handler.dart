// data_handler.dart

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:json_helpers/json_helpers.dart';
import 'package:card_maker/src/item_card.dart';
import 'package:card_maker/src/card_icons.dart';

class DataHandler {
  //String db = "http://my-json-server.typicode.com/incurafy/demo/cards";
  String db = "http://incurafy.aoakuma.com:9001/cards";

  Future<List<ItemCard>> fetchItemCards(bool shouldAlphabetise) async {
    final response = await http.get(Uri.parse(db));
    final futureItemCards = response.body.jsonList((e) => ItemCard.fromJson(e));

    if (response.statusCode == 200) {
      if (shouldAlphabetise) {
        futureItemCards.sort((a, b) {
          return a.name.toLowerCase().compareTo(b.name.toLowerCase());
        });
      }
      return futureItemCards;
    } else {
      throw Exception("Failed to load item card.");
    }
  }

  Future<ItemCard> createItemCard(String id, name, type, rarity, desc) async {
    final response = await http.post(Uri.parse(db),
      headers: <String, String>{
        "Content-Type": "application/json; charset=UTF-8",
      },
      body: jsonEncode(<String, String>{
        "id": id,
        "name": name,
        "type": type,
        "rarity": rarity,
        "desc": desc
      }),
    );

    if (response.statusCode == 201) {
      //print("Status code: 201 (Created)");
      return ItemCard.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to create an item card.");
    }
  }

  Future<http.Response> deleteItemCard(String id) async {
    final http.Response response = await http.delete(
      Uri.parse(db),
      headers: <String, String> {
        "Content-Type": "application/json; charset=UTF-8",
      },
    );

    return response;
  }

  // Choose which icon a card should use based on its type
  Icon chooseIcon(itemCards, index) {
    const double iconSize = 32.0;

    switch(itemCards[index].type) {
      case "weapon": {
        return const Icon(CardIcons.weapon, size: iconSize);
      }

      case "armour": {
        return const Icon(CardIcons.armour, size: iconSize);
      }

      case "staff": {
        return const Icon(CardIcons.staff, size: iconSize);
      }

      case "wand": {
        return const Icon(CardIcons.wand, size: iconSize);
      }

      case "wondrousItem": {
        return const Icon(CardIcons.wondrousItem, size: iconSize);
      }

      case "ring": {
        return const Icon(CardIcons.ring, size: iconSize);
      }

      case "scroll": {
        return const Icon(CardIcons.scroll, size: iconSize);
      }

      case "potion": {
        return const Icon(CardIcons.potion, size: iconSize);
      }

      default: {
        return const Icon(CardIcons.wondrousItem, size: iconSize);
      }
    }
  }
}
