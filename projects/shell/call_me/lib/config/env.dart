import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  static String get supabaseUrl => dotenv.env['VITE_SUPABASE_URL'] ?? '';
  static String get supabaseAnonKey => dotenv.env['VITE_SUPABASE_ANON_KEY'] ?? '';

  static Future<void> initialize() async {
    await dotenv.load(fileName: '.env');
  }
}
