class Venue {
  num? id;
  String? name;
  String? city;

  Venue({this.id, this.name, this.city});

  factory Venue.fromJson(Map<String, dynamic> json) => Venue(
        id: json['id'] as num?,
        name: json['name'] as String?,
        city: json['city'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'city': city,
      };
}
