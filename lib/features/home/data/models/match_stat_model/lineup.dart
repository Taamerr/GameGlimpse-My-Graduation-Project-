import 'player.dart';

class Lineup {
  int? id;
  int? sportId;
  int? fixtureId;
  int? playerId;
  int? teamId;
  int? positionId;
  String? formationField;
  int? typeId;
  int? formationPosition;
  String? playerName;
  int? jerseyNumber;
  Player? player;

  Lineup({
    this.id,
    this.sportId,
    this.fixtureId,
    this.playerId,
    this.teamId,
    this.positionId,
    this.formationField,
    this.typeId,
    this.formationPosition,
    this.playerName,
    this.jerseyNumber,
    this.player,
  });

  factory Lineup.fromJson(Map<String, dynamic> json) => Lineup(
        id: json['id'] as int?,
        sportId: json['sport_id'] as int?,
        fixtureId: json['fixture_id'] as int?,
        playerId: json['player_id'] as int?,
        teamId: json['team_id'] as int?,
        positionId: json['position_id'] as int?,
        formationField: json['formation_field'] as String?,
        typeId: json['type_id'] as int?,
        formationPosition: json['formation_position'] as int?,
        playerName: json['player_name'] as String?,
        jerseyNumber: json['jersey_number'] as int?,
        player: json['player'] == null
            ? null
            : Player.fromJson(json['player'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'sport_id': sportId,
        'fixture_id': fixtureId,
        'player_id': playerId,
        'team_id': teamId,
        'position_id': positionId,
        'formation_field': formationField,
        'type_id': typeId,
        'formation_position': formationPosition,
        'player_name': playerName,
        'jersey_number': jerseyNumber,
        'player': player?.toJson(),
      };
}
