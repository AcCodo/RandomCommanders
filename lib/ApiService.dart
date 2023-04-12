import 'dart:developer';

import 'package:commanders/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'CardModel.dart';

class ApiService {
  Future<List<CardModel>?> getCard() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.endpoint);
      var response = await http.get(url);

      CardModel model1 = CardModel(),
          model2 = CardModel(),
          model3 = CardModel();

      while (response.statusCode != 200) {
        response = await http.get(url);
      }
      if (response.statusCode == 200) {
        print(response.body);
        model1 = cardModelFromJson(response.body);
      }
      response = await http.get(url);
      while (response.statusCode != 200) {
        response = await http.get(url);
      }
      if (response.statusCode == 200) {
        print(response.body);
        model2 = cardModelFromJson(response.body);
      }
      response = await http.get(url);
      while (response.statusCode != 200) {
        response = await http.get(url);
      }
      if (response.statusCode == 200) {
        print(response.body);
        model3 = cardModelFromJson(response.body);
      }

      List<CardModel> lista = [model1, model2, model3];
      lista = fixLista(lista);

      return lista;
    } catch (e) {
      log(e.toString());
    }
  }

  List<CardModel> fixLista(List<CardModel> lista) {
    for (int i = 0; i < lista.length; i++) {
      if (lista[i].name == null) lista[i].name = "";
      if (lista[i].prices == null) lista[i].prices = Prices(usd: "");
      if (lista[i].prices!.usd == null)
        lista[i].prices!.usd = lista[i].prices!.usdFoil;
      if (lista[i].colorIdentity == null) lista[i].colorIdentity = [];

      if (lista[i].cardFaces!.length != List.empty().length) {
        lista[i].imageUris =
            ImageUris(large: lista[i].cardFaces![0].imageUris!.large);
      }
    }
    return lista;
  }
}
