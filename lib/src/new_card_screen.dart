// new_card_screen.dart

import 'package:card_maker/src/utils/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class NewCardScreen extends StatelessWidget {
  NewCardScreen({ Key? key }) : super(key: key);

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    var typeOptions = ["Weapon", "Armour", "Staff", "Wand", "Wondrous Item", "Ring", "Scroll", "Potion"];
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
                FormBuilderTextField( // Name field
                  name: "name",
                  decoration: const InputDecoration(
                    labelText: "Name",
                    hintText: "The One Ring"
                  ),
                ),
                const SizedBox(height: 16.0),
                FormBuilderDropdown( // Type field
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
                ),
                const SizedBox(height: 16.0),
                FormBuilderDropdown( // Type field
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
                ),
                const SizedBox(height: 16.0),
                FormBuilderTextField( // Description field
                  name: "descField",
                  decoration: const InputDecoration(
                    labelText: "Description",
                    hintText: "Forged in the fires of Mount Doom, this ring...",
                  ),
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton( // Add button
                      onPressed: () {
                        final nameData =
                          _formKey.currentState!.fields["name"]!.value;
                        
                        FocusScope.of(context).unfocus();
                      },
                      child: const Text("Add"),
                    ),
                    ElevatedButton( // Reset button
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