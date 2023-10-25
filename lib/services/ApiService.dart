import 'package:commanders/constants.dart';
import 'package:commanders/models/ResponsePackageModel.dart';
import 'package:http/http.dart' as http;
import '../models/CardModel.dart';

class ApiService {
  Future<List<ResponsePackageModel>> getCard() async {
    try {
      List<ResponsePackageModel> listaPack = [];

      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.endpoint);
      var response = await http.get(url);

      while (response.statusCode != 200) {
        response = await http.get(url);
      }
      if (response.statusCode == 200) {
        listaPack.add(ResponsePackageModel(
            card: cardModelFromJson(response.body),
            responseBody: response.body));
      }

      response = await http.get(url);
      while (response.statusCode != 200) {
        response = await http.get(url);
      }
      if (response.statusCode == 200) {
        listaPack.add(ResponsePackageModel(
            card: cardModelFromJson(response.body),
            responseBody: response.body));
      }

      response = await http.get(url);
      while (response.statusCode != 200) {
        response = await http.get(url);
      }
      if (response.statusCode == 200) {
        listaPack.add(ResponsePackageModel(
            card: cardModelFromJson(response.body),
            responseBody: response.body));
      }

      listaPack = fixLista(listaPack);

      if (listaPack == []) {}

      return listaPack;
    } catch (e) {
      throw Exception(e);
    }
  }

  List<ResponsePackageModel> fixLista(List<ResponsePackageModel> listaPack) {
    for (int i = 0; i < listaPack.length; i++) {
      final lista = listaPack[i].card;
      lista.name ??= "";

      if (lista.prices == null) {
        lista.prices = Prices(usd: "--");
      } else if (lista.prices!.usd == null && lista.prices!.usdFoil != null) {
        lista.prices!.usd = '${lista.prices!.usdFoil!}*';
      } else {
        lista.prices!.usd == '--';
      }

      lista.colorIdentity ??= ['Colorless'];
      lista.colorIdentity =
          lista.colorIdentity!.isEmpty ? ['Colorless'] : lista.colorIdentity;

      if (lista.cardFaces!.length != List.empty().length) {
        lista.imageUris =
            ImageUris(large: lista.cardFaces![0].imageUris!.large);
      }

      listaPack[i].card = lista;
    }
    return listaPack;
  }
}
