import 'package:commanders/constants.dart';
import 'package:commanders/models/ConfigModel.dart';
import 'package:commanders/models/ResponsePackageModel.dart';
import 'package:http/http.dart' as http;
import '../models/CardModel.dart';

class ApiService {
  Future<List<ResponsePackageModel>> getCard(ConfigModel config) async {
    try {
      List<ResponsePackageModel> listaPack = [];

      var url = Uri.parse(ApiConstants.baseUrl + getEndpoint(config.edhRule));

      for (int i = 0; i < config.cardsToDraw; i++) {
        var response = await http.get(url);

        if (response.statusCode != 200) {
          throw Exception(
              "Erro na requisição Scryfall\nStatus code: ${response.statusCode}");
        }

        listaPack.add(ResponsePackageModel(
            card: cardModelFromJson(response.body),
            responseBody: response.body));

        Future.delayed(const Duration(milliseconds: 50));
      }

      listaPack = fixLista(listaPack);

      return listaPack;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<ResponsePackageModel>> getBulk(int numberOfPlayers, ConfigModel config) async {
    List<ResponsePackageModel> listaPack = [];

    var url = Uri.parse(ApiConstants.baseUrl + getEndpoint(config.edhRule));

    for (int i = 0; i < numberOfPlayers; i++) {
      var response = await http.get(url);

      if (response.statusCode != 200) {
        throw Exception(
            "Erro na requisição Scryfall\nStatus code: ${response.statusCode}");
      }

      listaPack.add(ResponsePackageModel(
          card: cardModelFromJson(response.body), responseBody: response.body));

      Future.delayed(const Duration(milliseconds: 50));
    }

    listaPack = fixLista(listaPack);

    return listaPack;
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

  String getEndpoint(EdhRules edhRule) {
    switch (edhRule) {
      case (EdhRules.commander):
        return ApiConstants.endpoint;
      case (EdhRules.oathbreaker):
        return ApiConstants.endpointOathbreaker;
      case (EdhRules.pauper):
        return ApiConstants.endpointPDH;
    }
  }
}
