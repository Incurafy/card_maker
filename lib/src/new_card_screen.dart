// new_card_screen.dart

import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:card_maker/src/data_handler.dart';
import 'package:card_maker/src/item_card.dart';


class NewCardScreen extends StatefulWidget {
  const NewCardScreen({Key? key}) : super(key: key);

  @override
  State<NewCardScreen> createState() => _NewCardScreenState();
}

class _NewCardScreenState extends State<NewCardScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  DataHandler dataHandler = DataHandler();
  Uuid uuid = const Uuid();

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    Future<ItemCard>? _futureItemCard;

    List typeOptions = ["weapon", "armour", "staff", "wand", "ring", "wondrousItem", "scroll", "potion"];
    List rarityOptions = ["common", "uncommon", "rare", "very rare", "legendary", "artifact"];

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
                    hintText: "The One Ring"
                  ),
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
                          final _formData = _formKey.currentState!.value;

                          setState(() {
                            _futureItemCard = dataHandler.createItemCard(
                              uuid.v4(),                     // Random Unique ID
                              _formData.values.elementAt(0), // Name
                              _formData.values.elementAt(1), // Type
                              _formData.values.elementAt(2), // Rarity
                              _formData.values.elementAt(3)  // Description
                            );
                          });

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