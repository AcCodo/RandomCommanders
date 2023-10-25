import 'package:commanders/models/CardModel.dart';
import 'package:flutter/material.dart';

class ResponsePackageModel extends ChangeNotifier {
  CardModel card;
  String responseBody;

  ResponsePackageModel({required this.card, required this.responseBody}) {
    notifyListeners();
  }
}
