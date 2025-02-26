class Contact {
  final String id;
  final String userId;
  final String firstName;
  final String phoneNumber;
  final String? email;
  final int contactFrequencyDays;
  final DateTime? lastContactDate;
  final DateTime createdAt;
  final DateTime updatedAt;

  Contact({
    required this.id,
    required this.userId,
    required this.firstName,
    required this.phoneNumber,
    this.email,
    required this.contactFrequencyDays,
    this.lastContactDate,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      firstName: json['first_name'] as String,
      phoneNumber: json['phone_number'] as String,
      email: json['email'] as String?,
      contactFrequencyDays: json['contact_frequency_days'] as int,
      lastContactDate: json['last_contact_date'] != null
          ? DateTime.parse(json['last_contact_date'] as String)
          : null,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'first_name': firstName,
      'phone_number': phoneNumber,
      'email': email,
      'contact_frequency_days': contactFrequencyDays,
      'last_contact_date': lastContactDate?.toIso8601String(),
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  Contact copyWith({
    String? firstName,
    String? phoneNumber,
    String? email,
    int? contactFrequencyDays,
    DateTime? lastContactDate,
  }) {
    return Contact(
      id: id,
      userId: userId,
      firstName: firstName ?? this.firstName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      contactFrequencyDays: contactFrequencyDays ?? this.contactFrequencyDays,
      lastContactDate: lastContactDate ?? this.lastContactDate,
      createdAt: createdAt,
      updatedAt: DateTime.now(),
    );
  }
}
