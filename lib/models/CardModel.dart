// To parse this JSON data, do
//
//     final cardModel = cardModelFromJson(jsonString);

import 'dart:convert';

CardModel cardModelFromJson(String str) => CardModel.fromJson(json.decode(str));

class CardModel {
  CardModel({
    this.object,
    this.id,
    this.oracleId,
    this.multiverseIds,
    this.tcgplayerId,
    this.cardmarketId,
    this.name,
    this.lang,
    this.releasedAt,
    this.uri,
    this.scryfallUri,
    this.layout,
    this.highresImage,
    this.imageStatus,
    this.imageUris,
    this.manaCost,
    this.cmc,
    this.typeLine,
    this.oracleText,
    this.power,
    this.toughness,
    this.colors,
    this.colorIdentity,
    this.keywords,
    this.cardFaces,
    this.legalities,
    this.games,
    this.reserved,
    this.foil,
    this.nonfoil,
    this.finishes,
    this.oversized,
    this.promo,
    this.reprint,
    this.variation,
    this.setId,
    this.cardModelSet,
    this.setName,
    this.setType,
    this.setUri,
    this.setSearchUri,
    this.scryfallSetUri,
    this.rulingsUri,
    this.printsSearchUri,
    this.collectorNumber,
    this.digital,
    this.rarity,
    this.cardBackId,
    this.artist,
    this.artistIds,
    this.illustrationId,
    this.borderColor,
    this.frame,
    this.frameEffects,
    this.securityStamp,
    this.fullArt,
    this.textless,
    this.booster,
    this.storySpotlight,
    this.edhrecRank,
    this.pennyRank,
    this.prices,
    this.relatedUris,
    this.purchaseUris,
  });

  String? object;
  String? id;
  String? oracleId;
  List<num>? multiverseIds;
  num? tcgplayerId;
  num? cardmarketId;
  String? name;
  String? lang;
  DateTime? releasedAt;
  String? uri;
  String? scryfallUri;
  String? layout;
  bool? highresImage;
  String? imageStatus;
  ImageUris? imageUris;
  String? manaCost;
  num? cmc;
  String? typeLine;
  String? oracleText;
  String? power;
  String? toughness;
  List<String>? colors;
  List<String>? colorIdentity;
  List<String>? keywords;
  List<CardFace>? cardFaces;
  Legalities? legalities;
  List<String>? games;
  bool? reserved;
  bool? foil;
  bool? nonfoil;
  List<String>? finishes;
  bool? oversized;
  bool? promo;
  bool? reprint;
  bool? variation;
  String? setId;
  String? cardModelSet;
  String? setName;
  String? setType;
  String? setUri;
  String? setSearchUri;
  String? scryfallSetUri;
  String? rulingsUri;
  String? printsSearchUri;
  String? collectorNumber;
  bool? digital;
  String? rarity;
  String? cardBackId;
  String? artist;
  List<String>? artistIds;
  String? illustrationId;
  String? borderColor;
  String? frame;
  List<String>? frameEffects;
  String? securityStamp;
  bool? fullArt;
  bool? textless;
  bool? booster;
  bool? storySpotlight;
  num? edhrecRank;
  num? pennyRank;
  Prices? prices;
  RelatedUris? relatedUris;
  PurchaseUris? purchaseUris;

