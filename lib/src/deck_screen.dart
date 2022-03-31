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

  refreshDeck() {
    setState(() {
      futureItemCards = dataHandler.fetchItemCards();
    });
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
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  List<ItemCard>? itemCards = snapshot.data;
                  Icon typeIcon = dataHandler.chooseIcon(itemCards, index);
                  return Card(
                    child: ListTile(
                      leading: typeIcon,
                      title:
                        Text(
                          itemCards![index].name,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      subtitle: 
                        Text(
                          itemCards[index].type + ", " + itemCards[index].rarity,
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
                                itemCard: itemCards[index],
                              )
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
