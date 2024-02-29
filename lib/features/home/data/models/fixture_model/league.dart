class League {
  num? id;
  String? name;
  String? country;
  String? logo;
  String? flag;
  num? season;
  String? round;

  League({
    this.id,
    this.name,
    this.country,
    this.logo,
    this.flag,
    this.season,
    this.round,
  });

  factory League.fromJson(Map<String, dynamic> json) => League(
        id: json['id'] as num?,
        name: json['name'] as String?,
        country: json['country'] as String?,
        logo: json['logo'] as String?,
        flag: json['flag'] as String?,
        season: json['season'] as num?,
        round: json['round'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'country': country,
        'logo': logo,
        'flag': flag,
        'season': season,
        'round': round,
      };
}
