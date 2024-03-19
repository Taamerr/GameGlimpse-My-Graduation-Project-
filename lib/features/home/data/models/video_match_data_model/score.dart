import 'score_data.dart';

class Score {
  int? id;
  int? typeId;
  int? fixtureId;
  int? participantId;
  ScoreData? scoreData;
  String? description;

  Score({
    this.id,
    this.typeId,
    this.fixtureId,
    this.participantId,
    this.scoreData,
    this.description,
  });

  factory Score.fromJson(Map<String, dynamic> json) => Score(
        id: json['id'] as int?,
        typeId: json['type_id'] as int?,
        fixtureId: json['fixture_id'] as int?,
        participantId: json['participant_id'] as int?,
        scoreData: json['score'] == null
            ? null
            : ScoreData.fromJson(json['score'] as Map<String, dynamic>),
        description: json['description'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'type_id': typeId,
        'fixture_id': fixtureId,
        'participant_id': participantId,
        'scoreData': scoreData?.toJson(),
        'description': description,
      };
}
