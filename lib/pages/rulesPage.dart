import 'package:commanders/sharedComponents/appBar.dart';
import 'package:flutter/material.dart';

class RulesPage extends StatefulWidget {
  const RulesPage({super.key});

  @override
  State<RulesPage> createState() => _RulesPageState();
}

class _RulesPageState extends State<RulesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          "- cada jogador vai roletar 3 cartas que podem ser Commanders\n- aí, dentre os 3 resultados você vai avaliar, e banir um daqueles\n- os restantes serão juntos na pool de commanders disponíveis\n- um por vez alguém irá escolher e remover uma opção da lista para ser seu Commander e montar seu deck!\n- depois vamos ser felizes e jogar!",
          softWrap: true,
        ),
      ),
    );
  }
}
