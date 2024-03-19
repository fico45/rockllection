import 'package:flutter_dotenv/flutter_dotenv.dart';

class Globals {}

class Tokens {
  static String apiBaseUrl = '';

  static Future<void> loadTokens() async {
    await dotenv.load();

    apiBaseUrl = dotenv.env['API_BASE_URL'] ?? '';
  }
}
