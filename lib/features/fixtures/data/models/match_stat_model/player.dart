class Player {
  int? id;
  int? countryId;
  int? sportId;
  dynamic cityId;
  int? positionId;
  int? detailedPositionId;
  int? nationalityId;
  String? displayName;
  String? imagePath;

  Player({
    this.id,
    this.countryId,
    this.sportId,
    this.cityId,
    this.positionId,
    this.detailedPositionId,
    this.nationalityId,
    this.displayName,
    this.imagePath,
  });

  factory Player.fromJson(Map<String, dynamic> json) => Player(
        id: json['id'] as int?,
        countryId: json['country_id'] as int?,
        sportId: json['sport_id'] as int?,
        cityId: json['city_id'] as dynamic,
        positionId: json['position_id'] as int?,
        detailedPositionId: json['detailed_position_id'] as int?,
        nationalityId: json['nationality_id'] as int?,
        displayName: json['display_name'] as String?,
        imagePath: json['image_path'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'country_id': countryId,
        'sport_id': sportId,
        'city_id': cityId,
        'position_id': positionId,
        'detailed_position_id': detailedPositionId,
        'nationality_id': nationalityId,
        'display_name': displayName,
        'image_path': imagePath,
      };
}
