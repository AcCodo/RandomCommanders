import 'package:commanders/models/CardModel.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MTGCardWidget_small extends StatelessWidget {
  const MTGCardWidget_small({super.key, this.card});

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

    return InkWell(
      onTap: () async {
        final Uri url = Uri.parse(card!.scryfallUri!);
        if (!await launchUrl(url)) {
          throw Exception("Erro ao abrir Scryfall");
        }
      },
      child: Container(
        height: 240,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                height: 240,
                child: Image.network(
                  card!.imageUris!.large!,
                  fit: BoxFit.scaleDown,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        softWrap: true,
                        card!.name!,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(
                      children: [
                        Text(card!.colorIdentity!.join()),
                        const Text(' | '),
                        Text('\$$price'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
