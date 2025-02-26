import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:contacts_app/config/env.dart';

class SupabaseService {
  static Future<void> initialize() async {
    await Supabase.initialize(
      url: Env.supabaseUrl,
      anonKey: Env.supabaseAnonKey,
    );
  }

  static SupabaseClient get client => Supabase.instance.client;
  
  static User? get currentUser => client.auth.currentUser;
  
  static Stream<AuthState> get authStateChanges => 
      client.auth.onAuthStateChange;
}
