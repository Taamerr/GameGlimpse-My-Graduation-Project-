class Periods {
  dynamic first;
  dynamic second;

  Periods({this.first, this.second});

  factory Periods.fromJson(Map<String, dynamic> json) => Periods(
        first: json['first'] as dynamic,
        second: json['second'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'first': first,
        'second': second,
      };
}
