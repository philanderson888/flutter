import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:contacts_app/config/theme.dart';
import 'package:contacts_app/services/supabase_service.dart';
import 'package:contacts_app/config/env.dart';

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
    return MaterialApp(
      title: 'Contacts App',
      theme: AppTheme.lightTheme,
      home: const Scaffold(
        body: Center(
          child: Text('Welcome to Contacts App'),
        ),
      ),
    );
  }
}