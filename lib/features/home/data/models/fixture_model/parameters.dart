class Parameters {
  String? league;
  String? season;
  String? date;

  Parameters({this.league, this.season, this.date});

  factory Parameters.fromJson(Map<String, dynamic> json) => Parameters(
        league: json['league'] as String?,
        season: json['season'] as String?,
        date: json['date'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'league': league,
        'season': season,
        'date': date,
      };
}
