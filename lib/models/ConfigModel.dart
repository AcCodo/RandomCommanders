import 'package:flutter/material.dart';

class ConfigModel extends ChangeNotifier {
  EdhRules edhRule = EdhRules.commander;
  int cardsToDraw = 3;

  void notifyChanges() {
    notifyListeners();
  }

  EdhRules getRuling() {
    return edhRule;
  }

  ConfigModel getThis() {
    return this;
  }
}

enum EdhRules { commander, oathbreaker, pauper }
