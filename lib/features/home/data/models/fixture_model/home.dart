class Home {
  num? id;
  String? name;
  String? logo;
  dynamic winner;

  Home({this.id, this.name, this.logo, this.winner});

  factory Home.fromJson(Map<String, dynamic> json) => Home(
        id: json['id'] as num?,
        name: json['name'] as String?,
        logo: json['logo'] as String?,
        winner: json['winner'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'logo': logo,
        'winner': winner,
      };
}
