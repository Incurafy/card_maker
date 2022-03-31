// data_handler.dart

import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:card_maker/src/item_card.dart';

class DataHandler {
  String db = "http://my-json-server.typicode.com/incurafy/demo/cards";

  Future<ItemCard> fetchItemCard() async {
    final response = await http.get(Uri.parse(db));

    if (response.statusCode == 200) {
      return ItemCard.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load item card.");
    }
  }

  Future<ItemCard> createItemCard(String id, name, type, rarity, desc) async {
    final response = await http.post(
      Uri.parse(db),
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
      print("Status code: 201");
      return ItemCard.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to create an item card.");
    }
  }
}