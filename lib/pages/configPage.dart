import 'package:commanders/sharedComponents/appBar.dart';
import 'package:flutter/material.dart';

class ConfigPage extends StatefulWidget {
  const ConfigPage({super.key});

  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  final genQntd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            child: Column(
              children: [
                Row(
                  children: [],
                ),
                //Exclude pickable multiple commanders option,
                TextFormField(
                  controller: genQntd,
                  decoration: const InputDecoration(
                      hintText: 'Número de Cartas escolhidas',
                      border: OutlineInputBorder()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
