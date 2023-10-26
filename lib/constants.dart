class ApiConstants {
  static String baseUrl = 'https://api.scryfall.com';
  static String endpoint =
      '/cards/random?q=is:commander -type:background (game:paper) legal:commander';
  static String endpointOathbreaker =
      '/cards/random?q=is:oathbreaker (game:paper) legal:oathbreaker';
  static String endpointPDH =
      '/cards/random?q=is:commander (game:paper) legal:paupercommander -type:background';
}

class VersionConstants {
  static String version = '0.6';
}