  factory CardModel.fromJson(Map<String, dynamic> json) => CardModel(
        object: json["object"],
        id: json["id"],
        oracleId: json["oracle_id"],
        multiverseIds: json["multiverse_ids"] == null
            ? []
            : List<num>.from(json["multiverse_ids"]!.map((x) => x)),
        tcgplayerId: json["tcgplayer_id"],
        cardmarketId: json["cardmarket_id"],
        name: json["name"],
        lang: json["lang"],
        releasedAt: json["released_at"] == null
            ? null
            : DateTime.parse(json["released_at"]),
        uri: json["uri"],
        scryfallUri: json["scryfall_uri"],
        layout: json["layout"],
        highresImage: json["highres_image"],
        imageStatus: json["image_status"],
        imageUris: json["image_uris"] == null
            ? null
            : ImageUris.fromJson(json["image_uris"]),
        manaCost: json["mana_cost"],
        cmc: json["cmc"],
        typeLine: json["type_line"],
        oracleText: json["oracle_text"],
        power: json["power"],
        toughness: json["toughness"],
        colors: json["colors"] == null
            ? []
            : List<String>.from(json["colors"]!.map((x) => x)),
        colorIdentity: json["color_identity"] == null
            ? []
            : List<String>.from(json["color_identity"]!.map((x) => x)),
        keywords: json["keywords"] == null
            ? []
            : List<String>.from(json["keywords"]!.map((x) => x)),
        cardFaces: json["card_faces"] == null
            ? []
            : List<CardFace>.from(
                json["card_faces"]!.map((x) => CardFace.fromJson(x))),
        legalities: json["legalities"] == null
            ? null
            : Legalities.fromJson(json["legalities"]),
        games: json["games"] == null
            ? []
            : List<String>.from(json["games"]!.map((x) => x)),
        reserved: json["reserved"],
        foil: json["foil"],
        nonfoil: json["nonfoil"],
        finishes: json["finishes"] == null
            ? []
            : List<String>.from(json["finishes"]!.map((x) => x)),
        oversized: json["oversized"],
        promo: json["promo"],
        reprint: json["reprint"],
        variation: json["variation"],
        setId: json["set_id"],
        cardModelSet: json["set"],
        setName: json["set_name"],
        setType: json["set_type"],
        setUri: json["set_uri"],
        setSearchUri: json["set_search_uri"],
        scryfallSetUri: json["scryfall_set_uri"],
        rulingsUri: json["rulings_uri"],
        printsSearchUri: json["prints_search_uri"],
        collectorNumber: json["collector_number"],
        digital: json["digital"],
        rarity: json["rarity"],
        cardBackId: json["card_back_id"],
        artist: json["artist"],
        artistIds: json["artist_ids"] == null
            ? []
            : List<String>.from(json["artist_ids"]!.map((x) => x)),
        illustrationId: json["illustration_id"],
        borderColor: json["border_color"],
        frame: json["frame"],
        frameEffects: json["frame_effects"] == null
            ? []
            : List<String>.from(json["frame_effects"]!.map((x) => x)),
        securityStamp: json["security_stamp"],
        fullArt: json["full_art"],
        textless: json["textless"],
        booster: json["booster"],
        storySpotlight: json["story_spotlight"],
        edhrecRank: json["edhrec_rank"],
        pennyRank: json["penny_rank"],
        prices: json["prices"] == null ? null : Prices.fromJson(json["prices"]),
        relatedUris: json["related_uris"] == null
            ? null
            : RelatedUris.fromJson(json["related_uris"]),
        purchaseUris: json["purchase_uris"] == null
            ? null
            : PurchaseUris.fromJson(json["purchase_uris"]),
      );
}

class CardFace {
  CardFace({
    this.object,
    this.name,
    this.manaCost,
    this.typeLine,
    this.oracleText,
    this.colors,
    this.power,
    this.toughness,
    this.artist,
    this.artistId,
    this.illustrationId,
    this.imageUris,
    this.flavorName,
    this.colorIndicator,
  });

  String? object;
  String? name;
  String? manaCost;
  String? typeLine;
  String? oracleText;
  List<String>? colors;
  String? power;
  String? toughness;
  String? artist;
  String? artistId;
  String? illustrationId;
  ImageUris? imageUris;
  String? flavorName;
  List<String>? colorIndicator;

  factory CardFace.fromJson(Map<String, dynamic> json) => CardFace(
        object: json["object"],
        name: json["name"],
        manaCost: json["mana_cost"],
        typeLine: json["type_line"],
        oracleText: json["oracle_text"],
        colors: json["colors"] == null
            ? []
            : List<String>.from(json["colors"]!.map((x) => x)),
        power: json["power"],
        toughness: json["toughness"],
        artist: json["artist"],
        artistId: json["artist_id"],
        illustrationId: json["illustration_id"],
        imageUris: json["image_uris"] == null
            ? null
            : ImageUris.fromJson(json["image_uris"]),
        flavorName: json["flavor_name"],
        colorIndicator: json["color_indicator"] == null
            ? []
            : List<String>.from(json["color_indicator"]!.map((x) => x)),
      );
}

