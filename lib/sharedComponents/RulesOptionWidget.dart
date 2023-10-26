import 'package:commanders/models/ConfigModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RulesOptionWidget extends StatelessWidget {
  final String text;
  final EdhRules relatedRule;

  const RulesOptionWidget({
    super.key,
    required this.text,
    required this.relatedRule,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ConfigModel>(
      builder: (context, config, child) {
        if (config.edhRule == relatedRule) {
          return GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.deepPurpleAccent),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(text),
              ));
        } else {
          return GestureDetector(
              onTap: () {
                config.edhRule = relatedRule;
                config.notifyChanges();
              },
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Text(text),
              ));
        }
      },
    );
  }
}
