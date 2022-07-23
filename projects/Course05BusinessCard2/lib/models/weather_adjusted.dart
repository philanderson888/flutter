class WeatherAdjusted {
  final int? id;
  final double? temperature;
  final String? description;

  WeatherAdjusted(
      {required this.id, required this.temperature, this.description});

  WeatherAdjusted.createPostObject(id, temperature, description)
      : id = id,
        temperature = temperature,
        description = description;

  Map<String, dynamic> toJson() =>
      {'id': id, 'temperature': temperature, 'description': description};

  WeatherAdjusted.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        temperature = json['temperature'],
        description = json['description'];
}
