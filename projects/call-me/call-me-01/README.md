# call_me

A new Flutter project.

## overview

i am building this app with the help of 'bolt.new' which has already built the web version of this project and is live at

https://call-my-contacts.netlify.app

so the goal is to transfer this app to a mobile app, using the working web app and the same database (supabase)

## Project Structure

lib/
├── main.dart
├── config/
│   ├── env.dart
│   ├── router.dart
│   └── theme.dart
├── models/
│   ├── contact.dart
│   └── user.dart
├── providers/
│   ├── auth_provider.dart
│   └── contacts_provider.dart
├── screens/
│   ├── auth/
│   │   ├── login_screen.dart
│   │   ├── register_screen.dart
│   │   └── reset_password_screen.dart
│   ├── contacts/
│   │   ├── contacts_screen.dart
│   │   ├── add_contact_screen.dart
│   │   └── edit_contact_screen.dart
│   └── home_screen.dart
├── services/
│   ├── supabase_service.dart
│   └── contact_service.dart
└── widgets/
├── contact_card.dart
├── contact_form.dart
└── common/
├── app_bar.dart
├── loading_indicator.dart
└── error_dialog.dart

## Key Features Implementation

1. Environment Configuration
2. Supabase Integration
3. State Management with Riverpod
4. Routing with GoRouter
5. Contact Management
6. Authentication Flow
7. UI Components

Would you like me to start creating any specific part of this Flutter app? I can help with:

1. Setting up the basic project structure
2. Implementing the authentication flow
3. Creating the contacts management screens
4. Setting up Supabase integration
5. Building the UI components
6. 