import 'package:flutter/material.dart';
import 'package:contacts_app/models/contact.dart';
import 'package:intl/intl.dart';

class ContactFormDialog extends StatefulWidget {
  final Contact? contact;
  final Function(Contact) onSave;
  final String userId;

  const ContactFormDialog({
    super.key,
    this.contact,
    required this.onSave,
    required this.userId,
  });

  @override
  State<ContactFormDialog> createState() => _ContactFormDialogState();
}

class _ContactFormDialogState extends State<ContactFormDialog> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _firstNameController;
  late TextEditingController _phoneNumberController;
  late TextEditingController _emailController;
  late TextEditingController _frequencyController;
  DateTime? _lastContactDate;

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController(text: widget.contact?.firstName);
    _phoneNumberController = TextEditingController(text: widget.contact?.phoneNumber);
    _emailController = TextEditingController(text: widget.contact?.email);
    _frequencyController = TextEditingController(
      text: widget.contact?.contactFrequencyDays.toString() ?? '90'
    );
    _lastContactDate = widget.contact?.lastContactDate;
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _phoneNumberController.dispose();
    _emailController.dispose();
    _frequencyController.dispose();
    super.dispose();
  }

  void _handleSave() {
    if (!_formKey.currentState!.validate()) return;

    final contact = Contact(
      id: widget.contact?.id ?? '',
      userId: widget.userId,
      firstName: _firstNameController.text,
      phoneNumber: _phoneNumberController.text,
      email: _emailController.text.isEmpty ? null : _emailController.text,
      contactFrequencyDays: int.parse(_frequencyController.text),
      lastContactDate: _lastContactDate,
      createdAt: widget.contact?.createdAt ?? DateTime.now(),
      updatedAt: DateTime.now(),
    );

    widget.onSave(contact);
    Navigator.of(context).pop();
  }

  Future<void> _selectDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _lastContactDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() => _lastContactDate = picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.contact == null ? 'Add Contact' : 'Edit Contact'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _firstNameController,
                decoration: const InputDecoration(
                  labelText: 'First Name',
                  prefixIcon: Icon(Icons.person_outline),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _phoneNumberController,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  prefixIcon: Icon(Icons.phone_outlined),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a phone number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email (Optional)',
                  prefixIcon: Icon(Icons.email_outlined),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _frequencyController,
                decoration: const InputDecoration(
                  labelText: 'Contact Frequency (days)',
                  prefixIcon: Icon(Icons.calendar_today_outlined),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter frequency';
                  }
                  if (int.tryParse(value) == null || int.parse(value) < 1) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              ListTile(
                title: const Text('Last Contact Date'),
                subtitle: Text(
                  _lastContactDate != null
                      ? DateFormat('MMM d, yyyy').format(_lastContactDate!)
                      : 'Not set',
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.calendar_month),
                  onPressed: _selectDate,
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _handleSave,
          child: Text(widget.contact == null ? 'Add' : 'Save'),
        ),
      ],
    );
  }
}
