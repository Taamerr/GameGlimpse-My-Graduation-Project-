// ignore_for_file: public_member_api_docs, sort_constructors_first

class MatchDocModel {
  final int? matchId;
  final String? name;
  final String? fullSummary;
  final String? goals;
  final String? redCards;
  final String? shots;
  final List<String>? matchClasses;

  MatchDocModel({
    this.matchId,
    this.name,
    this.fullSummary,
    this.goals,
    this.redCards,
    this.shots,
    this.matchClasses,
  });

  factory MatchDocModel.fromFirestore({
    required Map<String, dynamic> snapshot,
  }) {
    final List<String> classes = [
      snapshot['fullSummary'],
      snapshot['goals'],
      snapshot['shots'],
      snapshot['redCards'],
    ];
    return MatchDocModel(
      matchId: snapshot['matchId'],
      name: snapshot['name'],
      fullSummary: snapshot['fullSummary'],
      goals: snapshot['goals'],
      shots: snapshot['shots'],
      redCards: snapshot['redCards'],
      matchClasses: classes,
    );
  }
}
