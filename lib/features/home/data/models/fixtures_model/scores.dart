import 'score.dart';

class Scores {
  int? id;
  int? fixtureId;
  int? typeId;
  int? participantId;
  Score? score;
  String? description;

  Scores({
    this.id,
    this.fixtureId,
    this.typeId,
    this.participantId,
    this.score,
    this.description,
  });

  factory Scores.fromJson(Map<String, dynamic> json) => Scores(
        id: json['id'] as int?,
        fixtureId: json['fixture_id'] as int?,
        typeId: json['type_id'] as int?,
        participantId: json['participant_id'] as int?,
        score: json['score'] == null
            ? null
            : Score.fromJson(json['score'] as Map<String, dynamic>),
        description: json['description'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'fixture_id': fixtureId,
        'type_id': typeId,
        'participant_id': participantId,
        'score': score?.toJson(),
        'description': description,
      };
}
