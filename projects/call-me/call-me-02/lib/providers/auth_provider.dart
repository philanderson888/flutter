import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:contacts_app/services/supabase_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier();
});

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(AuthState(user: SupabaseService.currentUser));

  Future<void> signIn(String email, String password) async {
    try {
      final response = await SupabaseService.client.auth.signInWithPassword(
        email: email,
        password: password,
      );
      state = AuthState(user: response.user);
    } catch (e) {
      state = AuthState(user: null, error: e.toString());
      rethrow;
    }
  }

  Future<void> signUp(String email, String password) async {
    try {
      final response = await SupabaseService.client.auth.signUp(
        email: email,
        password: password,
      );
      state = AuthState(user: response.user);
    } catch (e) {
      state = AuthState(user: null, error: e.toString());
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      await SupabaseService.client.auth.signOut();
      state = AuthState(user: null);
    } catch (e) {
      state = AuthState(user: state.user, error: e.toString());
      rethrow;
    }
  }
}

class AuthState {
  final User? user;
  final String? error;

  AuthState({this.user, this.error});

  bool get isAuthenticated => user != null;
}