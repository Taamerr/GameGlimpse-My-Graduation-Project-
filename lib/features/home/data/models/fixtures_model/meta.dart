class Meta {
  String? location;
  bool? winner;
  int? position;

  Meta({this.location, this.winner, this.position});

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        location: json['location'] as String?,
        winner: json['winner'] as bool?,
        position: json['position'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'location': location,
        'winner': winner,
        'position': position,
      };
}
