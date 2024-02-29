class Halftime {
  dynamic home;
  dynamic away;

  Halftime({this.home, this.away});

  factory Halftime.fromJson(Map<String, dynamic> json) => Halftime(
        home: json['home'] as dynamic,
        away: json['away'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'home': home,
        'away': away,
      };
}
