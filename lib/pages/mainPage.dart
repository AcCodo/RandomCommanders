import 'package:commanders/models/ConfigModel.dart';
import 'package:commanders/models/ResponsePackageModel.dart';
import 'package:commanders/services/ApiService.dart';
import 'package:commanders/sharedComponents/MTGCardWidget.dart';
import 'package:commanders/sharedComponents/MTGCardWidget_small.dart';
import 'package:commanders/sharedComponents/RulesOptionWidget.dart';
import 'package:commanders/sharedComponents/appBar.dart';
import 'package:commanders/sharedComponents/drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<List<ResponsePackageModel>> futureCards;
  bool zoomOut = false;

  @override
  void initState() {
    super.initState();
    final config = Provider.of<ConfigModel>(context, listen: false).getThis();
    futureCards = ApiService().getCard(config);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      drawer: const GeneralDrawer(),
      bottomNavigationBar: _buildBottomBar(),
      body: FutureBuilder<List<ResponsePackageModel>>(
        future: futureCards,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Erro ao buscar as cartas ${snapshot.error}"),
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
                if (zoomOut) {
                  return MTGCardWidget_small(
                    card: card,
                  );
                } else {
                  return MTGCardWidget(
                    card: card,
                  );
                }
              },
              separatorBuilder: (context, index) => const Divider(),
            );
          }
        },
      ),
      floatingActionButton: _buildActionButtons(),
    );
  }

  Widget _buildActionButtons() {
    if (!zoomOut) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                zoomOut = !zoomOut;
              });
            },
            child: zoomOut
                ? const Icon(Icons.zoom_out_map)
                : const Icon(Icons.zoom_in_map),
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
              onPressed: refreshCards,
              child: const Icon(Icons.replay_outlined)),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                zoomOut = !zoomOut;
              });
            },
            child: zoomOut
                ? const Icon(Icons.zoom_out_map)
                : const Icon(Icons.zoom_in_map),
          ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
              onPressed: refreshCards,
              child: const Icon(Icons.replay_outlined)),
        ],
      );
    }
  }

  void refreshCards() async {
    final config = Provider.of<ConfigModel>(context, listen: false).getThis();
    futureCards = ApiService().getCard(config);
    setState(() {});
  }

  Widget _buildBottomBar() {
    return Consumer<ConfigModel>(builder: (context, config, child) {
      return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_one),
            label: 'Commander',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_two),
            label: 'Oathbreaker',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_3),
            label: 'Pauper',
          ),
        ],
        currentIndex: config.edhRule.index,
        onTap: (index) {
          setState(() {
            if (index != config.edhRule.index) {
              config.edhRule = EdhRules.values[index];
              refreshCards();
            }
          });
        },
      );
    });
  }
}
