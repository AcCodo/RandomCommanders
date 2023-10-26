import 'package:commanders/models/ConfigModel.dart';
import 'package:commanders/sharedComponents/RulesOptionWidget.dart';
import 'package:commanders/sharedComponents/appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ConfigPage extends StatefulWidget {
  const ConfigPage({super.key});

  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  final genQntd = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                //Exclude pickable multiple commanders option,
                _buildFormField(),
                const SizedBox(
                  height: 20,
                ),
                _buildSaveButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFormField() {
    return Consumer<ConfigModel>(builder: (context, config, child) {
      genQntd.text = config.cardsToDraw.toString();

      return TextFormField(
        controller: genQntd,
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        validator: (value) {
          if (value != null &&
              int.tryParse(value)! < 1 &&
              int.tryParse(value)! > 10) {
            return "Número de Cartas geradas precisa ser entre 1 e 10";
          } else if (value == null || value.isEmpty) {
            return "Campo obrigatório";
          }
          return null;
        },
        decoration: const InputDecoration(
            hintText: 'Número de Cartas escolhidas',
            border: OutlineInputBorder()),
      );
    });
  }

  Widget _buildSaveButton() {
    return Placeholder();
  }
}
