import 'meta.dart';

class Participant {
  int? id;
  int? sportId;
  int? countryId;
  int? venueId;
  String? name;
  String? shortCode;
  String? imagePath;
  Meta? meta;

  Participant({
    this.id,
    this.sportId,
    this.countryId,
    this.venueId,
    this.name,
    this.shortCode,
    this.imagePath,
    this.meta,
  });

  factory Participant.fromJson(Map<String, dynamic> json) => Participant(
        id: json['id'] as int?,
        sportId: json['sport_id'] as int?,
        countryId: json['country_id'] as int?,
        venueId: json['venue_id'] as int?,
        name: json['name'] as String?,
        shortCode: json['short_code'] as String?,
        imagePath: json['image_path'] as String?,
        meta: json['meta'] == null
            ? null
            : Meta.fromJson(json['meta'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'sport_id': sportId,
        'country_id': countryId,
        'venue_id': venueId,
        'name': name,
        'short_code': shortCode,
        'image_path': imagePath,
        'meta': meta?.toJson(),
      };
}
