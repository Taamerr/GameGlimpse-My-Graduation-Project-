class League {
  int? id;
  int? sportId;
  int? countryId;
  String? name;
  String? imagePath;

  League({
    this.id,
    this.sportId,
    this.countryId,
    this.name,
    this.imagePath,
  });

  factory League.fromJson(Map<String, dynamic> json) => League(
        id: json['id'] as int?,
        sportId: json['sport_id'] as int?,
        countryId: json['country_id'] as int?,
        name: json['name'] as String?,
        imagePath: json['image_path'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'sport_id': sportId,
        'country_id': countryId,
        'name': name,
        'image_path': imagePath,
      };
}
