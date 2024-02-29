class Goals {
  num? goalsFor;
  num? against;

  Goals({this.goalsFor, this.against});

  factory Goals.fromJson(Map<String, dynamic> json) => Goals(
        goalsFor: json['for'] as num?,
        against: json['against'] as num?,
      );

  Map<String, dynamic> toJson() => {
        'for': goalsFor,
        'against': against,
      };
}
