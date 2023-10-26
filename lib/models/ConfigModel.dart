import 'package:commanders/models/ResponsePackageModel.dart';
import 'package:flutter/material.dart';

class ConfigModel extends ChangeNotifier {
  EdhRules edhRule = EdhRules.commander;
  int cardsToDraw = 3;
  List<ResponsePackageModel> recentCalls = [];

  void notifyChanges() {
    notifyListeners();
  }

  void setCardsToDraw(int cardsToDraw) {
    this.cardsToDraw = cardsToDraw;
    notifyListeners();
  }

  void setRecentCalls(List<ResponsePackageModel> newlist) {
    recentCalls = newlist;
    notifyListeners();
  }

  void addToRecentCalls(ResponsePackageModel item) {
    recentCalls.add(item);
  }

  void cleanRecentCalls() {
    recentCalls = [];
    notifyListeners();
  }

  ConfigModel getThis() {
    return this;
  }
}

enum EdhRules { commander, oathbreaker, pauper }
