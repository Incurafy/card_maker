// new_card_screen.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:card_maker/src/item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class NewCardScreen extends StatefulWidget {
    const NewCardScreen({ Key? key }) : super(key: key);

  @override
  State<NewCardScreen> createState() => _NewCardScreenState();
}

class _NewCardScreenState extends State<NewCardScreen> {
  Future<ItemCard>? _futureItemCard;

  final _formKey = GlobalKey<FormBuilderState>();

  Future<ItemCard> createItemCard(String id, name, type, rarity, desc) async {
    String db = "http://my-json-server.typicode.com/incurafy/demo/cards";

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
      return ItemCard.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to create an item card.");
    }
  }

  @override
  Widget build(BuildContext context) {
    var typeOptions = ["Weapon", "Armour", "Staff", "Wand", "Ring", "Wondrous Item", "Scroll", "Potion"];
    var rarityOptions = ["Common", "Uncommon", "Rare", "Very Rare", "Legendary", "Artifact"];

    return Scaffold(
      appBar: AppBar(
        title: const Text("New Card"),
      ),
      body: FormBuilder(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column (
              children: [
                // Name field
                FormBuilderTextField(
                  name: "name",
                  decoration: const InputDecoration(
                    labelText: "Name",
                    hintText: "The One Ring"),
                  validator: (val) {
                    if (_formKey.currentState?.fields["name"]?.value
                        == "" || (val == null || val.isEmpty)) {
                      return "What kind of magic item doesn't have a name?!";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 16.0),

                // Type field
                FormBuilderDropdown(
                  name: "type",
                  decoration: const InputDecoration(
                    labelText: "Type",
                  ),
                  items: typeOptions.map((type) =>
                    DropdownMenuItem(
                      value: type, 
                      child: Text(type),
                    )
                  ).toList(),
                  validator: (val) {
                    if (_formKey.currentState?.fields["desc"]?.value == ""
                        || val == null) {
                      return "Typeless? How can it be typeless?!";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 16.0),

                // Rarity field
                FormBuilderDropdown(
                  name: "rarity",
                  decoration: const InputDecoration(
                    labelText: "Rarity",
                  ),
                  items: rarityOptions.map((rarity) =>
                    DropdownMenuItem(
                      value: rarity, 
                      child: Text(rarity),
                    )
                  ).toList(),
                  validator: (val) {
                    if (_formKey.currentState?.fields["desc"]?.value == ""
                        || val == null) {
                      return "If you think it's so priceless, call it an artifact!";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 16.0),

                // Desription field
                FormBuilderTextField(
                  name: "desc",
                  decoration: const InputDecoration(
                    labelText: "Description",
                    hintText: "Forged in the fires of Mount Doom, this ring...",
                  ),
                  validator: (val) {
                    if (_formKey.currentState?.fields["desc"]?.value == ""
                        || (val == null || val.isEmpty)) {
                      return "I don't care if it's made of the stuff of limbo, describe it!";
                    }
                    return null;
                  },
                ),
                
                const SizedBox(height: 30.0),

                // Add and Reset buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Add button
                    ElevatedButton(
                      onPressed: () async {
                        final isValid = _formKey.currentState?.validate();

                        if (isValid!) {
                          _formKey.currentState!.save();
                          final formData = _formKey.currentState!.value;
                          print(formData);

                          ////////////////////////////////
                          // TODO: Fix this with similar thing to the ItemCard factory
                          setState(() {
                            _futureItemCard = createItemCard(formData);
                          });
                          ////////////////////////////////

                          _formKey.currentState!.reset();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content:
                              Text("New card added to the deck!")
                            )
                          );
                        }

                        FocusScope.of(context).unfocus();
                      },
                      child: const Text("Add"),
                    ),

                    // Reset button
                    ElevatedButton(
                      onPressed: () {
                        _formKey.currentState!.reset();
                        FocusScope.of(context).unfocus();
                      },
                      child: const Text("Reset"),
                    ),
                  ],
                )
              ],
            )
          )
        )
      )
    );
  }

}