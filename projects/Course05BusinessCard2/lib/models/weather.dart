class Weather {
  final int? id;
  final String? main;
  final String? description;
  final String? icon;

  Weather(
      {required this.id,
      required this.main,
      required this.description,
      required this.icon});

  Weather.createPostObject(id, main, description, icon)
      : id = id,
        main = main,
        description = description,
        icon = icon;

  Map<String, dynamic> toJson() =>
      {'id': id, 'main': main, 'description': description, 'icon': icon};

  Weather.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        main = json['main'],
        description = json['description'],
        icon = json['icon'];
}
