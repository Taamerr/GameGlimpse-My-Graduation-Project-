import 'type.dart';

class Detail {
  int? id;
  String? standingType;
  int? standingId;
  int? typeId;
  int? value;
  Type? type;

  Detail({
    this.id,
    this.standingType,
    this.standingId,
    this.typeId,
    this.value,
    this.type,
  });

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        id: json['id'] as int?,
        standingType: json['standing_type'] as String?,
        standingId: json['standing_id'] as int?,
        typeId: json['type_id'] as int?,
        value: json['value'] as int?,
        type: json['type'] == null
            ? null
            : Type.fromJson(json['type'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'standing_type': standingType,
        'standing_id': standingId,
        'type_id': typeId,
        'value': value,
        'type': type?.toJson(),
      };
}
