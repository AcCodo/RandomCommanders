import 'package:commanders/models/ResponsePackageModel.dart';
import 'package:commanders/services/ApiService.dart';
import 'package:commanders/sharedComponents/MTGCardWidget.dart';
import 'package:commanders/sharedComponents/appBar.dart';
import 'package:commanders/sharedComponents/drawer.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<List<ResponsePackageModel>> futureCards;

  @override
  void initState() {
    super.initState();
    futureCards = ApiService().getCard();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      drawer: const GeneralDrawer(),
      body: FutureBuilder<List<ResponsePackageModel>>(
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
            final package = snapshot.data!;
            return ListView.separated(
              itemCount: package.length,
              itemBuilder: (context, index) {
                final card = package[index].card;
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
