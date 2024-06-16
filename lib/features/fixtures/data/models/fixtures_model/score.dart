class Score {
  int? goals;
  String? participant;

  Score({this.goals, this.participant});

  Score.fromJson(Map<String, dynamic> json) {
    goals = json['goals'];
    participant = json['participant'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['goals'] = goals;
    data['participant'] = participant;
    return data;
  }
}
