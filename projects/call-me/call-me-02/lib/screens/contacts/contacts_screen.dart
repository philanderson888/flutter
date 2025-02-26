import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:contacts_app/providers/contacts_provider.dart';
import 'package:contacts_app/providers/auth_provider.dart';
import 'package:contacts_app/screens/contacts/contact_form_dialog.dart';
import 'package:contacts_app/models/contact.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

class ContactsScreen extends ConsumerWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(contactsProvider);
    final auth = ref.watch(authProvider);

    if (!auth.isAuthenticated) return const SizedBox.shrink();

    void showContactForm([Contact? contact]) {
      showDialog(
        context: context,
        builder: (context) => ContactFormDialog(
          contact: contact,
          userId: auth.user!.id,
          onSave: (contact) {
            if (contact.id.isEmpty) {
              ref.read(contactsProvider.notifier).addContact(contact);
            } else {
              ref.read(contactsProvider.notifier).updateContact(contact);
            }
          },
        ),
      );
    }

    Future<void> handleRandomContact() async {
      final contact = await ref.read(contactsProvider.notifier).getRandomContact();
      if (contact == null) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('No contacts due for contact'),
              backgroundColor: Colors.orange,
            ),
          );
        }
        return;
      }

      if (!context.mounted) return;

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Contact Suggestion'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Time to contact ${contact.firstName}!'),
              const SizedBox(height: 8),
              if (contact.lastContactDate != null) Text(
                'Last contacted: ${DateFormat('MMM d, yyyy').format(contact.lastContactDate!)}',
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Later'),
            ),
            if (contact.phoneNumber.isNotEmpty)
              ElevatedButton.icon(
                icon: const Icon(Icons.phone),
                label: const Text('Call'),
                onPressed: () {
                  launchUrl(Uri.parse('tel:${contact.phoneNumber}'));
                  Navigator.pop(context);
                },
              ),
            if (contact.email != null)
              ElevatedButton.icon(
                icon: const Icon(Icons.email),
                label: const Text('Email'),
                onPressed: () {
                  launchUrl(Uri.parse('mailto:${contact.email}'));
                  Navigator.pop(context);
                },
              ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shuffle),
            onPressed: handleRandomContact,
            tooltip: 'Suggest random contact',
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => showContactForm(),
            tooltip: 'Add contact',
          ),
        ],
      ),
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : state.error != null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Error: ${state.error}',
                        style: const TextStyle(color: Colors.red),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () => ref.read(contactsProvider.notifier).loadContacts(),
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                )
              : state.contacts.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.person_outline,
                            size: 64,
                            color: Colors.grey,
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'No contacts yet',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton.icon(
                            icon: const Icon(Icons.add),
                            label: const Text('Add Contact'),
                            onPressed: () => showContactForm(),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: state.contacts.length,
                      itemBuilder: (context, index) {
                        final contact = state.contacts[index];
                        return Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              child: Text(
                                contact.firstName[0].toUpperCase(),
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                            title: Text(contact.firstName),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (contact.phoneNumber.isNotEmpty)
                                  Text(contact.phoneNumber),
                                if (contact.email != null)
                                  Text(contact.email!),
                                Text(
                                  'Contact every ${contact.contactFrequencyDays} days',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () => showContactForm(contact),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: const Text('Delete Contact'),
                                        content: Text(
                                          'Are you sure you want to delete ${contact.firstName}?'
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(context),
                                            child: const Text('Cancel'),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              ref.read(contactsProvider.notifier)
                                                .deleteContact(contact.id);
                                              Navigator.pop(context);
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.red,
                                            ),
                                            child: const Text('Delete'),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
    );
  }
}
