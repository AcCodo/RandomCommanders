import 'dart:developer';

import 'package:commanders/constants.dart';
import 'package:http/http.dart' as http;
import 'CardModel.dart';

class ApiService {
  Future<List<CardModel>?> getCard() async {
    try {
      List<CardModel> lista = [];
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.endpoint);
      var response = await http.get(url);
      while (response.statusCode != 200) {
        response = await http.get(url);
      }
      if (response.statusCode == 200) {
        CardModel model = cardModelFromJson(response.body);
        lista.add(model);
      }
      response = await http.get(url);
      while (response.statusCode != 200) {
        response = await http.get(url);
      }
      if (response.statusCode == 200) {
        CardModel model = cardModelFromJson(response.body);
        lista.add(model);
      }
      response = await http.get(url);
      while (response.statusCode != 200) {
        response = await http.get(url);
      }
      if (response.statusCode == 200) {
        CardModel model = cardModelFromJson(response.body);
        lista.add(model);
      }

      return lista;
    } catch (e) {
      log(e.toString());
    }
  }
}
