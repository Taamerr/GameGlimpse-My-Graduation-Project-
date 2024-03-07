class Formation {
  int? id;
  int? fixtureId;
  int? participantId;
  String? formation;
  String? location;

  Formation({
    this.id,
    this.fixtureId,
    this.participantId,
    this.formation,
    this.location,
  });

  factory Formation.fromJson(Map<String, dynamic> json) => Formation(
        id: json['id'] as int?,
        fixtureId: json['fixture_id'] as int?,
        participantId: json['participant_id'] as int?,
        formation: json['formation'] as String?,
        location: json['location'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'fixture_id': fixtureId,
        'participant_id': participantId,
        'formation': formation,
        'location': location,
      };
}
