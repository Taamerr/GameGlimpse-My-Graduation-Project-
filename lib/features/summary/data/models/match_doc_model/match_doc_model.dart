// ignore_for_file: public_member_api_docs, sort_constructors_first


class MatchDocModel {
  final int? matchId;
  final String? name;
  final String? videoLink;

  MatchDocModel({
    this.matchId,
    this.name,
    this.videoLink,
  });

  factory MatchDocModel.fromFirestore({
    required Map<String, dynamic> snapshot,
  }) {
    return MatchDocModel(
      matchId: snapshot['matchId'],
      name: snapshot['name'],
      videoLink: snapshot['videoLink'],
    );
  }
}