class ImageUris {
  ImageUris({
    this.small,
    this.normal,
    this.large,
    this.png,
    this.artCrop,
    this.borderCrop,
  });

  String? small;
  String? normal;
  String? large;
  String? png;
  String? artCrop;
  String? borderCrop;

  factory ImageUris.fromJson(Map<String, dynamic> json) => ImageUris(
        small: json["small"],
        normal: json["normal"],
        large: json["large"],
        png: json["png"],
        artCrop: json["art_crop"],
        borderCrop: json["border_crop"],
      );
}

class Legalities {
  Legalities({
    this.standard,
    this.future,
    this.historic,
    this.gladiator,
    this.pioneer,
    this.explorer,
    this.modern,
    this.legacy,
    this.pauper,
    this.vintage,
    this.penny,
    this.commander,
    this.oathbreaker,
    this.brawl,
    this.historicbrawl,
    this.alchemy,
    this.paupercommander,
    this.duel,
    this.oldschool,
    this.premodern,
    this.predh,
  });

  String? standard;
  String? future;
  String? historic;
  String? gladiator;
  String? pioneer;
  String? explorer;
  String? modern;
  String? legacy;
  String? pauper;
  String? vintage;
  String? penny;
  String? commander;
  String? oathbreaker;
  String? brawl;
  String? historicbrawl;
  String? alchemy;
  String? paupercommander;
  String? duel;
  String? oldschool;
  String? premodern;
  String? predh;

  factory Legalities.fromJson(Map<String, dynamic> json) => Legalities(
        standard: json["standard"],
        future: json["future"],
        historic: json["historic"],
        gladiator: json["gladiator"],
        pioneer: json["pioneer"],
        explorer: json["explorer"],
        modern: json["modern"],
        legacy: json["legacy"],
        pauper: json["pauper"],
        vintage: json["vintage"],
        penny: json["penny"],
        commander: json["commander"],
        oathbreaker: json["oathbreaker"],
        brawl: json["brawl"],
        historicbrawl: json["historicbrawl"],
        alchemy: json["alchemy"],
        paupercommander: json["paupercommander"],
        duel: json["duel"],
        oldschool: json["oldschool"],
        premodern: json["premodern"],
        predh: json["predh"],
      );
}

class Prices {
  Prices({
    this.usd,
    this.usdFoil,
    this.usdEtched,
    this.eur,
    this.eurFoil,
    this.tix,
  });

  dynamic usd;
  String? usdFoil;
  dynamic usdEtched;
  dynamic eur;
  String? eurFoil;
  dynamic tix;

  factory Prices.fromJson(Map<String, dynamic> json) => Prices(
        usd: json["usd"],
        usdFoil: json["usd_foil"],
        usdEtched: json["usd_etched"],
        eur: json["eur"],
        eurFoil: json["eur_foil"],
        tix: json["tix"],
      );
}

class PurchaseUris {
  PurchaseUris({
    this.tcgplayer,
    this.cardmarket,
    this.cardhoarder,
  });

  String? tcgplayer;
  String? cardmarket;
  String? cardhoarder;

  factory PurchaseUris.fromJson(Map<String, dynamic> json) => PurchaseUris(
        tcgplayer: json["tcgplayer"],
        cardmarket: json["cardmarket"],
        cardhoarder: json["cardhoarder"],
      );
}

class RelatedUris {
  RelatedUris({
    this.gatherer,
    this.tcgplayerInfiniteArticles,
    this.tcgplayerInfiniteDecks,
    this.edhrec,
  });

  String? gatherer;
  String? tcgplayerInfiniteArticles;
  String? tcgplayerInfiniteDecks;
  String? edhrec;

  factory RelatedUris.fromJson(Map<String, dynamic> json) => RelatedUris(
        gatherer: json["gatherer"],
        tcgplayerInfiniteArticles: json["tcgplayer_infinite_articles"],
        tcgplayerInfiniteDecks: json["tcgplayer_infinite_decks"],
        edhrec: json["edhrec"],
      );
}
