import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:contacts_app/config/env.dart';
import 'package:contacts_app/config/theme.dart';
import 'package:contacts_app/config/router.dart';
import 'package:contacts_app/services/supabase_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize environment variables
  await Env.initialize();
  
  // Initialize Supabase
  await SupabaseService.initialize();
  
  runApp(
    const ProviderScope(
      child: ContactsApp(),
    ),
  );
}

class ContactsApp extends StatelessWidget {
  const ContactsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Contacts App',
      theme: AppTheme.lightTheme,
      routerConfig: router,
    );
  }
}
