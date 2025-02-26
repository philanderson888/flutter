import 'package:contacts_app/models/contact.dart';
import 'package:contacts_app/services/supabase_service.dart';

class ContactService {
  static final _client = SupabaseService.client;

  static Future<List<Contact>> getContacts() async {
    final response = await _client
      .from('contacts')
      .select()
      .order('first_name', ascending: true);
    
    return response.map((json) => Contact.fromJson(json)).toList();
  }

  static Future<Contact> createContact(Contact contact) async {
    final response = await _client
      .from('contacts')
      .insert({
        'user_id': contact.userId,
        'first_name': contact.firstName,
        'phone_number': contact.phoneNumber,
        'email': contact.email,
        'contact_frequency_days': contact.contactFrequencyDays,
        'last_contact_date': contact.lastContactDate?.toIso8601String(),
      })
      .select()
      .single();

    return Contact.fromJson(response);
  }

  static Future<Contact> updateContact(Contact contact) async {
    final response = await _client
      .from('contacts')
      .update({
        'first_name': contact.firstName,
        'phone_number': contact.phoneNumber,
        'email': contact.email,
        'contact_frequency_days': contact.contactFrequencyDays,
        'last_contact_date': contact.lastContactDate?.toIso8601String(),
      })
      .eq('id', contact.id)
      .select()
      .single();

    return Contact.fromJson(response);
  }

  static Future<void> deleteContact(String id) async {
    await _client
      .from('contacts')
      .delete()
      .eq('id', id);
  }

  static Future<Contact?> getRandomContact() async {
    final now = DateTime.now();
    final response = await _client
      .from('contacts')
      .select()
      .or('last_contact_date.is.null,last_contact_date.lte.${now.toIso8601String()}');

    if (response.isEmpty) return null;

    final contacts = response
      .map((json) => Contact.fromJson(json))
      .where((contact) {
        if (contact.lastContactDate == null) return true;
        final daysSinceLastContact = now.difference(contact.lastContactDate!).inDays;
        return daysSinceLastContact >= contact.contactFrequencyDays;
      })
      .toList();

    if (contacts.isEmpty) return null;
    return contacts[DateTime.now().millisecondsSinceEpoch % contacts.length];
  }
}
