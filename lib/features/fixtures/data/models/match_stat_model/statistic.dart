import 'stat_data.dart';
import 'type.dart';

class Statistic {
  int? id;
  int? fixtureId;
  int? typeId;
  int? participantId;
  StatData? data;
  String? location;
  Type? type;

  Statistic({
    this.id,
    this.fixtureId,
    this.typeId,
    this.participantId,
    this.data,
    this.location,
    this.type,
  });

  factory Statistic.fromJson(Map<String, dynamic> json) => Statistic(
        id: json['id'] as int?,
        fixtureId: json['fixture_id'] as int?,
        typeId: json['type_id'] as int?,
        participantId: json['participant_id'] as int?,
        data: json['data'] == null
            ? null
            : StatData.fromJson(json['data'] as Map<String, dynamic>),
        location: json['location'] as String?,
        type: json['type'] == null
            ? null
            : Type.fromJson(json['type'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'fixture_id': fixtureId,
        'type_id': typeId,
        'participant_id': participantId,
        'location': location,
        'type': type?.toJson(),
      };
}
