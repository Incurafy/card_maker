// deck_screen.dart

import 'package:flutter/material.dart';
import 'package:card_maker/src/data_handler.dart';
import 'package:card_maker/src/item_card.dart';
import 'package:card_maker/src/new_card_screen.dart';
import 'package:card_maker/src/card_screen.dart';

class DeckScreen extends StatefulWidget {
  const DeckScreen({ Key? key }) : super(key: key);

  @override
  State<DeckScreen> createState() => _DeckScreenState();
}

class _DeckScreenState extends State<DeckScreen> {
  DataHandler dataHandler = DataHandler();
  late Future<List<ItemCard>> futureItemCards;

  @override
  void initState() {
    super.initState();
    futureItemCards = dataHandler.fetchItemCards();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Card Deck"),
      ),
      body: Center (
        child: FutureBuilder<List<ItemCard>>(
          future: futureItemCards,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              //print(snapshot.data);
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  Icon typeIcon = dataHandler.chooseIcon(snapshot.data, index);
                  return Card(
                    child: ListTile(
                      leading: typeIcon,
                      title:
                        Text(
                          snapshot.data!.elementAt(index).name,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      subtitle: 
                        Text(
                          snapshot.data!.elementAt(index).type + ", "
                             + snapshot.data!.elementAt(index).rarity,
                          style: const TextStyle(
                            fontStyle: FontStyle.italic,
                          )
                        ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:(context) => 
                              CardScreen(
                                itemCard: snapshot.data!.elementAt(index)),
                          )
                        );
                      },
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text("ERROR: ${snapshot.error}");
            }

            return const CircularProgressIndicator();
          },
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const NewCardScreen(),
            )
          );
        },
        tooltip: 'New Card',
        child: const Icon(Icons.add),
      ),
    );
  }

}
