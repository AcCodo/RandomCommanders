import 'package:commanders/CardModel.dart';
import 'package:flutter/material.dart';

class MTGCardWidget extends StatelessWidget {
  const MTGCardWidget({super.key, this.card});

  final CardModel? card;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 500,
              child: Image.network(
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
                  style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text(card!.colorIdentity!.join())],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
