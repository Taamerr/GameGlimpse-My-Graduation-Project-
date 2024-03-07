import 'detail.dart';
import 'league.dart';
import 'participant.dart';

class Datum {
  int? id;
  int? sportId;
  int? leagueId;
  int? seasonId;
  int? stageId;
  dynamic groupId;
  int? roundId;
  int? participantId;
  int? standingRuleId;
  int? position;
  int? points;
  String? result;
  League? league;
  Participant? participant;
  List<Detail>? details;

  Datum({
    this.id,
    this.sportId,
    this.leagueId,
    this.seasonId,
    this.stageId,
    this.groupId,
    this.roundId,
    this.participantId,
    this.standingRuleId,
    this.position,
    this.points,
    this.result,
    this.league,
    this.participant,
    this.details,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'] as int?,
        sportId: json['sport_id'] as int?,
        leagueId: json['league_id'] as int?,
        seasonId: json['season_id'] as int?,
        stageId: json['stage_id'] as int?,
        groupId: json['group_id'] as dynamic,
        roundId: json['round_id'] as int?,
        participantId: json['participant_id'] as int?,
        standingRuleId: json['standing_rule_id'] as int?,
        position: json['position'] as int?,
        points: json['points'] as int?,
        result: json['result'] as String?,
        league: json['league'] == null
            ? null
            : League.fromJson(json['league'] as Map<String, dynamic>),
        participant: json['participant'] == null
            ? null
            : Participant.fromJson(json['participant'] as Map<String, dynamic>),
        details: (json['details'] as List<dynamic>?)
            ?.map((e) => Detail.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'sport_id': sportId,
        'league_id': leagueId,
        'season_id': seasonId,
        'stage_id': stageId,
        'group_id': groupId,
        'round_id': roundId,
        'participant_id': participantId,
        'standing_rule_id': standingRuleId,
        'position': position,
        'points': points,
        'result': result,
        'league': league?.toJson(),
        'participant': participant?.toJson(),
        'details': details?.map((e) => e.toJson()).toList(),
      };
}
