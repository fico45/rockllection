import 'package:flutter_dotenv/flutter_dotenv.dart';

class Globals {}

class Tokens {
  static String supabaseUrl = '';
  static String supabaseAnonKey = '';
  static String iosClientId = '';
  static String webClientId = '';
  static String androidClientId = '';

  static Future<void> loadTokens() async {
    await dotenv.load();

    supabaseUrl = dotenv.env['SUPABASE_URL'] ?? '';
    supabaseAnonKey = dotenv.env['SUPABASE_ANON_KEY'] ?? '';
    iosClientId = dotenv.env['IOS_CLIENT_ID'] ?? '';
    webClientId = dotenv.env['WEB_CLIENT_ID'] ?? '';
    androidClientId = dotenv.env['ANDROID_CLIENT_ID'] ?? '';
  }
}
