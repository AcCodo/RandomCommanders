import 'package:commanders/ApiService.dart';
import 'package:commanders/CardModel.dart';
import 'package:commanders/cards_repository.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'MTGCardWidget.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    ),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<List<CardModel>> futureCards;
  final cardsRepo = CardsRepository();

  @override
  void initState() {
    super.initState();
    futureCards = ApiService().getCard();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("Random Commander v0.1"))),
      body: FutureBuilder<List<CardModel>>(
        future: futureCards,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child:
                  Text("Erro ao buscar as cartas " + snapshot.error.toString()),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text("Nenhuma carta retornada"),
            );
          } else {
            final cards = snapshot.data!;
            return ListView.separated(
              itemCount: cards.length,
              itemBuilder: (context, index) {
                final card = cards[index];
                return MTGCardWidget(
                  card: card,
                );
              },
              separatorBuilder: (context, index) => const Divider(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: refreshCards, child: const Icon(Icons.replay_outlined)),
    );
  }

  void refreshCards() async {
    futureCards = ApiService().getCard();
    setState(() {});
  }
}
