class Goals {
  dynamic home;
  dynamic away;

  Goals({this.home, this.away});

  factory Goals.fromJson(Map<String, dynamic> json) => Goals(
        home: json['home'] as dynamic,
        away: json['away'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'home': home,
        'away': away,
      };
}
