class Fulltime {
  dynamic home;
  dynamic away;

  Fulltime({this.home, this.away});

  factory Fulltime.fromJson(Map<String, dynamic> json) => Fulltime(
        home: json['home'] as dynamic,
        away: json['away'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'home': home,
        'away': away,
      };
}
