import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:contacts_app/models/contact.dart';
import 'package:contacts_app/services/contact_service.dart';

final contactsProvider = StateNotifierProvider<ContactsNotifier, ContactsState>((ref) {
  return ContactsNotifier();
});

class ContactsNotifier extends StateNotifier<ContactsState> {
  ContactsNotifier() : super(ContactsState.initial()) {
    loadContacts();
  }

  Future<void> loadContacts() async {
    try {
      state = state.copyWith(isLoading: true);
      final contacts = await ContactService.getContacts();
      state = state.copyWith(
        contacts: contacts,
        isLoading: false,
        error: null,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  Future<void> addContact(Contact contact) async {
    try {
      state = state.copyWith(isLoading: true);
      final newContact = await ContactService.createContact(contact);
      state = state.copyWith(
        contacts: [...state.contacts, newContact],
        isLoading: false,
        error: null,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
      rethrow;
    }
  }

  Future<void> updateContact(Contact contact) async {
    try {
      state = state.copyWith(isLoading: true);
      final updatedContact = await ContactService.updateContact(contact);
      state = state.copyWith(
        contacts: state.contacts.map((c) => 
          c.id == contact.id ? updatedContact : c
        ).toList(),
        isLoading: false,
        error: null,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
      rethrow;
    }
  }

  Future<void> deleteContact(String id) async {
    try {
      state = state.copyWith(isLoading: true);
      await ContactService.deleteContact(id);
      state = state.copyWith(
        contacts: state.contacts.where((c) => c.id != id).toList(),
        isLoading: false,
        error: null,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
      rethrow;
    }
  }

  Future<Contact?> getRandomContact() async {
    try {
      return await ContactService.getRandomContact();
    } catch (e) {
      state = state.copyWith(error: e.toString());
      return null;
    }
  }
}

class ContactsState {
  final List<Contact> contacts;
  final bool isLoading;
  final String? error;

  ContactsState({
    required this.contacts,
    required this.isLoading,
    this.error,
  });

  factory ContactsState.initial() {
    return ContactsState(
      contacts: [],
      isLoading: false,
    );
  }

  ContactsState copyWith({
    List<Contact>? contacts,
    bool? isLoading,
    String? error,
  }) {
    return ContactsState(
      contacts: contacts ?? this.contacts,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}
