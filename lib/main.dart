import 'package:commanders/ApiService.dart';
import 'package:commanders/CardModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'MTGCardWidget.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<CardModel>? allCards;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("Random Commander v0.1"))),
      body: Row(children: [
        MTGCardWidget(card: allCards?[0]),
        MTGCardWidget(card: allCards?[1]),
        MTGCardWidget(card: allCards?[2])
      ]),
      floatingActionButton: FloatingActionButton(
          onPressed: refreshCards, child: Icon(Icons.replay_outlined)),
    );
  }

  @override
  void initState() {
    super.initState();
    allCards = [
      CardModel(
          name: "",
          prices: Prices(usd: "X.X"),
          imageUris: ImageUris(large: ""),
          colorIdentity: []),
      CardModel(
          name: "",
          prices: Prices(usd: "X.X"),
          imageUris: ImageUris(large: ""),
          colorIdentity: []),
      CardModel(
          name: "",
          prices: Prices(usd: "X.X"),
          imageUris: ImageUris(large: ""),
          colorIdentity: []),
    ];
    _getData();
  }

  void _getData() async {
    allCards = (await ApiService().getCard())!;
    Future.delayed(const Duration(seconds: 10)).then((value) => setState(
          () {},
        ));
  }

  void refreshCards() async {
    _getData();

    print(allCards?[0].name);
    print(allCards?[1].name);
    print(allCards?[2].name);
  }
}
