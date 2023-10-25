import 'package:commanders/models/CardModel.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MTGCardWidget extends StatelessWidget {
  const MTGCardWidget({super.key, this.card});

  final CardModel? card;

  @override
  Widget build(BuildContext context) {
    String price;

    if (card!.prices == null) {
      price = '--';
    } else if (card!.prices!.usd == null) {
      price = '--';
    } else {
      price = card!.prices!.usd;
    }

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            iconSize: 500,
            splashRadius: 1,
            onPressed: () async {
              final Uri url = Uri.parse(card!.scryfallUri!);
              if (!await launchUrl(url)) {
                throw Exception("Erro ao abrir Scryfall");
              }
            },
            icon: Image.network(
              card!.imageUris!.large!,
              fit: BoxFit.scaleDown,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Text(
                card!.name!,
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(card!.colorIdentity!.join()),
                  const Text(' | '),
                  Text('\$$price'),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
