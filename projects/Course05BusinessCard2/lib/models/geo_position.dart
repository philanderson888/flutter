class GeoPosition {
  final String? name;
  final String? state;
  final String? country;
  final double? lat;
  final double? lon;

  GeoPosition(
      {required this.name,
      required this.state,
      required this.country,
      required this.lat,
      required this.lon});

  @override
  String toString() {
    return '{name: $name, state: $state, country: $country, lat: $lat, lon: $lon}';
  }

  GeoPosition.createPostObject(name, state, country, lat, lon)
      : name = name,
        state = state,
        country = country,
        lat = lat,
        lon = lon;

  Map<String, dynamic> toJson() => {
        'name': name,
        'state': state,
        'country': country,
        'lat': lat,
        'lon': lon
      };

  GeoPosition.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        state = json['state'],
        country = json['country'],
        lat = json['lat'],
        lon = json['lon'];
}
