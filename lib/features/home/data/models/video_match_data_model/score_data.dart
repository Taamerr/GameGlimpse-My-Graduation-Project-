class ScoreData {
  int? goals;
  String? participant;

  ScoreData({this.goals, this.participant});

  factory ScoreData.fromJson(Map<String, dynamic> json) => ScoreData(
        goals: json['goals'] as int?,
        participant: json['participant'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'goals': goals,
        'participant': participant,
      };
}
