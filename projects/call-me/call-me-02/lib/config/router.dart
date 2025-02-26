import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:contacts_app/screens/auth/login_screen.dart';
import 'package:contacts_app/screens/auth/register_screen.dart';
import 'package:contacts_app/screens/contacts/contacts_screen.dart';
import 'package:contacts_app/services/supabase_service.dart';

final router = GoRouter(
  initialLocation: '/login',
  redirect: (context, state) {
    final isAuthenticated = SupabaseService.currentUser != null;
    final isAuthRoute = state.matchedLocation == '/login' || 
                       state.matchedLocation == '/register';

    if (!isAuthenticated && !isAuthRoute) {
      return '/login';
    }

    if (isAuthenticated && isAuthRoute) {
      return '/contacts';
    }

    return null;
  },
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: '/contacts',
      builder: (context, state) => const ContactsScreen(),
    ),
  ],
);
