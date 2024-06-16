import 'formation.dart';
import 'lineup.dart';
import 'statistic.dart';

class Data {
  int? id;
  int? sportId;
  int? leagueId;
  int? seasonId;
  int? stageId;
  dynamic groupId;
  dynamic aggregateId;
  int? roundId;
  int? stateId;
  int? venueId;
  String? name;
  String? startingAt;
  String? resultInfo;
  String? leg;
  dynamic details;
  int? length;
  bool? placeholder;
  bool? hasOdds;
  int? startingAtTimestamp;
  List<Lineup>? lineups;
  List<Statistic>? statistics;
  List<Formation>? formations;

  Data({
    this.id,
    this.sportId,
    this.leagueId,
    this.seasonId,
    this.stageId,
    this.groupId,
    this.aggregateId,
    this.roundId,
    this.stateId,
    this.venueId,
    this.name,
    this.startingAt,
    this.resultInfo,
    this.leg,
    this.details,
    this.length,
    this.placeholder,
    this.hasOdds,
    this.startingAtTimestamp,
    this.lineups,
    this.statistics,
    this.formations,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json['id'] as int?,
        sportId: json['sport_id'] as int?,
        leagueId: json['league_id'] as int?,
        seasonId: json['season_id'] as int?,
        stageId: json['stage_id'] as int?,
        groupId: json['group_id'] as dynamic,
        aggregateId: json['aggregate_id'] as dynamic,
        roundId: json['round_id'] as int?,
        stateId: json['state_id'] as int?,
        venueId: json['venue_id'] as int?,
        name: json['name'] as String?,
        startingAt: json['starting_at'] as String?,
        resultInfo: json['result_info'] as String?,
        leg: json['leg'] as String?,
        details: json['details'] as dynamic,
        length: json['length'] as int?,
        placeholder: json['placeholder'] as bool?,
        hasOdds: json['has_odds'] as bool?,
        startingAtTimestamp: json['starting_at_timestamp'] as int?,
        lineups: (json['lineups'] as List<dynamic>?)
            ?.map((e) => Lineup.fromJson(e as Map<String, dynamic>))
            .toList(),
        statistics: (json['statistics'] as List<dynamic>?)
            ?.map((e) => Statistic.fromJson(e as Map<String, dynamic>))
            .toList(),
        formations: (json['formations'] as List<dynamic>?)
            ?.map((e) => Formation.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'sport_id': sportId,
        'league_id': leagueId,
        'season_id': seasonId,
        'stage_id': stageId,
        'group_id': groupId,
        'aggregate_id': aggregateId,
        'round_id': roundId,
        'state_id': stateId,
        'venue_id': venueId,
        'name': name,
        'starting_at': startingAt,
        'result_info': resultInfo,
        'leg': leg,
        'details': details,
        'length': length,
        'placeholder': placeholder,
        'has_odds': hasOdds,
        'starting_at_timestamp': startingAtTimestamp,
        'lineups': lineups?.map((e) => e.toJson()).toList(),
        'statistics': statistics?.map((e) => e.toJson()).toList(),
        'formations': formations?.map((e) => e.toJson()).toList(),
      };
}
